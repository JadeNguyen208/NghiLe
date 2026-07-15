const { getClient, checkPin, historyEntry, entryRowToApi, readJsonBody } = require('../../lib/db');

module.exports = async (req, res) => {
  let supabase;
  try { supabase = getClient(); } catch (e) { return res.status(500).json({ error: e.message }); }
  const { id } = req.query;

  if (req.method === 'PUT') {
    if (!checkPin(req)) return res.status(401).json({ error: 'Sai mã chỉnh sửa. Vui lòng nhập đúng mã để thêm/sửa/xóa.' });
    const { data: existing, error: findErr } = await supabase.from('entries').select('*').eq('id', id).single();
    if (findErr || !existing) return res.status(404).json({ error: 'Không tìm thấy mục này' });
    const body = await readJsonBody(req);
    const { chuDe, cauHoi, noiDung, traLoi, ngayCapNhat, linkCapNhat, nguoiSua } = body || {};
    const history = Array.isArray(existing.history) ? existing.history.slice() : [];
    history.push(historyEntry('cap_nhat', nguoiSua));
    const update = { history };
    if (chuDe !== undefined) update.chu_de = String(chuDe);
    if (cauHoi !== undefined) update.cau_hoi = String(cauHoi);
    if (noiDung !== undefined) update.noi_dung = String(noiDung);
    if (traLoi !== undefined) update.tra_loi = String(traLoi);
    if (ngayCapNhat !== undefined) update.ngay_cap_nhat = ngayCapNhat;
    if (linkCapNhat !== undefined) update.link_cap_nhat = String(linkCapNhat);
    const { data, error } = await supabase.from('entries').update(update).eq('id', id).select().single();
    if (error) return res.status(500).json({ error: error.message });
    return res.status(200).json(entryRowToApi(data));
  }

  if (req.method === 'DELETE') {
    if (!checkPin(req)) return res.status(401).json({ error: 'Sai mã chỉnh sửa. Vui lòng nhập đúng mã để thêm/sửa/xóa.' });
    const { error } = await supabase.from('entries').delete().eq('id', id);
    if (error) return res.status(500).json({ error: error.message });
    return res.status(200).json({ ok: true });
  }

  res.status(405).json({ error: 'Method not allowed' });
};
