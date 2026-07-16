function escapeHtml(s){return (s||'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));}
function formatDate(iso){if(!iso) return ''; const d=new Date(iso); if(isNaN(d)) return iso; return d.toLocaleDateString('vi-VN');}
function normalize(s){return (s||'').toLocaleLowerCase('vi');}

function highlightText(escapedText, query){
  if(!query || !query.trim()) return escapedText;
  const esc = query.trim().replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  if(!esc) return escapedText;
  const re = new RegExp('('+esc+')', 'gi');
  return escapedText.replace(re, '<mark class="hl">$1</mark>');
}

function extractTitle(text){
  const lines = (text||'').split(/\r?\n/).map(l => l.trim()).filter(Boolean);
  const stripDeco = l => l
    .replace(/["*_]/g,'')
    .replace(/^[\u{1F300}-\u{1FAFF}☀-➿←-⇿✀-➿\s]+/gu,'')
    .replace(/[\u{1F300}-\u{1FAFF}☀-➿←-⇿✀-➿\s]+$/gu,'')
    .replace(/^[\-–—\s]+|[\-–—\s]+$/g,'')
    .trim();
  for(const raw of lines){
    const l = stripDeco(raw);
    if(!l) continue;
    if(/^\(?(LỜI NHẮC|NHẮC LỊCH)\)?$/i.test(l)) continue;
    if(/^[-=_.]{3,}$/.test(l)) continue;
    if(l.length < 6) continue;
    return l.length > 90 ? l.slice(0,90).trim()+'…' : l;
  }
  const fallback = (text||'').replace(/\s+/g,' ').trim();
  return fallback.length > 60 ? fallback.slice(0,60)+'…' : fallback;
}

const ICONS = {
  check:'<svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M20 6L9 17l-5-5"/></svg>',
  alert:'<svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="9"/><line x1="12" y1="8" x2="12" y2="13"/><circle cx="12" cy="16.3" r="0.6" fill="currentColor" stroke="none"/></svg>',
  calendar:'<svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>',
  link:'<svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10 13a5 5 0 0 0 7.5.5l2-2a5 5 0 0 0-7-7l-1 1"/><path d="M14 11a5 5 0 0 0-7.5-.5l-2 2a5 5 0 0 0 7 7l1-1"/></svg>',
  edit:'<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.12 2.12 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>',
  trash:'<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"/><path d="M19 6l-1 14a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2L5 6"/><path d="M10 11v6"/><path d="M14 11v6"/><path d="M9 6V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/></svg>',
  reply:'<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 17 4 12 9 7"/><path d="M20 18v-2a4 4 0 0 0-4-4H4"/></svg>',
  wand:'<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 4V2M15 16v-2M8 9h2M20 9h2M17.8 11.8L19 13M15 9l-9.2 9.2a1 1 0 0 0 0 1.4l.6.6a1 1 0 0 0 1.4 0L17 12.4M17.8 6.2L19 5"/></svg>'
};

const TOPICS = [
  'CHƯƠNG TRÌNH TU MÙA HẠ',
  'NGHI THỨC CẦU SIÊU',
  'NGHI THỨC TU TẬP TRƯỚC VÀ SAU KHI SÁM HỐI CHƯ TĂNG TRỰC TUYẾN',
  'NGHI THỨC TU TẬP SÁM HỐI CHUYỂN HÓA (BÀI TU SỐ 8)',
  'NGHI THỨC AN VỊ LÔ HƯƠNG, TƯỢNG PHẬT/KHÁNH TREO XE; GIẢI BÙA CHÚ, NƠI THỜ TÀ KIẾN',
  'BÀI CÚNG CÁC LỄ THÔNG DỤNG, CÁC VĂN BẠCH',
  'CÁC PHÁT NGUYỆN: TU LỤC HÒA, BẠCH 49 NGÀY, BẠCH 108 NGÀY HỒI HƯỚNG CHO CHÚNG SINH',
  'THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ',
  'CÁC VẤN ĐỀ KHÁC'
];

let state = {
  entries: [],
  reminders: [],
  docs: [],
  tab: 'archive',
  query: '',
  activeTopic: null,
  editingId: null,
  quickAnswerId: null,
  assistQuery: '',
  assistResult: null,
  assistMatches: [],
  topicPanelOpen: false,
  editPin: localStorage.getItem('kho-edit-pin') || null,
  editingReminderId: null,
  historyOpenId: null,
  remFormOpen: false,
  editingDocId: null,
  docFormOpen: false,
  docContentOpenId: null
};

function linkify(escapedText){
  return escapedText.replace(/(https?:\/\/[^\s<]+)/g, url => `<a href="${url}" target="_blank" rel="noopener">${url}</a>`);
}

async function api(path, opts){
  opts = opts || {};
  const isMutating = opts.method && opts.method !== 'GET';
  if(isMutating){
    opts.headers = Object.assign({}, opts.headers, state.editPin ? {'x-edit-pin': state.editPin} : {});
  }
  const res = await fetch(path, opts);
  if(res.status === 401){
    state.editPin = null;
    localStorage.removeItem('kho-edit-pin');
    updateLockUi();
    throw new Error('Cần mở khóa chỉnh sửa trước (bấm nút khóa ở sidebar) rồi thử lại.');
  }
  if(!res.ok){ const err = await res.json().catch(()=>({error:'Lỗi không xác định'})); throw new Error(err.error || 'Lỗi máy chủ'); }
  return res.status === 204 ? null : res.json();
}
async function loadEntries(){ state.entries = await api('/api/entries'); }
async function loadReminders(){ state.reminders = await api('/api/reminders'); }
async function loadDocs(){ state.docs = await api('/api/docs'); }

function ensureUnlocked(){
  if(state.editPin) return true;
  alert('Chế độ chỉnh sửa đang khóa. Bấm nút khóa ở góc trái (cuối thanh bên) và nhập mã để mở, rồi thử lại.');
  return false;
}
async function toggleLock(){
  if(state.editPin){
    state.editPin = null;
    localStorage.removeItem('kho-edit-pin');
    updateLockUi();
    return;
  }
  const pin = prompt('Nhập mã để mở khóa chỉnh sửa (mở đến khi bạn tự khóa lại):');
  if(!pin) return;
  try{
    const res = await fetch('/api/verify-pin', {
      method: 'POST', headers: {'Content-Type':'application/json'}, body: JSON.stringify({ pin })
    });
    if(!res.ok){ alert('Sai mã. Vui lòng thử lại.'); return; }
    state.editPin = pin;
    localStorage.setItem('kho-edit-pin', pin);
    updateLockUi();
  }catch(e){
    alert('Không kết nối được máy chủ để kiểm tra mã. Thử lại sau.');
  }
}
function updateLockUi(){
  const btn = document.getElementById('lockBtn');
  const label = document.getElementById('lockLabel');
  const icon = document.getElementById('lockIcon');
  if(!btn) return;
  btn.classList.toggle('unlocked', !!state.editPin);
  label.textContent = state.editPin ? 'Đang mở — bấm để khóa lại' : 'Đã khóa — bấm để mở chỉnh sửa';
  if(icon){
    icon.innerHTML = state.editPin
      ? '<rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 9.9-1"/>'
      : '<rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/>';
  }
}

function getAllTopics(){
  const set = new Set(TOPICS);
  state.entries.forEach(e => { if(e.chuDe) set.add(e.chuDe); });
  return Array.from(set);
}
function topicCount(t){ return state.entries.filter(e => e.chuDe === t).length; }

function filteredEntries(){
  let list = state.entries.slice();
  if(state.activeTopic) list = list.filter(e => e.chuDe === state.activeTopic);
  if(state.query.trim()){
    const q = normalize(state.query);
    list = list.filter(e => normalize([e.chuDe,e.cauHoi,e.noiDung,e.traLoi].join(' ')).includes(q));
  }
  return list;
}
function groupByTopic(list){
  const groups = {};
  list.forEach(e => { const k = e.chuDe || '(Chưa phân loại)'; (groups[k] = groups[k]||[]).push(e); });
  Object.keys(groups).forEach(k => groups[k].sort((a,b)=> new Date(b.ngayCapNhat)-new Date(a.ngayCapNhat)));
  const order = TOPICS.filter(t => groups[t]).concat(Object.keys(groups).filter(k => !TOPICS.includes(k)));
  return order.map(k => ({ topic:k, items:groups[k] }));
}

function renderSidebarTopics(){
  const panel = document.getElementById('topicPanel');
  const topics = getAllTopics();
  panel.innerHTML = topics.map(t => {
    const c = topicCount(t);
    return `<button class="topic-btn ${state.activeTopic===t?'active':''}" data-topic="${escapeHtml(t)}">${escapeHtml(t)}<span class="tb-count">${c}</span></button>`;
  }).join('');
  panel.querySelectorAll('.topic-btn').forEach(b => b.onclick = () => {
    state.activeTopic = state.activeTopic === b.dataset.topic ? null : b.dataset.topic;
    state.tab = 'archive';
    render();
  });
}

function todayLunar(){
  const now = new Date();
  const [ld, lm, ly, leap] = convertSolar2Lunar(now.getDate(), now.getMonth()+1, now.getFullYear(), 7);
  return { ld, lm, ly, leap };
}
function todayIso(){
  const now = new Date();
  return `${now.getFullYear()}-${String(now.getMonth()+1).padStart(2,'0')}-${String(now.getDate()).padStart(2,'0')}`;
}
function remindersForLunarDay(day){
  const t = todayIso();
  return state.reminders.filter(r => (r.dayType === 'lunar' && r.lunarDay === day) || (r.dayType === 'once' && r.onceDate === t));
}
function lunarDaysWithReminders(){
  return new Set(state.reminders.filter(r => r.dayType==='lunar').map(r => r.lunarDay));
}
function onceDatesWithReminders(){
  return new Set(state.reminders.filter(r => r.dayType==='once').map(r => r.onceDate));
}
function currentCycleKey(){
  const { lm, ly } = todayLunar();
  return `${ly}-${lm}`;
}
function isReminderDone(r){
  if(!r.hoanThanhKy) return false;
  return r.dayType === 'once' ? r.hoanThanhKy === 'done' : r.hoanThanhKy === currentCycleKey();
}
async function toggleReminderDone(r){
  if(!ensureUnlocked()) return;
  const value = isReminderDone(r) ? null : (r.dayType === 'once' ? 'done' : currentCycleKey());
  try{
    await api('/api/reminders/'+encodeURIComponent(r.id), {
      method:'PUT', headers:{'Content-Type':'application/json'},
      body: JSON.stringify({ hoanThanhKy: value })
    });
    await loadReminders(); render();
  }catch(err){ alert(err.message); }
}

function render(){
  const total = state.entries.length;
  const unanswered = state.entries.filter(e => !(e.traLoi && e.traLoi.trim())).length;
  const topicsUsed = new Set(state.entries.map(e=>e.chuDe)).size;
  document.getElementById('statsRow').innerHTML = `
    <div class="stat"><div class="num">${total}</div><div class="lbl">Hỏi đáp</div></div>
    <div class="stat"><div class="num">${topicsUsed}</div><div class="lbl">Chủ đề có dữ liệu</div></div>
    <div class="stat ${unanswered?'warn':''}"><div class="num">${unanswered}</div><div class="lbl">Chưa cập nhật phản hồi</div></div>
  `;
  document.querySelectorAll('.side-nav-item').forEach(b => b.classList.toggle('active', b.dataset.tab===state.tab));
  renderSidebarTopics();
  renderCalendarPanel();
  const el = document.getElementById('tabContent');
  if(state.tab==='archive') el.innerHTML = renderArchive();
  else if(state.tab==='add') el.innerHTML = renderAddForm();
  else if(state.tab==='reminders') el.innerHTML = renderReminders();
  else if(state.tab==='docs') el.innerHTML = renderDocs();
  else el.innerHTML = renderAssist();
  attachTabEvents();
}

function renderTodayBanner(){
  const { ld } = todayLunar();
  const list = remindersForLunarDay(ld);
  if(!list.length) return '';
  return `<div class="today-banner">
    ${ICONS.calendar.replace('width="12" height="12"','width="18" height="18"')}
    <div>
      <div class="tb-title">Hôm nay là ngày ${ld} âm lịch &mdash; có ${list.length} nhắc lịch</div>
      <div class="tb-sub">Xem chi tiết ở mục "Nhắc lịch" bên sidebar.</div>
    </div>
  </div>`;
}

function renderArchive(){
  const list = filteredEntries();
  const banner = renderTodayBanner();
  if(!list.length){
    return banner + `<div class="empty-state"><div class="big">Chưa có hỏi đáp nào khớp</div><div class="small">Thử từ khóa khác, hoặc thêm hỏi đáp mới từ menu bên trái.</div></div>`;
  }
  let html = banner;
  groupByTopic(list).forEach(g => {
    html += `<div class="topic-header"><h2>${escapeHtml(g.topic)}</h2><span class="rule"></span><span class="count">${g.items.length}</span></div>`;
    g.items.forEach(e => {
      const answered = e.traLoi && e.traLoi.trim();
      html += `<div class="card">
        <div class="card-top">
          <div class="meta">
            <span>${ICONS.calendar} ${formatDate(e.ngayCapNhat)}</span>
            ${e.linkCapNhat ? `<a href="${escapeHtml(e.linkCapNhat)}" target="_blank" rel="noopener">${ICONS.link} Xem tài liệu</a>` : ''}
          </div>
          <span class="pill ${answered?'ok':'warn'}">${answered?ICONS.check+' Đã hướng dẫn':ICONS.alert+' Chưa cập nhật phản hồi'}</span>
        </div>
        ${e.cauHoi ? `<div class="qa-block"><div class="qa-label">Câu hỏi</div><div class="cau-hoi-txt">${highlightText(escapeHtml(e.cauHoi), state.query)}</div></div>` : ''}
        <div class="qa-block"><div class="qa-label">Nội dung</div><div class="noi-dung-txt">${highlightText(escapeHtml(e.noiDung), state.query)}</div></div>
        <div class="qa-block"><div class="qa-label">Trả lời</div><div class="tra-loi-txt ${answered?'':'empty'}">${answered?highlightText(escapeHtml(e.traLoi), state.query):'Chưa cập nhật phản hồi.'}</div></div>
        <div class="card-actions">
          <button class="act-edit" data-edit="${e.id}">${ICONS.edit} Sửa</button>
          ${!answered ? `<button class="act-answer" data-quickanswer="${e.id}">${ICONS.reply} Cập nhật phản hồi</button>` : ''}
          <button class="act-delete" data-delete="${e.id}">${ICONS.trash} Xóa</button>
        </div>
        ${state.quickAnswerId===e.id ? `<div class="quick-answer">
          <textarea id="quickAnswerText" placeholder="Nhập nội dung hướng dẫn trả lời...">${escapeHtml(e.traLoi||'')}</textarea>
          <input type="text" id="quickAnswerName" placeholder="Tên người cập nhật (tùy chọn)" style="margin-top:8px;width:100%;padding:8px 10px;border:1px solid var(--border);border-radius:8px;font-size:.82rem;background:var(--surface);color:var(--ink);">
          <div class="qa-actions">
            <button class="btn-primary" data-savequick="${e.id}">Lưu phản hồi</button>
            <button class="btn-secondary" data-cancelquick="${e.id}">Hủy</button>
          </div>
        </div>` : ''}
        ${e.history && e.history.length ? `<button class="history-toggle" data-history="${e.id}">${state.historyOpenId===e.id?'Ẩn lịch sử chỉnh sửa':'Xem lịch sử chỉnh sửa ('+e.history.length+')'}</button>` : ''}
        ${state.historyOpenId===e.id && e.history ? `<div class="history-list">${e.history.slice().reverse().map(h => `${h.action==='tao_moi'?'Tạo mới':'Cập nhật'} bởi ${escapeHtml(h.nguoiSua)} lúc ${new Date(h.at).toLocaleString('vi-VN')}`).join('<br>')}</div>` : ''}
      </div>`;
    });
  });
  return html;
}

function renderAddForm(){
  const editing = state.editingId ? state.entries.find(x=>x.id===state.editingId) : null;
  return `<form class="entry-form" id="entryForm">
    ${editing ? `<div class="form-msg" style="margin:0 0 1rem;color:var(--ink-soft);">Đang chỉnh sửa mục đã lưu</div>` : ''}
    <div class="field">
      <label>Chủ đề *</label>
      <select id="f_chuDe" required>
        ${TOPICS.map(t => `<option value="${escapeHtml(t)}" ${editing&&editing.chuDe===t?'selected':''}>${escapeHtml(t)}</option>`).join('')}
      </select>
    </div>
    <div class="field">
      <label>Câu hỏi <span class="hint">(lời dẫn / thưa gửi, tùy chọn)</span></label>
      <textarea id="f_cauHoi">${escapeHtml(editing?.cauHoi||'')}</textarea>
    </div>
    <div class="field">
      <label>Nội dung *</label>
      <textarea id="f_noiDung" required style="min-height:160px;">${escapeHtml(editing?.noiDung||'')}</textarea>
    </div>
    <div class="field">
      <label>Trả lời <span class="hint">(để trống nếu chưa có hướng dẫn)</span></label>
      <textarea id="f_traLoi" style="min-height:120px;">${escapeHtml(editing?.traLoi||'')}</textarea>
    </div>
    <div class="field-row">
      <div class="field">
        <label>Ngày cập nhật</label>
        <input type="date" id="f_ngayCapNhat" value="${editing?.ngayCapNhat ? editing.ngayCapNhat.slice(0,10) : new Date().toISOString().slice(0,10)}">
      </div>
      <div class="field">
        <label>Link / tài liệu <span class="hint">(tùy chọn)</span></label>
        <input type="text" id="f_linkCapNhat" value="${escapeHtml(editing?.linkCapNhat||'')}" placeholder="https://...">
      </div>
    </div>
    <div class="field">
      <label>Tên người cập nhật <span class="hint">(tùy chọn, hiện trong lịch sử chỉnh sửa)</span></label>
      <input type="text" id="f_nguoiSua" placeholder="VD: ĐH Thoa">
    </div>
    <button type="submit" class="btn-primary" id="submitBtn">${editing?'Lưu thay đổi':'Lưu hỏi đáp'}</button>
    ${editing ? `<button type="button" class="btn-secondary" id="cancelEditBtn" style="margin-left:10px;">Hủy chỉnh sửa</button>` : ''}
    <div id="formMsg" class="form-msg"></div>
  </form>`;
}

function scoreEntry(entry, words){
  let score = 0;
  const chuDe = normalize(entry.chuDe), cauHoi = normalize(entry.cauHoi), noiDung = normalize(entry.noiDung), traLoi = normalize(entry.traLoi);
  words.forEach(w => {
    if(!w) return;
    if(chuDe.includes(w)) score += 2;
    if(cauHoi.includes(w)) score += 1;
    if(noiDung.includes(w)) score += 3;
    if(traLoi.includes(w)) score += 2;
  });
  return score;
}
function runAssist(query){
  const words = normalize(query).split(/[\s,.;:!?]+/).filter(w => w.length > 1);
  const scored = state.entries.map(e => ({entry:e, score:scoreEntry(e, words)})).filter(x=>x.score>0).sort((a,b)=>b.score-a.score).slice(0,5);
  state.assistMatches = scored.map(x=>x.entry);
  if(!state.assistMatches.length){
    state.assistResult = { ok:false, text:'Không tìm thấy mục nào liên quan trong kho hỏi đáp. Có thể chủ đề này chưa được ghi nhận — hãy thêm mới từ menu bên trái.' };
    return;
  }
  const top = state.assistMatches[0];
  const answered = top.traLoi && top.traLoi.trim();
  if(answered){
    state.assistResult = { ok:true, text:`Mục liên quan nhất — chủ đề "${top.chuDe}":\n\n${top.traLoi}` };
  }else{
    state.assistResult = { ok:false, text:`Mục liên quan nhất — chủ đề "${top.chuDe}" — hiện chưa có phản hồi trong kho. Vui lòng chờ NLCLB_BPHT cập nhật, hoặc gửi câu hỏi mới.` };
  }
}
function renderAssist(){
  let resultHtml = '';
  if(state.assistResult){
    const r = state.assistResult;
    resultHtml = `<div class="assist-result">
      <div class="verdict ${r.ok?'ok':'warn'}">${r.ok?ICONS.check+' Tìm thấy hướng dẫn':ICONS.alert+' Chưa có hướng dẫn đầy đủ'}</div>
      <div class="body-txt">${escapeHtml(r.text)}</div>
      ${state.assistMatches.length ? `<div class="related-list">
        <div class="rel-title">Mục đã tham khảo trong kho</div>
        ${state.assistMatches.map(m => `<div class="rel-item"><span><b>${escapeHtml(m.chuDe)}</b> — ${escapeHtml((m.noiDung||'').slice(0,70))}${m.noiDung && m.noiDung.length>70?'…':''}</span>${(m.traLoi&&m.traLoi.trim())?'':'<span class="rel-flag">Chưa cập nhật</span>'}</div>`).join('')}
      </div>` : ''}
    </div>`;
  }
  return `<div class="assist-box">
    <div class="lbl">${ICONS.wand} Nhập thắc mắc cần tra cứu</div>
    <textarea id="assistInput" placeholder="Ví dụ: Ngồi thiền 2 thời trong 1 ngày có cần cách nhau 30 phút không?">${escapeHtml(state.assistQuery)}</textarea>
    <div class="assist-note">Trợ lý tìm trong kho hỏi đáp đã có sẵn và trích lại đúng nội dung đã được NLCLB_BPHT hướng dẫn — không tự suy đoán câu trả lời.</div>
    <div style="margin-top:.9rem;"><button class="btn-primary" id="assistBtn">Tìm câu trả lời</button></div>
  </div>
  ${resultHtml}`;
}

function renderNewReminderForm(){
  if(!state.remFormOpen) return '';
  const editing = state.editingReminderId ? state.reminders.find(r => r.id === state.editingReminderId) : null;
  const kind = editing ? editing.dayType : 'lunar';
  return `<form class="entry-form" id="remForm" style="margin-bottom:1.6rem;">
    ${editing ? `<div class="form-msg" style="margin:0 0 1rem;color:var(--ink-soft);">Đang chỉnh sửa mục đã lưu</div>` : ''}
    <div class="field">
      <label>Kiểu nhắc *</label>
      <select id="rf_kind">
        <option value="lunar" ${kind==='lunar'?'selected':''}>Lặp lại hàng tháng (theo ngày âm)</option>
        <option value="once" ${kind==='once'?'selected':''}>Không lặp lại (một lần, theo ngày cụ thể)</option>
        <option value="special" ${kind==='special'?'selected':''}>Định kỳ khác (mô tả tự do, VD: Thứ bảy hàng tuần)</option>
      </select>
    </div>
    <div class="field" id="rf_lunarField">
      <label>Ngày âm lịch (1–30)</label>
      <input type="number" id="rf_lunarDay" min="1" max="30" value="${editing?.lunarDay || 1}">
    </div>
    <div class="field" id="rf_onceField" style="display:none;">
      <label>Ngày cụ thể</label>
      <input type="date" id="rf_onceDate" value="${editing?.onceDate || new Date().toISOString().slice(0,10)}">
    </div>
    <div class="field" id="rf_specialField" style="display:none;">
      <label>Mô tả định kỳ</label>
      <input type="text" id="rf_specialLabel" placeholder="VD: Chủ nhật hàng tuần" value="${escapeHtml(editing?.specialLabel||'')}">
    </div>
    <div class="field">
      <label>Nội dung *</label>
      <textarea id="rf_noiDung" required style="min-height:120px;">${escapeHtml(editing?.noiDung||'')}</textarea>
    </div>
    <div class="field">
      <label>Lưu ý <span class="hint">(tùy chọn)</span></label>
      <input type="text" id="rf_luuY" value="${escapeHtml(editing?.luuY||'')}">
    </div>
    <div class="field">
      <label>Phụ trách <span class="hint">(tùy chọn)</span></label>
      <input type="text" id="rf_phuTrach" placeholder="VD: ĐH Thoa" value="${escapeHtml(editing?.phuTrach||'')}">
    </div>
    <button type="submit" class="btn-primary">${editing?'Lưu thay đổi':'Lưu nhắc lịch'}</button>
    <button type="button" class="btn-secondary" id="remFormCancel" style="margin-left:10px;">Hủy</button>
    <div id="remFormMsg" class="form-msg"></div>
  </form>`;
}

function renderReminders(){
  const addToggle = `<div style="margin-bottom:1.2rem;"><button class="btn-secondary" id="remFormToggle">${state.remFormOpen ? 'Đóng biểu mẫu' : '+ Thêm nhắc lịch mới'}</button></div>`;
  const form = renderNewReminderForm();

  if(!state.reminders.length){
    return addToggle + form + `<div class="empty-state"><div class="big">Chưa có nhắc lịch nào</div><div class="small">Nhắc lịch sẽ hiện ở đây theo ngày âm lịch trong tháng.</div></div>`;
  }
  const { ld } = todayLunar();
  const t = todayIso();
  const lunarOnes = state.reminders.filter(r => r.dayType === 'lunar').sort((a,b)=>a.lunarDay-b.lunarDay);
  const specialOnes = state.reminders.filter(r => r.dayType === 'special');
  const onceOnes = state.reminders.filter(r => r.dayType === 'once').sort((a,b)=>(a.onceDate||'').localeCompare(b.onceDate||''));
  const allOrdered = lunarOnes.concat(onceOnes).concat(specialOnes);

  const summaryRows = allOrdered.map(r => {
    const isToday = (r.dayType==='lunar' && r.lunarDay===ld) || (r.dayType==='once' && r.onceDate===t);
    const dayLabel = r.dayType==='lunar' ? String(r.lunarDay) : r.dayType==='once' ? formatDate(r.onceDate) : escapeHtml(r.specialLabel);
    const done = isReminderDone(r);
    return `<tr class="${isToday?'today-row':''}">
      <td class="check-col"><input type="checkbox" class="rem-check" data-remcheck="${r.id}" ${done?'checked':''} aria-label="Đánh dấu hoàn thành"></td>
      <td class="day-col">${dayLabel}</td>
      <td><a class="sheet-link ${done?'done':''}" href="#rem-${r.id}">${escapeHtml(extractTitle(r.noiDung))}</a></td>
      <td>${r.phuTrach ? `<b class="rem-phutrach">${escapeHtml(r.phuTrach)}</b>` : ''}</td>
    </tr>`;
  }).join('');

  const summaryTable = `<div class="rem-summary">
    <table class="sheet-table">
      <thead><tr><th>Xong</th><th>Ngày</th><th>Tiêu đề</th><th>Phụ trách</th></tr></thead>
      <tbody>${summaryRows}</tbody>
    </table>
    <div class="cal-note" style="padding:8px 14px 12px;">Tick "Xong" tự bỏ khi sang tháng âm mới (mục một lần thì giữ nguyên).</div>
  </div>`;

  function card(r){
    const isToday = (r.dayType==='lunar' && r.lunarDay===ld) || (r.dayType==='once' && r.onceDate===t);
    const dayText = r.dayType==='lunar' ? 'Ngày '+r.lunarDay+' âm lịch'+(isToday?' — Hôm nay':'')
      : r.dayType==='once' ? 'Ngày '+formatDate(r.onceDate)+(isToday?' — Hôm nay':'')
      : escapeHtml(r.specialLabel);
    return `<div class="rem-card" id="rem-${r.id}" style="${isToday?'border-color:var(--maroon);':''}">
      <div class="rem-meta">
        <span>${dayText}</span>
        ${r.phuTrach ? `<span>Phụ trách: <b class="rem-phutrach">${escapeHtml(r.phuTrach)}</b></span>` : ''}
        ${isReminderDone(r) ? `<span class="pill ok">${ICONS.check} Đã xong</span>` : ''}
      </div>
      <div class="rem-body">${linkify(escapeHtml(r.noiDung))}</div>
      ${r.luuY ? `<div class="rem-note">${escapeHtml(r.luuY)}</div>` : ''}
      <div class="rem-actions">
        <button class="edit" data-remedit="${r.id}">${ICONS.edit} Sửa</button>
        <button class="del" data-remdelete="${r.id}">${ICONS.trash} Xóa</button>
      </div>
    </div>`;
  }

  let html = addToggle + form + summaryTable;
  const grouped = {};
  lunarOnes.forEach(r => { (grouped[r.lunarDay] = grouped[r.lunarDay]||[]).push(r); });
  Object.keys(grouped).map(Number).sort((a,b)=>a-b).forEach(day => {
    html += `<div class="rem-group-header"><h2>Ngày ${day} âm lịch${day===ld?' — Hôm nay':''}</h2><span class="rule"></span></div>`;
    grouped[day].forEach(r => html += card(r));
  });
  if(onceOnes.length){
    html += `<div class="rem-group-header"><h2>Một lần</h2><span class="rule"></span></div>`;
    onceOnes.forEach(r => html += card(r));
  }
  if(specialOnes.length){
    html += `<div class="rem-group-header"><h2>Định kỳ khác</h2><span class="rule"></span></div>`;
    specialOnes.forEach(r => html += card(r));
  }
  return html;
}

function renderDocForm(){
  if(!state.docFormOpen) return '';
  const editing = state.editingDocId ? state.docs.find(d => d.id === state.editingDocId) : null;
  return `<form class="entry-form" id="docForm" style="margin-bottom:1.6rem;">
    ${editing ? `<div class="form-msg" style="margin:0 0 1rem;color:var(--ink-soft);">Đang chỉnh sửa mục đã lưu</div>` : ''}
    <div class="field">
      <label>Tiêu đề *</label>
      <input type="text" id="df_tieuDe" required value="${escapeHtml(editing?.tieuDe||'')}">
    </div>
    <div class="field">
      <label>Chủ đề *</label>
      <select id="df_chuDe" required>
        ${TOPICS.map(t => `<option value="${escapeHtml(t)}" ${editing&&editing.chuDe===t?'selected':''}>${escapeHtml(t)}</option>`).join('')}
      </select>
    </div>
    <div class="field">
      <label>Link <span class="hint">(tùy chọn)</span></label>
      <input type="text" id="df_link" value="${escapeHtml(editing?.link||'')}" placeholder="https://...">
    </div>
    <div class="field">
      <label>Nội dung <span class="hint">(tùy chọn — dùng khi muốn lưu hẳn văn bản, không chỉ link)</span></label>
      <textarea id="df_noiDung" style="min-height:140px;">${escapeHtml(editing?.noiDung||'')}</textarea>
    </div>
    <div class="field">
      <label>Ngày cập nhật</label>
      <input type="date" id="df_ngayCapNhat" value="${editing?.ngayCapNhat ? editing.ngayCapNhat.slice(0,10) : new Date().toISOString().slice(0,10)}">
    </div>
    <button type="submit" class="btn-primary">${editing?'Lưu thay đổi':'Lưu tài liệu'}</button>
    <button type="button" class="btn-secondary" id="docFormCancel" style="margin-left:10px;">Hủy</button>
    <div id="docFormMsg" class="form-msg"></div>
  </form>`;
}

function renderDocs(){
  const addToggle = `<div style="margin-bottom:1.2rem;"><button class="btn-secondary" id="docFormToggle">${state.docFormOpen ? 'Đóng biểu mẫu' : '+ Thêm tài liệu mới'}</button></div>`;
  const form = renderDocForm();

  if(!state.docs.length){
    return addToggle + form + `<div class="empty-state"><div class="big">Chưa có tài liệu nào</div><div class="small">Thêm link/tài liệu tham khảo theo chủ đề để dễ tra cứu sau này.</div></div>`;
  }

  const groups = {};
  state.docs.forEach(d => { const k = d.chuDe || '(Chưa phân loại)'; (groups[k] = groups[k]||[]).push(d); });
  Object.keys(groups).forEach(k => groups[k].sort((a,b)=> new Date(b.ngayCapNhat)-new Date(a.ngayCapNhat)));
  const order = TOPICS.filter(t => groups[t]).concat(Object.keys(groups).filter(k => !TOPICS.includes(k)));

  let html = addToggle + form;
  order.forEach(topic => {
    html += `<div class="topic-header"><h2>${escapeHtml(topic)}</h2><span class="rule"></span><span class="count">${groups[topic].length}</span></div>`;
    groups[topic].forEach(d => {
      const hasContent = d.noiDung && d.noiDung.trim();
      const contentOpen = state.docContentOpenId === d.id;
      html += `<div class="doc-row">
        <div class="doc-main">
          ${d.link ? `<a href="${escapeHtml(d.link)}" target="_blank" rel="noopener" class="doc-title">${escapeHtml(d.tieuDe)}</a>` : `<span class="doc-title">${escapeHtml(d.tieuDe)}</span>`}
          <span class="doc-date">${ICONS.calendar} ${formatDate(d.ngayCapNhat)}</span>
        </div>
        <div class="doc-actions">
          ${hasContent ? `<button class="act-view" data-doccontent="${d.id}">${contentOpen?'Ẩn nội dung':'Xem nội dung'}</button>` : ''}
          <button class="act-edit" data-docedit="${d.id}">${ICONS.edit} Sửa</button>
          <button class="act-delete" data-docdelete="${d.id}">${ICONS.trash} Xóa</button>
        </div>
      </div>
      ${hasContent && contentOpen ? `<div class="doc-content">${escapeHtml(d.noiDung)}</div>` : ''}`;
    });
  });
  return html;
}

function attachTabEvents(){
  if(state.tab==='archive'){
    document.querySelectorAll('[data-edit]').forEach(b => b.onclick = () => {
      if(!ensureUnlocked()) return;
      state.editingId = b.dataset.edit; state.tab='add'; render();
    });
    document.querySelectorAll('[data-delete]').forEach(b => b.onclick = async () => {
      if(!ensureUnlocked()) return;
      if(!confirm('Xóa mục hỏi đáp này khỏi kho chung?')) return;
      try{
        await api('/api/entries/'+encodeURIComponent(b.dataset.delete), { method:'DELETE' });
        await loadEntries(); render();
      }catch(err){ alert(err.message); }
    });
    document.querySelectorAll('[data-quickanswer]').forEach(b => b.onclick = () => {
      if(!ensureUnlocked()) return;
      state.quickAnswerId = b.dataset.quickanswer; render();
    });
    document.querySelectorAll('[data-cancelquick]').forEach(b => b.onclick = () => { state.quickAnswerId = null; render(); });
    document.querySelectorAll('[data-savequick]').forEach(b => b.onclick = async () => {
      if(!ensureUnlocked()) return;
      const id = b.dataset.savequick;
      const text = document.getElementById('quickAnswerText').value.trim();
      const nguoiSua = document.getElementById('quickAnswerName').value.trim();
      try{
        await api('/api/entries/'+encodeURIComponent(id), {
          method:'PUT', headers:{'Content-Type':'application/json'},
          body: JSON.stringify({ traLoi:text, ngayCapNhat:new Date().toISOString(), nguoiSua })
        });
        state.quickAnswerId = null;
        await loadEntries(); render();
      }catch(err){ alert(err.message); }
    });
    document.querySelectorAll('[data-history]').forEach(b => b.onclick = () => {
      state.historyOpenId = state.historyOpenId === b.dataset.history ? null : b.dataset.history;
      render();
    });
  }
  if(state.tab==='add'){
    const form = document.getElementById('entryForm');
    if(form){
      form.onsubmit = async (ev) => {
        ev.preventDefault();
        if(!ensureUnlocked()) return;
        const chuDe = document.getElementById('f_chuDe').value;
        const cauHoi = document.getElementById('f_cauHoi').value.trim();
        const noiDung = document.getElementById('f_noiDung').value.trim();
        const traLoi = document.getElementById('f_traLoi').value.trim();
        const dateVal = document.getElementById('f_ngayCapNhat').value;
        const linkCapNhat = document.getElementById('f_linkCapNhat').value.trim();
        const nguoiSua = document.getElementById('f_nguoiSua').value.trim();
        const msg = document.getElementById('formMsg');
        const btn = document.getElementById('submitBtn');
        if(!chuDe || !noiDung){ msg.textContent='Cần chọn chủ đề và nhập nội dung.'; msg.className='form-msg err'; return; }
        const ngayCapNhat = dateVal ? new Date(dateVal).toISOString() : new Date().toISOString();
        btn.disabled = true;
        try{
          if(state.editingId){
            await api('/api/entries/'+encodeURIComponent(state.editingId), {
              method:'PUT', headers:{'Content-Type':'application/json'},
              body: JSON.stringify({ chuDe, cauHoi, noiDung, traLoi, ngayCapNhat, linkCapNhat, nguoiSua })
            });
            state.editingId = null;
          }else{
            await api('/api/entries', {
              method:'POST', headers:{'Content-Type':'application/json'},
              body: JSON.stringify({ chuDe, cauHoi, noiDung, traLoi, ngayCapNhat, linkCapNhat, nguoiSua })
            });
          }
          await loadEntries();
          state.tab = 'archive';
          render();
        }catch(err){
          msg.textContent = 'Lỗi: ' + err.message;
          msg.className = 'form-msg err';
          btn.disabled = false;
        }
      };
    }
    const cancelBtn = document.getElementById('cancelEditBtn');
    if(cancelBtn) cancelBtn.onclick = () => { state.editingId = null; render(); };
  }
  if(state.tab==='assist'){
    const input = document.getElementById('assistInput');
    const btn = document.getElementById('assistBtn');
    if(input) input.oninput = () => { state.assistQuery = input.value; };
    if(btn) btn.onclick = () => {
      const q = (input.value||'').trim();
      if(!q) return;
      state.assistQuery = q;
      runAssist(q);
      render();
    };
  }
  if(state.tab==='reminders'){
    document.querySelectorAll('[data-remdelete]').forEach(b => b.onclick = async () => {
      if(!ensureUnlocked()) return;
      if(!confirm('Xóa nhắc lịch này?')) return;
      try{
        await api('/api/reminders/'+encodeURIComponent(b.dataset.remdelete), { method:'DELETE' });
        await loadReminders(); render();
      }catch(err){ alert(err.message); }
    });
    document.querySelectorAll('[data-remedit]').forEach(b => b.onclick = () => {
      if(!ensureUnlocked()) return;
      state.editingReminderId = b.dataset.remedit;
      state.remFormOpen = true;
      render();
    });
    document.querySelectorAll('[data-remcheck]').forEach(cb => cb.onchange = () => {
      const r = state.reminders.find(x => x.id === cb.dataset.remcheck);
      if(r) toggleReminderDone(r); else render();
    });
    const toggleBtn = document.getElementById('remFormToggle');
    if(toggleBtn) toggleBtn.onclick = () => {
      state.remFormOpen = !state.remFormOpen;
      state.editingReminderId = null;
      render();
    };
    const kindSel = document.getElementById('rf_kind');
    if(kindSel){
      const syncFields = () => {
        document.getElementById('rf_lunarField').style.display = kindSel.value==='lunar' ? '' : 'none';
        document.getElementById('rf_onceField').style.display = kindSel.value==='once' ? '' : 'none';
        document.getElementById('rf_specialField').style.display = kindSel.value==='special' ? '' : 'none';
      };
      kindSel.onchange = syncFields;
      syncFields();
    }
    const cancelBtn = document.getElementById('remFormCancel');
    if(cancelBtn) cancelBtn.onclick = () => { state.remFormOpen = false; state.editingReminderId = null; render(); };
    const remForm = document.getElementById('remForm');
    if(remForm){
      remForm.onsubmit = async (ev) => {
        ev.preventDefault();
        if(!ensureUnlocked()) return;
        const kind = document.getElementById('rf_kind').value;
        const noiDung = document.getElementById('rf_noiDung').value.trim();
        const luuY = document.getElementById('rf_luuY').value.trim();
        const phuTrach = document.getElementById('rf_phuTrach').value.trim();
        const msg = document.getElementById('remFormMsg');
        if(!noiDung){ msg.textContent = 'Cần nhập nội dung.'; msg.className = 'form-msg err'; return; }
        const payload = { dayType: kind, noiDung, luuY, phuTrach };
        if(kind === 'lunar') payload.lunarDay = Number(document.getElementById('rf_lunarDay').value);
        if(kind === 'once') payload.onceDate = document.getElementById('rf_onceDate').value;
        if(kind === 'special') payload.specialLabel = document.getElementById('rf_specialLabel').value.trim();
        try{
          if(state.editingReminderId){
            await api('/api/reminders/'+encodeURIComponent(state.editingReminderId), { method:'PUT', headers:{'Content-Type':'application/json'}, body: JSON.stringify(payload) });
            state.editingReminderId = null;
          }else{
            await api('/api/reminders', { method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify(payload) });
          }
          state.remFormOpen = false;
          await loadReminders(); render();
        }catch(err){
          msg.textContent = 'Lỗi: ' + err.message;
          msg.className = 'form-msg err';
        }
      };
    }
  }
  if(state.tab==='docs'){
    document.querySelectorAll('[data-docdelete]').forEach(b => b.onclick = async () => {
      if(!ensureUnlocked()) return;
      if(!confirm('Xóa tài liệu này?')) return;
      try{
        await api('/api/docs/'+encodeURIComponent(b.dataset.docdelete), { method:'DELETE' });
        await loadDocs(); render();
      }catch(err){ alert(err.message); }
    });
    document.querySelectorAll('[data-docedit]').forEach(b => b.onclick = () => {
      if(!ensureUnlocked()) return;
      state.editingDocId = b.dataset.docedit;
      state.docFormOpen = true;
      render();
    });
    document.querySelectorAll('[data-doccontent]').forEach(b => b.onclick = () => {
      state.docContentOpenId = state.docContentOpenId === b.dataset.doccontent ? null : b.dataset.doccontent;
      render();
    });
    const toggleBtn = document.getElementById('docFormToggle');
    if(toggleBtn) toggleBtn.onclick = () => {
      state.docFormOpen = !state.docFormOpen;
      state.editingDocId = null;
      render();
    };
    const cancelBtn = document.getElementById('docFormCancel');
    if(cancelBtn) cancelBtn.onclick = () => { state.docFormOpen = false; state.editingDocId = null; render(); };
    const docForm = document.getElementById('docForm');
    if(docForm){
      docForm.onsubmit = async (ev) => {
        ev.preventDefault();
        if(!ensureUnlocked()) return;
        const tieuDe = document.getElementById('df_tieuDe').value.trim();
        const chuDe = document.getElementById('df_chuDe').value;
        const link = document.getElementById('df_link').value.trim();
        const noiDung = document.getElementById('df_noiDung').value.trim();
        const dateVal = document.getElementById('df_ngayCapNhat').value;
        const msg = document.getElementById('docFormMsg');
        if(!tieuDe || !chuDe){ msg.textContent = 'Cần nhập tiêu đề và chọn chủ đề.'; msg.className = 'form-msg err'; return; }
        const ngayCapNhat = dateVal ? new Date(dateVal).toISOString() : new Date().toISOString();
        const payload = { tieuDe, chuDe, link, noiDung, ngayCapNhat };
        try{
          if(state.editingDocId){
            await api('/api/docs/'+encodeURIComponent(state.editingDocId), { method:'PUT', headers:{'Content-Type':'application/json'}, body: JSON.stringify(payload) });
            state.editingDocId = null;
          }else{
            await api('/api/docs', { method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify(payload) });
          }
          state.docFormOpen = false;
          await loadDocs(); render();
        }catch(err){
          msg.textContent = 'Lỗi: ' + err.message;
          msg.className = 'form-msg err';
        }
      };
    }
  }
}

document.querySelectorAll('.side-nav-item').forEach(b => b.onclick = () => { state.tab = b.dataset.tab; if(b.dataset.tab!=='add') state.editingId=null; render(); });
document.getElementById('searchInput').oninput = (e) => { state.query = e.target.value; if(state.tab!=='archive'){ state.tab='archive'; } render(); };

const topicToggle = document.getElementById('topicToggle');
const topicPanel = document.getElementById('topicPanel');
topicToggle.onclick = () => {
  state.topicPanelOpen = !state.topicPanelOpen;
  topicToggle.classList.toggle('open', state.topicPanelOpen);
  topicPanel.classList.toggle('open', state.topicPanelOpen);
};

const WEEKDAY_SHORT = ['T2','T3','T4','T5','T6','T7','CN'];
const now0 = new Date();
state.calYear = now0.getFullYear();
state.calMonth = now0.getMonth();
state.calOpen = false;

function buildCalendarGrid(year, month){
  const first = new Date(year, month, 1);
  const startIdx = (first.getDay() + 6) % 7;
  const daysInMonth = new Date(year, month + 1, 0).getDate();
  const today = new Date();
  const cells = [];
  for(let i=0;i<startIdx;i++) cells.push(null);
  for(let d=1; d<=daysInMonth; d++){
    const [ld, lm, ly, leap] = convertSolar2Lunar(d, month+1, year, 7);
    const isToday = today.getFullYear()===year && today.getMonth()===month && today.getDate()===d;
    const isoDate = `${year}-${String(month+1).padStart(2,'0')}-${String(d).padStart(2,'0')}`;
    const hasRem = lunarDaysWithReminders().has(ld) || onceDatesWithReminders().has(isoDate);
    cells.push({ day:d, ld, lm, ly, leap, isToday, isSoc: ld===1, isVong: ld===15, hasRem });
  }
  return cells;
}

function renderCalendarPanel(){
  const panel = document.getElementById('calPanel');
  const cells = buildCalendarGrid(state.calYear, state.calMonth);
  const monthLabel = `Tháng ${state.calMonth+1} / ${state.calYear}`;
  panel.innerHTML = `
    <div class="cal-nav">
      <button id="calPrev" aria-label="Tháng trước">&lsaquo;</button>
      <div class="cal-month-label">${monthLabel}</div>
      <button id="calNext" aria-label="Tháng sau">&rsaquo;</button>
    </div>
    <div class="cal-grid cal-grid-head">${WEEKDAY_SHORT.map(w=>`<div class="cal-wd">${w}</div>`).join('')}</div>
    <div class="cal-grid">
      ${cells.map(c => c ? `<div class="cal-cell ${c.isToday?'today':''} ${c.isSoc?'soc':''} ${c.isVong?'vong':''} ${c.hasRem?'has-rem':''}" title="${c.day}/${state.calMonth+1}/${state.calYear} — ${c.ld}/${c.lm}${c.leap?' (nhuận)':''} âm lịch, năm ${canChiYear(c.ly)}${c.hasRem?' — có nhắc lịch':''}">
        <span class="cal-solar">${c.day}</span>
        <span class="cal-lunar">${c.isSoc ? c.ld+'/'+c.lm : c.ld}${c.leap?'*':''}</span>
      </div>` : `<div class="cal-cell empty"></div>`).join('')}
    </div>
    <div class="cal-legend"><span class="dot soc"></span> Mùng một &nbsp; <span class="dot vong"></span> Ngày rằm &nbsp; <span style="display:inline-block;width:5px;height:5px;border-radius:50%;background:var(--maroon);"></span> Có nhắc lịch</div>
    <div class="cal-note">Tính bằng thuật toán offline theo giờ hệ thống &mdash; không cần wifi vẫn đúng.</div>
  `;
  document.getElementById('calPrev').onclick = () => changeCalMonth(-1);
  document.getElementById('calNext').onclick = () => changeCalMonth(1);
}
function changeCalMonth(delta){
  state.calMonth += delta;
  if(state.calMonth < 0){ state.calMonth = 11; state.calYear--; }
  if(state.calMonth > 11){ state.calMonth = 0; state.calYear++; }
  renderCalendarPanel();
}
renderCalendarPanel();

const calToggle = document.getElementById('calToggle');
const calPanel = document.getElementById('calPanel');
calToggle.onclick = () => {
  state.calOpen = !state.calOpen;
  calToggle.classList.toggle('open', state.calOpen);
  calPanel.classList.toggle('open', state.calOpen);
};

function pad(n){ return String(n).padStart(2,'0'); }
const WEEKDAYS = ['Chủ nhật','Thứ hai','Thứ ba','Thứ tư','Thứ năm','Thứ sáu','Thứ bảy'];
function updateClock(){
  const now = new Date();
  document.getElementById('clockTime').textContent = `${pad(now.getHours())}:${pad(now.getMinutes())}:${pad(now.getSeconds())}`;
  document.getElementById('clockDate').textContent = `${WEEKDAYS[now.getDay()]}, ${pad(now.getDate())}/${pad(now.getMonth()+1)}/${now.getFullYear()}`;
  const [ld, lm, ly, leap] = convertSolar2Lunar(now.getDate(), now.getMonth()+1, now.getFullYear(), 7);
  document.getElementById('clockLunar').textContent = `Âm lịch: ${ld}/${lm}${leap?' (nhuận)':''} — năm ${canChiYear(ly)}`;
}
setInterval(updateClock, 1000);
updateClock();

document.getElementById('lockBtn').onclick = () => { toggleLock(); };
document.getElementById('printBtn').onclick = () => window.print();
updateLockUi();

async function revalidateStoredPin(){
  if(!state.editPin) return;
  try{
    const res = await fetch('/api/verify-pin', {
      method: 'POST', headers: {'Content-Type':'application/json'}, body: JSON.stringify({ pin: state.editPin })
    });
    if(!res.ok){
      state.editPin = null;
      localStorage.removeItem('kho-edit-pin');
    }
  }catch(e){ /* để nguyên nếu không kiểm tra được */ }
  updateLockUi();
}

(async function init(){
  try{
    await revalidateStoredPin();
    await loadEntries();
    await loadReminders();
    await loadDocs();
  }catch(e){
    document.getElementById('tabContent').innerHTML = `<div class="empty-state"><div class="big">Không kết nối được máy chủ</div><div class="small">${escapeHtml(e.message)}</div></div>`;
    return;
  }
  render();
})();
