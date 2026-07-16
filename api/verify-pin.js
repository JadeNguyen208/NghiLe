const { readJsonBody } = require('../lib/db');

module.exports = async (req, res) => {
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });
  const EDIT_PIN = process.env.EDIT_PIN || '010203';
  const body = await readJsonBody(req);
  const pin = (body && body.pin) || req.headers['x-edit-pin'];
  if (pin === EDIT_PIN) return res.status(200).json({ ok: true });
  res.status(401).json({ error: 'Sai mã' });
};
