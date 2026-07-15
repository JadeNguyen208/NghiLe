const { getClient, checkPin, docRowToApi, readJsonBody } = require('../lib/db');

module.exports = async (req, res) => {
  let supabase;
  try { supabase = getClient(); } catch (e) { return res.status(500).json({ error: e.message }); }

  if (req.method === 'GET') {
    const { data, error } = await supabase.from('docs').select('*').order('ngay_cap_nhat', { ascending: false });
    if (error) return res.status(500).json({ error: error.message });
    return res.status(200).json(data.map(docRowToApi));
  }

  if (req.method === 'POST') {
    if (!checkPin(req)) return res.status(401).json({ error: 'Sai mã chỉnh sửa. Vui lòng nhập đúng mã để thêm/sửa/xóa.' });
    const body = await readJsonBody(req);
    const { tieuDe, chuDe, link, ngayCapNhat } = body || {};
    if (!tieuDe || !chuDe) return res.status(400).json({ error: 'Thiếu tiêu đề hoặc chủ đề' });
    const row = {
      id: 'd_' + Date.now() + '_' + Math.random().toString(36).slice(2, 7),
      tieu_de: String(tieuDe),
      chu_de: String(chuDe),
      link: String(link || ''),
      ngay_cap_nhat: ngayCapNhat || new Date().toISOString()
    };
    const { data, error } = await supabase.from('docs').insert(row).select().single();
    if (error) return res.status(500).json({ error: error.message });
    return res.status(201).json(docRowToApi(data));
  }

  res.status(405).json({ error: 'Method not allowed' });
};
