const { getClient, checkPin, reminderRowToApi, readJsonBody } = require('../lib/db');

module.exports = async (req, res) => {
  let supabase;
  try { supabase = getClient(); } catch (e) { return res.status(500).json({ error: e.message }); }

  if (req.method === 'GET') {
    const { data, error } = await supabase.from('reminders').select('*').order('lunar_day', { ascending: true });
    if (error) return res.status(500).json({ error: error.message });
    return res.status(200).json(data.map(reminderRowToApi));
  }

  if (req.method === 'POST') {
    if (!checkPin(req)) return res.status(401).json({ error: 'Sai mã chỉnh sửa. Vui lòng nhập đúng mã để thêm/sửa/xóa.' });
    const body = await readJsonBody(req);
    const { dayType, lunarDay, specialLabel, onceDate, noiDung, luuY, phuTrach } = body || {};
    if (!dayType || !noiDung) return res.status(400).json({ error: 'Thiếu loại ngày hoặc nội dung' });
    const row = {
      id: 'rm_' + Date.now() + '_' + Math.random().toString(36).slice(2, 7),
      day_type: String(dayType),
      lunar_day: dayType === 'lunar' ? Number(lunarDay) : null,
      special_label: dayType === 'special' ? String(specialLabel || '') : null,
      once_date: dayType === 'once' ? String(onceDate || '') : null,
      noi_dung: String(noiDung),
      luu_y: String(luuY || ''),
      phu_trach: String(phuTrach || ''),
      hoan_thanh_ky: null
    };
    const { data, error } = await supabase.from('reminders').insert(row).select().single();
    if (error) return res.status(500).json({ error: error.message });
    return res.status(201).json(reminderRowToApi(data));
  }

  res.status(405).json({ error: 'Method not allowed' });
};
