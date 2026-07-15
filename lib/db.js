const { createClient } = require('@supabase/supabase-js');

function getClient() {
  const url = process.env.SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_KEY;
  if (!url || !key) {
    throw new Error('Thiếu cấu hình SUPABASE_URL / SUPABASE_SERVICE_KEY trên Vercel (Settings → Environment Variables)');
  }
  return createClient(url, key, { auth: { persistSession: false } });
}

function checkPin(req) {
  const EDIT_PIN = process.env.EDIT_PIN || 'nghile2026';
  const pin = req.headers['x-edit-pin'] || (req.body && req.body._pin);
  return pin === EDIT_PIN;
}

function historyEntry(action, nguoiSua) {
  return { action, at: new Date().toISOString(), nguoiSua: String(nguoiSua || '').trim() || 'Không rõ' };
}

function entryRowToApi(row) {
  return {
    id: row.id,
    chuDe: row.chu_de,
    cauHoi: row.cau_hoi,
    noiDung: row.noi_dung,
    traLoi: row.tra_loi,
    ngayCapNhat: row.ngay_cap_nhat,
    linkCapNhat: row.link_cap_nhat,
    history: row.history || []
  };
}

function reminderRowToApi(row) {
  return {
    id: row.id,
    dayType: row.day_type,
    lunarDay: row.lunar_day,
    specialLabel: row.special_label,
    onceDate: row.once_date,
    noiDung: row.noi_dung,
    luuY: row.luu_y,
    phuTrach: row.phu_trach,
    hoanThanhKy: row.hoan_thanh_ky
  };
}

function docRowToApi(row) {
  return {
    id: row.id,
    tieuDe: row.tieu_de,
    chuDe: row.chu_de,
    link: row.link,
    ngayCapNhat: row.ngay_cap_nhat
  };
}

async function readJsonBody(req) {
  if (req.body && typeof req.body === 'object') return req.body;
  return new Promise((resolve) => {
    let data = '';
    req.on('data', chunk => { data += chunk; });
    req.on('end', () => {
      try { resolve(JSON.parse(data || '{}')); } catch (e) { resolve({}); }
    });
  });
}

module.exports = { getClient, checkPin, historyEntry, entryRowToApi, reminderRowToApi, docRowToApi, readJsonBody };
