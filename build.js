// Tao thu muc dist/ de dua len Firebase Hosting (ban tra cuu, chi doc).
const fs = require('fs');
const path = require('path');

const ROOT = __dirname;
const DIST = path.join(ROOT, 'dist');
const PUBLIC = path.join(ROOT, 'public');

function rmrf(p) {
  if (fs.existsSync(p)) fs.rmSync(p, { recursive: true, force: true });
}
function copyDir(src, dest) {
  fs.mkdirSync(dest, { recursive: true });
  for (const name of fs.readdirSync(src)) {
    const s = path.join(src, name);
    const d = path.join(dest, name);
    if (fs.statSync(s).isDirectory()) copyDir(s, d);
    else fs.copyFileSync(s, d);
  }
}

rmrf(DIST);
copyDir(PUBLIC, DIST);

const dataDir = path.join(DIST, 'data');
fs.mkdirSync(dataDir, { recursive: true });

// Bo truong history (chi la nhat ky chinh sua noi bo) cho ban cong khai gon nhe hon
const entries = JSON.parse(fs.readFileSync(path.join(ROOT, 'data.json'), 'utf8'))
  .map(({ history, ...rest }) => rest);
const reminders = JSON.parse(fs.readFileSync(path.join(ROOT, 'reminders.json'), 'utf8'));
const docs = JSON.parse(fs.readFileSync(path.join(ROOT, 'docs.json'), 'utf8'));

fs.writeFileSync(path.join(dataDir, 'entries.json'), JSON.stringify(entries), 'utf8');
fs.writeFileSync(path.join(dataDir, 'reminders.json'), JSON.stringify(reminders), 'utf8');
fs.writeFileSync(path.join(dataDir, 'docs.json'), JSON.stringify(docs), 'utf8');

const kb = f => Math.round(fs.statSync(path.join(dataDir, f)).size / 1024) + ' KB';
console.log('dist/ san sang:');
console.log('  entries.json  ', entries.length, 'muc  ', kb('entries.json'));
console.log('  reminders.json', reminders.length, 'muc  ', kb('reminders.json'));
console.log('  docs.json     ', docs.length, 'muc  ', kb('docs.json'));
