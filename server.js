const express = require('express');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;
const DATA_FILE = path.join(__dirname, 'data.json');
const REMINDERS_FILE = path.join(__dirname, 'reminders.json');
const EDIT_PIN = process.env.EDIT_PIN || 'nghile2026';

app.use(express.json({ limit: '2mb' }));
app.use(express.static(path.join(__dirname, 'public')));

let writeQueue = Promise.resolve();

function readJson(file) {
  if (!fs.existsSync(file)) return [];
  try {
    return JSON.parse(fs.readFileSync(file, 'utf8'));
  } catch (e) {
    return [];
  }
}
function writeJson(file, data) {
  writeQueue = writeQueue.then(() => {
    fs.writeFileSync(file, JSON.stringify(data, null, 2), 'utf8');
  });
  return writeQueue;
}

function requirePin(req, res, next) {
  const pin = req.get('x-edit-pin') || (req.body && req.body._pin);
  if (pin !== EDIT_PIN) {
    return res.status(401).json({ error: 'Sai mã chỉnh sửa. Vui lòng nhập đúng mã để thêm/sửa/xóa.' });
  }
  next();
}

function historyEntry(action, nguoiSua) {
  return { action, at: new Date().toISOString(), nguoiSua: String(nguoiSua || '').trim() || 'Không rõ' };
}

// ----- Hoi dap entries -----

app.get('/api/entries', (req, res) => {
  res.json(readJson(DATA_FILE));
});

app.post('/api/entries', requirePin, async (req, res) => {
  const { chuDe, cauHoi, noiDung, traLoi, ngayCapNhat, linkCapNhat, nguoiSua } = req.body || {};
  if (!chuDe || !noiDung) {
    return res.status(400).json({ error: 'Thiếu chủ đề hoặc nội dung' });
  }
  const entries = readJson(DATA_FILE);
  const entry = {
    id: 'q_' + Date.now() + '_' + Math.random().toString(36).slice(2, 7),
    chuDe: String(chuDe),
    cauHoi: String(cauHoi || ''),
    noiDung: String(noiDung),
    traLoi: String(traLoi || ''),
    ngayCapNhat: ngayCapNhat || new Date().toISOString(),
    linkCapNhat: String(linkCapNhat || ''),
    history: [historyEntry('tao_moi', nguoiSua)]
  };
  entries.push(entry);
  await writeJson(DATA_FILE, entries);
  res.status(201).json(entry);
});

app.put('/api/entries/:id', requirePin, async (req, res) => {
  const entries = readJson(DATA_FILE);
  const idx = entries.findIndex(e => e.id === req.params.id);
  if (idx === -1) return res.status(404).json({ error: 'Không tìm thấy mục này' });
  const { chuDe, cauHoi, noiDung, traLoi, ngayCapNhat, linkCapNhat, nguoiSua } = req.body || {};
  if (chuDe !== undefined) entries[idx].chuDe = String(chuDe);
  if (cauHoi !== undefined) entries[idx].cauHoi = String(cauHoi);
  if (noiDung !== undefined) entries[idx].noiDung = String(noiDung);
  if (traLoi !== undefined) entries[idx].traLoi = String(traLoi);
  if (ngayCapNhat !== undefined) entries[idx].ngayCapNhat = ngayCapNhat;
  if (linkCapNhat !== undefined) entries[idx].linkCapNhat = String(linkCapNhat);
  if (!Array.isArray(entries[idx].history)) entries[idx].history = [];
  entries[idx].history.push(historyEntry('cap_nhat', nguoiSua));
  await writeJson(DATA_FILE, entries);
  res.json(entries[idx]);
});

app.delete('/api/entries/:id', requirePin, async (req, res) => {
  const entries = readJson(DATA_FILE);
  const next = entries.filter(e => e.id !== req.params.id);
  if (next.length === entries.length) return res.status(404).json({ error: 'Không tìm thấy mục này' });
  await writeJson(DATA_FILE, next);
  res.json({ ok: true });
});

app.get('/api/entries-export.csv', (req, res) => {
  const entries = readJson(DATA_FILE);
  const esc = v => '"' + String(v || '').replace(/"/g, '""').replace(/\r?\n/g, ' ') + '"';
  const header = ['Ngày cập nhật', 'Chủ đề', 'Câu hỏi', 'Nội dung', 'Trả lời', 'Link'].map(esc).join(',');
  const rows = entries.map(e => [e.ngayCapNhat, e.chuDe, e.cauHoi, e.noiDung, e.traLoi, e.linkCapNhat].map(esc).join(','));
  const csv = '﻿' + [header, ...rows].join('\r\n');
  res.setHeader('Content-Type', 'text/csv; charset=utf-8');
  res.setHeader('Content-Disposition', 'attachment; filename="kho-hoi-dap.csv"');
  res.send(csv);
});

// ----- Nhac lich (reminders) -----

app.get('/api/reminders', (req, res) => {
  res.json(readJson(REMINDERS_FILE));
});

app.post('/api/reminders', requirePin, async (req, res) => {
  const { dayType, lunarDay, specialLabel, noiDung, luuY, phuTrach } = req.body || {};
  if (!dayType || !noiDung) return res.status(400).json({ error: 'Thiếu loại ngày hoặc nội dung' });
  const reminders = readJson(REMINDERS_FILE);
  const reminder = {
    id: 'rm_' + Date.now() + '_' + Math.random().toString(36).slice(2, 7),
    dayType: String(dayType),
    lunarDay: dayType === 'lunar' ? Number(lunarDay) : null,
    specialLabel: dayType === 'special' ? String(specialLabel || '') : null,
    noiDung: String(noiDung),
    luuY: String(luuY || ''),
    phuTrach: String(phuTrach || '')
  };
  reminders.push(reminder);
  await writeJson(REMINDERS_FILE, reminders);
  res.status(201).json(reminder);
});

app.put('/api/reminders/:id', requirePin, async (req, res) => {
  const reminders = readJson(REMINDERS_FILE);
  const idx = reminders.findIndex(r => r.id === req.params.id);
  if (idx === -1) return res.status(404).json({ error: 'Không tìm thấy mục này' });
  const { dayType, lunarDay, specialLabel, noiDung, luuY, phuTrach } = req.body || {};
  if (dayType !== undefined) reminders[idx].dayType = String(dayType);
  if (lunarDay !== undefined) reminders[idx].lunarDay = lunarDay === null ? null : Number(lunarDay);
  if (specialLabel !== undefined) reminders[idx].specialLabel = specialLabel;
  if (noiDung !== undefined) reminders[idx].noiDung = String(noiDung);
  if (luuY !== undefined) reminders[idx].luuY = String(luuY);
  if (phuTrach !== undefined) reminders[idx].phuTrach = String(phuTrach);
  await writeJson(REMINDERS_FILE, reminders);
  res.json(reminders[idx]);
});

app.delete('/api/reminders/:id', requirePin, async (req, res) => {
  const reminders = readJson(REMINDERS_FILE);
  const next = reminders.filter(r => r.id !== req.params.id);
  if (next.length === reminders.length) return res.status(404).json({ error: 'Không tìm thấy mục này' });
  await writeJson(REMINDERS_FILE, next);
  res.json({ ok: true });
});

app.listen(PORT, () => {
  console.log(`Kho hoi dap dang chay tai http://localhost:${PORT}`);
  console.log(`Ma chinh sua hien tai: ${EDIT_PIN}`);
});
