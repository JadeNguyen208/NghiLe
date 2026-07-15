const { getClient, checkPin, docRowToApi, readJsonBody } = require('../../lib/db');

module.exports = async (req, res) => {
  let supabase;
  try { supabase = getClient(); } catch (e) { return res.status(500).json({ error: e.message }); }
  const { id } = req.query;

  if (req.method === 'PUT') {
    if (!checkPin(req)) return res.status(401).json({ error: 'Sai mã chỉnh sửa. Vui lòng nhập đúng mã để thêm/sửa/xóa.' });
    const body = await readJsonBody(req);
    const { tieuDe, chuDe, link, noiDung, ngayCapNhat } = body || {};
    const update = {};
    if (tieuDe !== undefined) update.tieu_de = String(tieuDe);
    if (chuDe !== undefined) update.chu_de = String(chuDe);
    if (link !== undefined) update.link = String(link);
    if (noiDung !== undefined) update.noi_dung = String(noiDung);
    if (ngayCapNhat !== undefined) update.ngay_cap_nhat = ngayCapNhat;
    const { data, error } = await supabase.from('docs').update(update).eq('id', id).select().single();
    if (error) return res.status(500).json({ error: error.message });
    if (!data) return res.status(404).json({ error: 'Không tìm thấy mục này' });
    return res.status(200).json(docRowToApi(data));
  }

  if (req.method === 'DELETE') {
    if (!checkPin(req)) return res.status(401).json({ error: 'Sai mã chỉnh sửa. Vui lòng nhập đúng mã để thêm/sửa/xóa.' });
    const { error } = await supabase.from('docs').delete().eq('id', id);
    if (error) return res.status(500).json({ error: error.message });
    return res.status(200).json({ ok: true });
  }

  res.status(405).json({ error: 'Method not allowed' });
};
