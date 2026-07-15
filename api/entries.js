const { getClient, checkPin, historyEntry, entryRowToApi, readJsonBody } = require('../lib/db');

module.exports = async (req, res) => {
  let supabase;
  try { supabase = getClient(); } catch (e) { return res.status(500).json({ error: e.message }); }

  if (req.method === 'GET') {
    const { data, error } = await supabase.from('entries').select('*').order('ngay_cap_nhat', { ascending: false });
    if (error) return res.status(500).json({ error: error.message });
    return res.status(200).json(data.map(entryRowToApi));
  }

  if (req.method === 'POST') {
    if (!checkPin(req)) return res.status(401).json({ error: 'Sai mã chỉnh sửa. Vui lòng nhập đúng mã để thêm/sửa/xóa.' });
    const body = await readJsonBody(req);
    const { chuDe, cauHoi, noiDung, traLoi, ngayCapNhat, linkCapNhat, nguoiSua } = body || {};
    if (!chuDe || !noiDung) return res.status(400).json({ error: 'Thiếu chủ đề hoặc nội dung' });
    const row = {
      id: 'q_' + Date.now() + '_' + Math.random().toString(36).slice(2, 7),
      chu_de: String(chuDe),
      cau_hoi: String(cauHoi || ''),
      noi_dung: String(noiDung),
      tra_loi: String(traLoi || ''),
      ngay_cap_nhat: ngayCapNhat || new Date().toISOString(),
      link_cap_nhat: String(linkCapNhat || ''),
      history: [historyEntry('tao_moi', nguoiSua)]
    };
    const { data, error } = await supabase.from('entries').insert(row).select().single();
    if (error) return res.status(500).json({ error: error.message });
    return res.status(201).json(entryRowToApi(data));
  }

  res.status(405).json({ error: 'Method not allowed' });
};
