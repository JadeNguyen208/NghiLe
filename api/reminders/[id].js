const { getClient, checkPin, reminderRowToApi, readJsonBody } = require('../../lib/db');

module.exports = async (req, res) => {
  let supabase;
  try { supabase = getClient(); } catch (e) { return res.status(500).json({ error: e.message }); }
  const { id } = req.query;

  if (req.method === 'PUT') {
    if (!checkPin(req)) return res.status(401).json({ error: 'Sai mã chỉnh sửa. Vui lòng nhập đúng mã để thêm/sửa/xóa.' });
    const body = await readJsonBody(req);
    const { dayType, lunarDay, specialLabel, onceDate, noiDung, luuY, phuTrach, hoanThanhKy } = body || {};
    const update = {};
    if (dayType !== undefined) update.day_type = String(dayType);
    if (lunarDay !== undefined) update.lunar_day = lunarDay === null ? null : Number(lunarDay);
    if (specialLabel !== undefined) update.special_label = specialLabel;
    if (onceDate !== undefined) update.once_date = onceDate;
    if (noiDung !== undefined) update.noi_dung = String(noiDung);
    if (luuY !== undefined) update.luu_y = String(luuY);
    if (phuTrach !== undefined) update.phu_trach = String(phuTrach);
    if (hoanThanhKy !== undefined) update.hoan_thanh_ky = hoanThanhKy;
    const { data, error } = await supabase.from('reminders').update(update).eq('id', id).select().single();
    if (error) return res.status(500).json({ error: error.message });
    if (!data) return res.status(404).json({ error: 'Không tìm thấy mục này' });
    return res.status(200).json(reminderRowToApi(data));
  }

  if (req.method === 'DELETE') {
    if (!checkPin(req)) return res.status(401).json({ error: 'Sai mã chỉnh sửa. Vui lòng nhập đúng mã để thêm/sửa/xóa.' });
    const { error } = await supabase.from('reminders').delete().eq('id', id);
    if (error) return res.status(500).json({ error: error.message });
    return res.status(200).json({ ok: true });
  }

  res.status(405).json({ error: 'Method not allowed' });
};
