const { getClient } = require('../lib/db');

function esc(v) {
  return '"' + String(v || '').replace(/"/g, '""').replace(/\r?\n/g, ' ') + '"';
}

module.exports = async (req, res) => {
  let supabase;
  try { supabase = getClient(); } catch (e) { return res.status(500).json({ error: e.message }); }
  const { data, error } = await supabase.from('entries').select('*').order('ngay_cap_nhat', { ascending: false });
  if (error) return res.status(500).json({ error: error.message });

  const header = ['Ngày cập nhật', 'Chủ đề', 'Câu hỏi', 'Nội dung', 'Trả lời', 'Link'].map(esc).join(',');
  const rows = data.map(e => [e.ngay_cap_nhat, e.chu_de, e.cau_hoi, e.noi_dung, e.tra_loi, e.link_cap_nhat].map(esc).join(','));
  const csv = '﻿' + [header, ...rows].join('\r\n');

  res.setHeader('Content-Type', 'text/csv; charset=utf-8');
  res.setHeader('Content-Disposition', 'attachment; filename="kho-hoi-dap.csv"');
  res.status(200).send(csv);
};
