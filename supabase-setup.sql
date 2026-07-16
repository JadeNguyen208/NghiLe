-- Kho Du Lieu Nghi Le: schema + toan bo du lieu hien tai (chay 1 lan trong Supabase SQL Editor)

create table if not exists entries (
  id text primary key, chu_de text not null, cau_hoi text default '', noi_dung text not null,
  tra_loi text default '', ngay_cap_nhat timestamptz not null default now(),
  link_cap_nhat text default '', history jsonb default '[]'::jsonb
);
create table if not exists reminders (
  id text primary key, day_type text not null, lunar_day int, special_label text,
  once_date text, noi_dung text not null, luu_y text default '', phu_trach text default '',
  hoan_thanh_ky text
);
create table if not exists docs (
  id text primary key, tieu_de text not null, chu_de text not null,
  link text default '', noi_dung text default '', ngay_cap_nhat timestamptz not null default now()
);
alter table reminders add column if not exists once_date text;
alter table reminders add column if not exists hoan_thanh_ky text;
alter table docs add column if not exists noi_dung text default $Qx$$Qx$;
alter table entries enable row level security;
alter table reminders enable row level security;
alter table docs enable row level security;

insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$seed_1$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$Kính thưa NLCLB, được sự thống nhất của BLD và NLĐT, đh xin gửi câu hỏi ạ.$Q$, $Q$Nội dung câu hỏi:
1. Trong chương trình tu Mùa Hạ, 1 chu kỳ sẽ có 2 thời khoá ngồi thiền, theo hướng dẫn của CLB về cách tu bù thì sẽ: "...Ngồi thiền: Không tu bù gộp 2 ngày ngồi thiền vào 1 thời khóa. Được tu bù thời khóa ngồi thiền riêng..."
ĐT đang có 2 luồng ý kiến:
- Ý 1: Được tu 2 thời khoá ngồi thiền/ 1 ngày, mỗi thời khoá phải cách nhau ít nhất là 30 phút.
- Ý 2: Không khuyến khích tu 2 thời khoá ngồi thiền trong 1 ngày, bao gồm 2 thời cách nhau hơn 30 phút hoặc hai thời sáng, tối.

2. Trong khoảng thời gian tu các chương trình phát động của CLB, tính chất công việc của các PTXX gia duyên đi làm và lệch múi giờ, các PT thường tranh thủ tu sáng sớm hoặc tối khuya, và có thể còn tham gia phận sự nên rất hạn hẹp thời gian. Nếu 1 ngày có 3-4 thời khoá cần phải tu mà mỗi thời chỉ được tu 2 chương trình kết hợp (ví dụ 1 thời tụng kinh bài 8 và tụng kinh CT Mùa Hạ, hoặc tụng kinh và nghe pháp) sau thời khoá tu đó PT có phải đợi ít nhất là 30 phút mới được vào tu thời khoá tiếp theo không ạ?
- Ý 1: Được tu. (Trừ 2 thời khoá ngồi thiền là bắt buộc phải cách nhau 30 phút.)
- Ý 2: Không được, các thời khoá đều phải cách nhau 30 phút, ví dụ tụng kinh + nghe pháp sau đó đợi 30 phút mới được ngồi thiền/nghe pháp cho thời khoá tiếp theo.

Kính thỉnh NLCLB_BPHT hướng dẫn cho ĐT để Phật tử thực hành được đúng Pháp, lợi ích ạ!
Xin tùy hỷ công đức của NLCLB_BPHT ạ!$Q$, $Q$Kính thưa các quý đạo hữu! NLCLB - Bộ phận hỗ trợ xin hướng dẫn:
1. Được tu 2 thời khoá ngồi thiền/ 1 ngày, mỗi thời khoá không phải cách nhau 30 phút.
2. Tu ngay được, không còn quy định 2 thời khóa cách nhau 30 phút.
Xin tùy hỷ công đức các quý đạo hữu ạ!$Q$, $Q$2026-07-15T00:00:00.000Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T00:00:00.000Z","nguoiSua":"Khởi tạo dữ liệu mẫu"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011518_wy6ef$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Phật tử thuộc thành phần E (không được đăng ký danh sách tu tập lên CLB) thì có đủ điều kiện thỉnh HL các chương trình tu tập theo phát động của CLB về đàn chẩn tế không?$Q$, $Q$Thành phần E không được.$Q$, $Q$2026-07-15T11:30:11.117Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.521Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.537Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011571_jufdm$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Chương trình tu mùa hạ thì tất cả Phật tử CLB đều tu chung 1 chương trình. Trường hợp Phật tử đang tu đuổi và không kịp tu xong trước khi CLB khai đàn thì có tiếp tục tu đuổi không?$Q$, $Q$Bạch Phật chân thật sám hối và xin dừng tu đuổi để khai đàn tu mùa hạ cùng CLB.$Q$, $Q$2026-07-15T11:30:11.561Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.571Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.545Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011582_ct3t2$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Trước khi tham gia khai đàn tu mùa hạ trực tuyến, Phật tử thực hiện nguyện hương và bạch văn bạch của ngày 1. Trong khi đó, CLB hướng dẫn: Tham gia khai/kết đàn trực tiếp/trực tuyến không phải bạch văn bạch trước khi tham gia. Vậy Phật tử cần sám hối như thế nào?$Q$, $Q$Bạch sám hối theo hướng dẫn.$Q$, $Q$2026-07-15T11:30:11.576Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.582Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.552Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011592_fjf69$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Phật tử phát nguyện tu đủ chương trình tu mùa hạ để thỉnh HL về các đàn chẩn tế mùa hạ (tháng 5,6,7,8/Bính Ngọ) nhưng có một tháng tu không đủ thì cần làm gì?$Q$, $Q$Bạch với HL xin sám hối, xả lời nguyện đó.$Q$, $Q$2026-07-15T11:30:11.584Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.592Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.559Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011600_ov4nj$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Phật tử phát tâm cúng dường về đàn chẩn tế nhưng quên/không nhớ đã bạch chưa thì làm như thế nào?$Q$, $Q$Bạch lại.$Q$, $Q$2026-07-15T11:30:11.595Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.600Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.565Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011613_kzp3v$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Khi tu chương trình mùa hạ, từ khai đàn và các ngày tu tiếp theo, Phật tử bạch thỉnh HL về đàn chẩn tế nhưng không bạch rõ về đàn chẩn tế ngày nào. Nhưng Phật tử có tham gia các chương trình chẩn tế trực tuyến và bạch văn bạch khi tham gia đàn chẩn tế. Vậy Phật tử cần sám hối như thế nào?$Q$, $Q$Nếu đã tham gia các đàn CLB quy định thì được, cho Phật tử bạch sám hối là không bạch rõ.$Q$, $Q$2026-07-15T11:30:11.606Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.613Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.572Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011621_uxiv9$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Khi tu ngày 1 chu kỳ 1 của chương trình mùa hạ, Phật tử chỉ thỉnh HL về đàn chẩn tế tháng 5 âm lịch. Sau ngày chẩn tế tháng 5 âm lịch, Phật tử sẽ bạch văn bạch nào để thỉnh HL về đàn chẩn tế tháng 6 âm lịch?$Q$, $Q$Lấy văn bạch hàng ngày, chỉ thêm phần thỉnh về đàn chẩn tế.$Q$, $Q$2026-07-15T11:30:11.615Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.621Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.579Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011630_esw4z$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Khi tu chương trình mùa hạ, Phật tử chỉ tu đầy đủ phần tụng kinh, nghe Pháp, còn phần ngồi thiền thì không đầy đủ và nếu có ngồi thiền thì cũng không thiền quán được sâu. Phật tử vẫn có tâm mong muốn thỉnh HL chương trình tu mùa hạ về đàn chẩn tế thì có được không?$Q$, $Q$Nếu đạo hữu muốn thỉnh về đàn chẩn tế thì vẫn phải theo quy định của CLB là tu đầy đủ, còn việc quán chiếu chưa được sâu thì còn tùy căn cơ của mỗi người thì có thể đọc đi đọc lại nhiều lần và suy ngẫm về đề mục đó.$Q$, $Q$2026-07-15T11:30:11.624Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.630Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.586Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011643_qcz2r$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Khi tu mùa hạ, ngày 3 và 4 của mỗi chu kỳ là ngồi thiền. Phật tử chia mỗi buổi tu một nửa số đề mục quán của chu kỳ có được không?$Q$, $Q$Được.$Q$, $Q$2026-07-15T11:30:11.632Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.643Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.595Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011652_6fqw5$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Trong các chương trình tu tập dài ngày (Tu tâm từ bi cầu nguyện chính Pháp trụ lâu dài, tu mùa hạ…), Phật tử có được bạch thỉnh HL ngày tu thứ nhất trong các ngày tu tiếp theo không? Hay bạch theo hướng dẫn, chỉ đọc:"Các chúng trong cõi tâm linh như (các) hôm trước, mà chúng con đã bạch thỉnh"?$Q$, $Q$Làm theo hướng dẫn và muốn bạch lại thì tùy, không bắt buộc và cũng là thừa, chỉ là tâm thích bạch thì bạch, không có tác dụng thêm về tâm linh.$Q$, $Q$2026-07-15T11:30:11.646Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.652Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.601Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011661_4azz2$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Phật tử tu thay thế chương trình SHCT bằng nghi thức tu mùa hạ. Khi bạch thỉnh HL của chương trình SHCT về tu chương trình mùa hạ, Phật tử quên không bạch chi tiết các hiện tượng trên nghiệp SHCT mà chỉ bạch chung là "Thỉnh HL trong nghi thức trước sám hối chư Tăng về tu cùng". Vậy Phật tử có đủ điều kiện tham gia SHCT không?$Q$, $Q$Lần sau nhớ bạch chi tiết.$Q$, $Q$2026-07-15T11:30:11.657Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.661Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.606Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011667_fk2ec$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Trong quá trình tu mùa hạ, Phật tử chuyển địa điểm tu thì thực hành như thế nào cho đúng?$Q$, $Q$Tu mùa hạ được tùy duyên tu ở các địa điểm khác nhau.$Q$, $Q$2026-07-15T11:30:11.663Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.667Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.612Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011675_22zda$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Lợi ích khi tu tập chương trình tu mùa hạ?$Q$, $Q$(1) Khai mở trí tuệ:
- Trí tuệ là điều rất cần thiết với một chúng sinh: Khẳng định tầng lớp giai cấp, quyết định nơi sinh...
- Việc tu tập Phật Pháp là một duyên thù thắng để khai mở trí tuệ. Nếu không tu Phật Pháp thì chúng ta chỉ có cái thấy biết được tích góp từ vô lượng kiếp vô minh.
(2) Là duyên để các kiếp sau được đi trên con đường xuất gia một cách thảnh thơi:
- Mỗi năm an cư 3 tháng là quy định của mười phương ba đời chư Phật. Người xuất gia một năm cũng có 3 tháng an cư như vậy.
- Chúng ta cần tập đời sống người xuất gia và đưa vào tiềm thức của mình về việc 1 năm có 3 tháng tu tập.
- Như vậy, đến kiếp sau, khi nghe chư Tăng tu tập an cư 3 tháng thì được hoan hỷ, quen thuộc → mới đi xuất gia được.
→ Tuy sinh ra ở đời còn nhiều điều trói buộc nhưng cố gắng hết sức mình để tâm hướng tới Phật Pháp, kiếp sau có duyên đi xuất gia. Muốn hạnh phúc, thành Thánh, thành Phật thì không thể lười tu.
(3) Rất lợi ích cho những chúng tâm linh hợp duyên:
- Trong kinh Ngạ Quỷ Nghe Kinh có ghi lại sự kiện: chúng ngạ quỷ nhờ nghe kinh mà giác ngộ.
- Vì vậy, việc duy trì tu tập một chương trình trong 3 tháng liên tục rất lợi ích. Đó là có thể khiến những chúng trong cõi tâm linh hợp duyên được nghe kinh, nghe Pháp mà giác ngộ.$Q$, $Q$2026-07-15T11:30:11.669Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.675Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.617Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011681_3o11a$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Phật tử tu đủ điều kiện và đã bạch thỉnh HL về đàn chẩn tế trong các ngày tu tụng kinh, nhưng khi tham gia trực tuyến chương trình đàn chẩn tế không bạch văn bạch trước khi tham gia để mời HL tham dự lễ chẩn tế thì HL có được vào đàn lễ không?$Q$, $Q$Nếu các ngày trước đã bạch mời đầy đủ thì HL có thể được về, nhưng cần bạch sám hối và nhớ lần sau không để quên như vậy.$Q$, $Q$2026-07-15T11:30:11.677Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.681Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.622Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011690_6qitj$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Có được tu chương trình mùa hạ vào ngày tu Bát quan trai chuyển ngày không?$Q$, $Q$Được$Q$, $Q$2026-07-15T11:30:11.683Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.690Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.629Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784115011696_ptu82$Q$, $Q$CHƯƠNG TRÌNH TU MÙA HẠ$Q$, $Q$$Q$, $Q$Về việc tùy tâm hồi hướng về đàn chẩn tế tu mùa hạ thì thực hiện như nào?$Q$, $Q$Tùy tâm hồi hướng về đàn chẩn tế: Tháng nào tu thì chỉ nên bạch về đàn chẩn tế của tháng đó. (Ví dụ: Tháng 5 thì bạch về đàn chẩn tế tháng 5, tương tự với tháng 6, 7, 8).
Ngoài ra, có thể tùy tâm hồi hướng một lần về 4 đàn chẩn tế tháng 5, 6, 7, 8. Trong trường hợp này:
- Nếu không tùy tâm hồi hướng thêm: Đọc tổng số vào đàn chẩn tế tháng 5, các tháng sau không cần bạch thêm.
- Nếu tùy tâm hồi hướng thêm: Tháng nào phát tâm thêm thì đọc thêm.$Q$, $Q$2026-07-15T11:30:11.692Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T11:30:11.696Z","nguoiSua":"Nhap tu tai lieu FAQ Mua Ha"},{"action":"cap_nhat","at":"2026-07-15T11:42:35.635Z","nguoiSua":"Don dep tien to cau hoi"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431788_17jpt$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Trong đạo tràng các phật tử phát nguyện hát các bài hát: Lục hoà ca, Hộ Trì tu Lục Hoà, 4 bài hát tán dương Phật Pháp Tăng. Vậy NL ĐT_BPHT kính thỉnh quý ban hướng dẫn cho đạo tràng là sẽ bạch văn bạch khai/kết đàn theo phát nguyện, hay chỉ bạch các văn bạch của lục hoà ca, 4 bài hát tán dương cũ ạ. Và nếu như trường hợp bạch văn khai/kết đàn theo phát nguyện xong thì lại bạch văn bạch cũ của từng bài hát sau đó hát đúng không ạ.$Q$, $Q$Bạch theo văn bạch ở phần 7 của link: https://docs.google.com/document/d/13CrCAjWS8Z_TGZFxLzktqVpAtwJMKqoys3sZeY0s7II/edit$Q$, $Q$2026-07-15T14:57:11.588Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.789Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.679Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431806_zvpa3$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$Kính thỉnh NLCLB_BPHT chỉ dạy cho Đạo tràng chúng con nội dung sau ạ.$Q$, $Q$Phật tử trong Đạo tràng bị mắc bệnh nặng, bệnh nan y và đăng ký Đạo tràng tụng Kinh Tam Bảo 49 ngày để hồi hướng. Tuy nhiên bệnh của Phật tử vẫn chưa có dấu hiệu thuyên giảm. Nay Phật tử tiếp tục đăng ký Đạo tràng tụng Kinh Tam Bảo tiếp 49 ngày lần 2, lần 3... vẫn trên nghiệp bệnh này. Như vậy thì có được không ạ.
Ý kiến 1: Chỉ đọc Kinh Tam Bảo từ 3 - 49 ngày trên 1 nghiệp/hiện tượng.
Ý kiến 2: Phật tử được tùy duyên đăng ký nhiều lần 49 ngày.$Q$, $Q$Ý 2$Q$, $Q$2026-07-15T14:57:11.806Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.806Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.709Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431815_ulkm8$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Đạo tràng chúng con có PT xin đăng ký hồi hướng công đức lục hòa tại Đạo tràng. Trong phần hướng dẫn thì đối tượng đăng ký là thành phần a, b, c, d. Và đối tượng hồi hướng là thành phần a, b, c, d và bố, mẹ, vợ, chồng,... Tuy nhiên Đạo tràng chúng con tư duy còn kém chưa biết thành phần nào được tham gia bạch hồi hướng cho các PT ạ.$Q$, $Q$Thành phần đang/đã bạch bài 49 ngày.$Q$, $Q$2026-07-15T14:57:11.815Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.815Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.732Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431821_imte2$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$Được sự đồng thuận của NLĐT_Bộ phận hỗ trợ, ĐT kính thỉnh NLCLB_Bộ phận hỗ trợ chỉ dạy cho Đạo tràng các nội dung sau ạ: Bài bạch tri ân và lú lẫn lúc tuổi già, ĐT hiểu là áp dụng cho thành phần bạch là PT đang/đã bạch 49 ngày.$Q$, $Q$Bài bạch được tùy duyên thực hiện trong ngày có đúng không ạ?
Bài bạch có thể phát nguyện cả đời hoặc theo tháng giống như các phát nguyện khác có đúng không ạ?$Q$, $Q$Được. Đúng.$Q$, $Q$2026-07-15T14:57:11.822Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.821Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.746Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431829_hl7n0$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$Được sự phân công của LĐĐT_Bộ phận hỗ trợ cùng sự đồng thuận của NLĐT_Bộ phận hỗ trợ, đạo hữu xin đại diện NLĐT_Bộ phận hỗ trợ xin gửi nội dung câu hỏi như sau.$Q$, $Q$PT phát nguyện cá nhân tụng kinh Tam Bảo:
a. PT hồi hướng cho cháu ngoại của anh trai được không ạ.
b. Cá nhân phát nguyện đối tượng được hồi hướng bao gồm các thành phần nào ạ.$Q$, $Q$a. Không ạ.
b. Thành phần a, b, c, d và vợ, chồng, bố, mẹ, anh, chị em hai bên vợ, chồng (bao gồm cả anh, chị, em dâu, rể trong gia đình), cùng các con của Phật tử.$Q$, $Q$2026-07-15T14:57:11.830Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.829Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.754Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431834_htuux$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Mẫu đăng ký chung, mục thời gian, ví dụ: Phát nguyện tu từ ngày 1 đến ngày 15/1/BN, mục thời gian sẽ viết:
Ý 1: Thời gian: 13 ngày từ 1/1 đến 15/1/BN (Nghỉ ngày 8,14/1/BN)
Ý 2: Thời gian: từ 1/1 đến 15/1/BN
Ý 3: Thời gian: 13 ngày từ 1/1 đến 15/1/BN
Các ý đều không đúng, thỉnh NLCLB hướng dẫn cách viết đúng ạ.$Q$, $Q$Cả 3 ý.$Q$, $Q$2026-07-15T14:57:11.837Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.834Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.765Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431839_suv1w$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$PT phát nguyện tụng kinh Tam Bảo 49 ngày từ 20/12/ÂT đến hết ngày 9/2/BN, PT tính cả các ngày 8,14,30. NLĐT đã đăng bài rồi. Trường hợp này sẽ hướng dẫn PT:
Ý 1: PT bạch lại văn bạch ngày khai đàn.
Ý 2: Bạch Văn Bạch Ngày Tiếp Theo có đoạn "(Tùy duyên có/không đọc lại tên/sự việc; nếu có phát sinh mới hay thay đổi thì đọc.)" thì PT bạch lại thời gian phát nguyện.$Q$, $Q$Ý 2.$Q$, $Q$2026-07-15T14:57:11.841Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.839Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.780Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431845_qu2zc$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$ĐT đã đọc tài liệu HƯỚNG DẪN THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ nhưng chưa tìm được nội dung hướng dẫn đăng ký hồi hướng thi cử.$Q$, $Q$1- Những kỳ thi nào thì được đăng ký hồi hướng?
2- Được đăng ký hồi hướng trước bao nhiêu ngày diễn ra kỳ thi?
3- Nội dung đăng ký có cần ghi rõ: tên kỳ thi/địa điểm/thời gian diễn ra kỳ thi?
4- ĐT có cần đọc danh sách hồi hướng thi cử như đọc danh sách hồi hướng công đức lục hoà tại ĐT không?$Q$, $Q$1. Tất cả ạ.
2. 30 ngày.
3. Ghi theo mẫu.
4. Có ạ.$Q$, $Q$2026-07-15T14:57:11.847Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.845Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.787Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431851_yh4z4$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$ĐT xin được hướng dẫn về hồi hướng công đức lục hoà tại ĐT: Đối tượng đọc danh sách hồi hướng là Phật tử đã bạch bài 49 có đúng không ạ?$Q$, $Q$Đối tượng đã/đang bạch 49 ngày.$Q$, $Q$2026-07-15T14:57:11.854Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.851Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.799Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431856_q5oq2$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Trường hợp cá nhân xin đạo tràng phát động tụng kinh Tam Bảo hồi hướng cho việc riêng:
1. Phật tử có được đăng ký hồi hướng cho trường hợp đón nghiệp không?
2. Phật tử do duyên sức khoẻ không tụng kinh Tam Bảo cùng ĐT có được đăng ký không?$Q$, $Q$1. Được.
2. Phật tử đăng ký phải thực hành phát nguyện cùng nhóm/đạo tràng trừ khi bị bệnh/nạn không thể thực hiện được, nhưng trong thời gian phát nguyện, nếu đủ duyên cần phải thực hành.$Q$, $Q$2026-07-15T14:57:11.859Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.856Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.806Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431861_lgbop$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Hàng tháng NLĐT đăng bài cho PT đăng ký tụng kinh Tam bảo hồi hướng tại ĐT. Có PT đăng ký hồi hướng hết tháng từ ngày 1-29, có PT chỉ đăng ký hồi hướng ít ngày 3,7,14,... Ngày đầu khai đàn đã đọc rõ thời gian hồi hướng của từng PT, vậy đến ngày cuối của PT phát nguyện hồi hướng ít ngày thì có cần bạch kết mãn không ạ? Hiện tại ĐT đang thực hành sẽ bạch kết mãn vào ngày cuối cùng của PT đăng ký dài ngày nhất, còn các PT đăng ký hồi hướng ít ngày thì đến ngày cuối của PT đó không bạch kết mãn ạ?$Q$, $Q$Dựa trên các quy định về thực hành phát nguyện của Câu lạc bộ, tất cả các trường hợp phát nguyện dù là cá nhân hay nhóm đạo tràng đều phải thực hiện văn bạch kết mãn (kết đàn) vào đúng ngày cuối cùng của kỳ phát nguyện đó. Nếu đạo tràng phát nguyện hồi hướng cho các PT nặng nghiệp mà các Phật tử trong ĐT không thực hành cùng 1 thời gian thì ĐT cũng phải gom lại theo từng nhóm có số ngày phát nguyện giống nhau (ít nhất 4 người một nhóm), các thành viên trong nhóm đó sẽ cùng nhau khai/kết phát nguyện cùng ngày. Không phải mỗi cá nhân thích phát nguyện bao nhiêu ngày ạ.$Q$, $Q$2026-07-15T14:57:11.864Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.861Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.820Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431865_j2i5m$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$ĐT xin thỉnh CLB hướng dẫn về nội dung thực hành 7 lễ tri ân khiến không bị lú lẫn về già: Đối tượng thực hành; Thời gian thực hành có cần theo phát nguyện không hay có thể tùy duyên ạ?; ĐT có cần viết bài đăng ký phát nguyện tu cho PT không ạ? Nếu cần đăng ký thì sẽ đăng ký ở đâu ạ?$Q$, $Q$Dành cho Phật tử đã/đang bạch bài 49 ngày phát tâm tu lục hòa.
Thời gian lễ: Trọn đời. Thời gian lễ trong ngày: tùy duyên, một ngày một lần. Địa điểm lễ: Tùy duyên, không bắt buộc trước bàn thờ. Khi phát nguyện thì đăng bài lên bài đăng CLB.

Cách thực hành: Ngồi trong tư thế ngồi thiền chắp tay bạch: Nam Mô Phật Bổn Sư Thích Ca Mâu Ni, đệ tử con tên là... Pháp danh... con xin thực hành quán tưởng, đảnh lễ tri ân. (Buông tay, từ 5 đến 10 phút quán tưởng)
Phật: Bậc giác ngộ, chứng đạo dưới cội bồ đề.
Pháp: lời dạy của Đức Phật, giúp mình giác ngộ, diệt khổ, khởi tưởng hoan hỷ vì tự thân đã được chuyển hoá nhờ áp dụng lời Phật dạy.
Tăng: Quán tưởng hình ảnh Phật và Tăng đoàn; hình ảnh phạm hạnh của Tăng đoàn (hình ảnh sư Phụ và chư tăng tu tập trên rừng, khất thực trong rừng...).
Thầy Tổ: Hình ảnh Sư Phụ (hành thiền, giảng pháp, khất thực...).
Cha mẹ: (hình ảnh cha mẹ đã vất vả với mình)...
Cô Chủ Nhiệm: Sách tấn mình thực hành pháp lục hoà, giúp cho mình biết được điều lợi ích này (hình ảnh nào đó).
Chúng Sinh: hình ảnh những người, vật... mà từ nơi pháp lục hoà, mình đã giúp họ trong ngày hoặc những hình ảnh từ trước mà mình đã làm, khiến cho (một người hoặc nhiều người)... được lợi ích hoan hỷ trong Phật Pháp. Khởi tưởng hoan hỷ vì từ nơi pháp lục hoà, mình đã thực hành bố thí và đó chính là pháp kết duyên, là nhân lành để họ được vào nơi giáo pháp của các Đức Phật, thực hành pháp lục hoà, làm lợi ích cho họ và cho số đông.

(Sau đó quỳ gối chắp tay đảnh lễ, vừa lễ vừa quán tưởng)
Con xin chí tâm đảnh lễ tri ân Phật. Con xin chí tâm đảnh lễ tri ân Pháp. Con xin chí tâm đảnh lễ tri ân Tăng. Con xin chí tâm đảnh lễ tri ân Sư Phụ. Con xin chí tâm đảnh lễ tri ân cha mẹ. Con xin chí tâm đảnh lễ tri ân cô chủ nhiệm. Con xin chí tâm đảnh lễ tri ân tất cả những người, những chúng sinh mà đã nhờ con, khiến con được làm các việc thiện trong pháp lục hoà.

(Chắp tay bạch hồi hướng)
Nam Mô Phật Bổn Sư Thích Ca Mâu Ni! Con Kính Bạch Chư Phật, con xin hồi hướng công đức cho tất cả chúng sinh là người, là súc sinh... mà con đã giết hại hoặc làm tổn hại chúng, khiến chúng sẽ báo oán con trên nghiệp bị lú lẫn. Trong tâm thành tín, con xin nguyện cho chúng được duyên lành theo câu lạc bộ phát tâm bồ đề, thực hành Sáu Pháp hoà kính, tinh tấn tu hành cầu vô thượng bồ đề. Con xin hồi hướng cho con được tiêu trừ nghiệp bị lú lẫn, tinh tấn thực hành thiện pháp để thoát khổ luân hồi, khi bỏ báo thân tâm trí sáng suốt, an trú trong niệm cầu vô thượng Bồ Đề. Nam Mô Phật Bổn Sư Thích Ca Mâu Ni.$Q$, $Q$2026-07-15T14:57:11.869Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.865Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.830Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431870_fikzd$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$Kính thưa NLCLB_Bộ phận hỗ trợ! Được sự phân công của ĐT_Bộ phận hỗ trợ Phật tử cùng sự nhất trí của NLĐT_Bộ phận hỗ trợ. Phật tử xin đại diện Đạo tràng gửi câu hỏi thỉnh NLCLB_Bộ phận hỗ trợ hướng dẫn cho Đạo tràng nội dung sau ạ.$Q$, $Q$Theo hướng dẫn của NLCLB_Bộ phận hỗ trợ về thời gian phát nguyện "Không thực hành trong thời gian về chùa và các ngày tu học định kỳ (8,14,29/30) tại nhà, nhóm, chùa." Khi NLĐT_Bộ phận hỗ trợ đăng ký cho các PT cá nhân xin phát nguyện, xin hồi hướng công đức lục hoà của đạo tràng/CLB thì cũng trừ các ngày tu học định kỳ (8,14,29/30). Như vậy, các Phật tử có được đọc danh sách hồi hướng vào các thời khoá riêng/nhóm/đạo tràng tu Bát quan trai, tu sám hối chuyển hóa (bài tu số 8), nghe Pháp thường kỳ vào các ngày tu học định kỳ (8,14,29/30) tại nhà không ạ?
Ý kiến hỏi thêm: Nếu ý hỏi trên là không được thì các Phật tử do gia duyên chỉ phát nguyện tu các chương trình phát động của CLB tuỳ duyên, không đọc hồi hướng đủ 7 thời khoá thì đạo tràng hướng dẫn đọc vào thời điểm nào ạ?
Ý kiến đề xuất của NLĐT_Bộ phận hỗ trợ:
Ý 1: Không đọc danh sách hồi hướng vào các ngày tu học định kỳ (8,14,29/30) tại nhà, nhóm, chùa. Còn Phật tử vẫn đọc danh sách hồi hướng vào các thời khoá tu riêng/nhóm/đạo tràng tu Bát quan trai, tu sám hối chuyển hóa (bài tu số 8), các chương trình, hát/tụng kinh… theo phát nguyện.
Ý 2: Có đọc danh sách hồi hướng vào các ngày tu học định kỳ (8,14,29/30) tại nhà, nhóm, chùa.$Q$, $Q$Ý 2 ạ.$Q$, $Q$2026-07-15T14:57:11.873Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.870Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.839Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431876_uzmze$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$Được sự phân công của ĐT_Bộ phận hỗ trợ cùng sự đồng thuận của NLĐT_Bộ phận hỗ trợ, chúng con xin thỉnh NLCLB_Bộ phận hỗ trợ chỉ dạy cho chúng con các nội dung sau ạ.$Q$, $Q$1. a. Các Phật tử đăng kí cúng thí thực theo chương trình phát động như tu cầu an tụng kinh Dược Sư, đồng thời nhân duyên giỗ, lễ rằm, lễ bài 8,... thì có phải đăng ký lên NL CT không ạ?
b. Nếu bạch hết các nhân duyên trên thì vẫn được thỉnh HL cúng thí thực về Chẩn tế phải không ạ?
2. Trong ngày thứ nhất của văn bạch theo phát nguyện có câu: "Và nếu các ngày tiếp theo có các hiện tượng khác phát sinh thì chúng con lại xin bạch thêm". Vậy trong các ngày tiếp theo mà có thêm hiện tượng mới, hoặc địa chỉ điều trị thay đổi và mong cầu thay đổi, thì chúng con có cần đăng ký thay đổi này lên NLCLB không?
3. Khi tín chủ đã thay đổi hiện tượng so với hôm bắt đầu phát nguyện thì trong ngày kết mãn của phát nguyện chúng con sẽ bạch lại hiện tượng cũ của ngày 1 hay bạch theo hiện tượng mới đã thay đổi ạ.$Q$, $Q$1. a. Cúng thí thực theo chương trình phát động như tu cầu an tụng kinh Dược Sư, Thái tử xuất gia,... thì không phải đăng ký lên CLB. Cúng thí theo nhân duyên giỗ, lễ rằm, lễ bài 8,... thì có đăng ký lên CLB ạ.
b. Có được thỉnh về đàn chẩn tế ạ.
2. ĐT bạch lên CLB và nhắn rõ đã hỏi NLCLB.
3. Bạch kết mãn theo hiện tượng thay đổi mới nhất.$Q$, $Q$2026-07-15T14:57:11.878Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.876Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.849Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431885_i8pw6$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$Kính bạch NLCLB_Bộ phận hỗ trợ! Được sự phân công của Nhóm_Bộ phận hỗ trợ Phật tử cùng sự đồng thuận của NLN_Bộ phận hỗ trợ, chúng con xin được bạch NLCLB_Bộ phận hỗ trợ hướng dẫn cho chúng con về trường hợp nội dung sau ạ.$Q$, $Q$1. Ở mục "Trường hợp cá nhân xin phát nguyện": Cá nhân PT đăng ký sẽ báo lên tổ và tiến hành tụng kinh được luôn, NL tổ báo lên NL nhóm, NL nhóm tổng hợp đăng ký lên CLB, có thể đăng bất cứ lúc nào trong tháng. Ví dụ: PT đăng ký tụng cá nhân từ mùng 1 đến mùng 7, nhưng NL nhóm tổng hợp chung các trường hợp phát nguyện khác nữa và đăng ký lên CLB vào ngày 14 trong tháng thì có được không ạ?
2. Ở phần lưu ý cuối mục "Trường hợp nhóm/đạo tràng/BPHT/tổ xin phát nguyện hồi hướng chung": lưu ý này áp dụng cho riêng mục đó hay áp dụng cho cả 3 mục (cá nhân xin phát nguyện, cá nhân xin nhóm/đạo tràng phát động hồi hướng, nhóm/đạo tràng/BPHT/tổ xin phát nguyện hồi hướng chung) ạ?$Q$, $Q$1. KHÔNG ĐƯỢC. Lý do: Đạo tràng có thể cho Phật tử hồi hướng trước, nhưng tính vào thời gian phát nguyện (để khai đàn) thì phải tính từ thời điểm đăng bài lên Câu lạc bộ.
2. Áp dụng cho cả 3 mục.$Q$, $Q$2026-07-15T14:57:11.887Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.885Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.856Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431889_3sq6i$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$Được sự phân công của ĐT_Bộ phận hỗ trợ Phật tử cùng sự đồng thuận của Cán sự Đạo tràng_Bộ phận hỗ trợ, ĐT xin được hướng dẫn nội dung sau ạ.$Q$, $Q$PT tự phát nguyện cá nhân hát và tụng kinh để hồi hướng cho cháu nội (không nằm trong danh sách người thân được hồi hướng nếu tham gia phát nguyện với ĐT).
Ý 1: Phát nguyện cá nhân thì đối tượng hồi hướng tùy PT, không giới hạn.
Ý 2: Đối tượng người thân được hồi hướng y như ĐT phát nguyện hồi hướng (tức là cháu nội không được hồi hướng khi PT tự phát nguyện cá nhân hát và tụng kinh hồi hướng cho cháu).$Q$, $Q$Ý 2.$Q$, $Q$2026-07-15T14:57:11.892Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.889Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.869Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431894_jeyii$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$ĐT đang phát nguyện tụng kinh Tam Bảo trong 7 ngày để hồi hướng cho nghiệp bệnh của TC nhưng chưa hết 7 ngày (đến ngày thứ 4) mà TC bỏ báo thân, ĐT vẫn phát nguyện hồi hướng hết 7 ngày nhưng từ ngày thứ 4 trở đi, ĐT có thay đổi mong cầu được không? Hay vẫn giữ nguyên mong cầu như cũ (giả sử: mong cầu trong phát nguyện là "mong cho TC gặp thầy giỏi, thuốc tốt... mong cho cơ thể hồi phục, thọ mạng dài lâu" nhưng TC đó mất thì có được đổi mong cầu khác cho phù hợp không)?$Q$, $Q$Được ạ.$Q$, $Q$2026-07-15T14:57:11.896Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.894Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.878Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431899_lf2zb$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$1. Trong ĐT có PT đăng ký hồi hướng công đức Lục Hoà tại ĐT cho bố mang thân bệnh nặng nhưng mới đăng ký hồi hướng được ngày đầu tiên thì bố PT đã mất.
1.1: Vậy ĐT có tiếp tục hồi hướng cho bố PT nữa không ạ?
1.2: Nếu không hồi hướng nữa thì sẽ huỷ như nào và bạch như nào ạ?
2. Trong phần văn bạch dành cho PT xin hồi hướng công đức Lục hoà trên CLB có hướng dẫn "bạch hàng ngày":
Ví dụ 1: nếu PT đăng ký vào ngày 24/1/BN thì sẽ bạch từ 24/1 đến hết ngày 30/1/BN đúng không ạ?
Ví dụ 2: Nếu PT đăng ký vào ngày 5/1/BN thì cũng bạch đến hết ngày 30/1/BN. ĐT xin hỏi ví dụ nào đúng ạ?$Q$, $Q$1.1. Có tiếp tục nhưng hồi hướng cho HL của bố ạ.
2. Bạch đến khi nào xin dừng hồi hướng ạ.$Q$, $Q$2026-07-15T14:57:11.902Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.899Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.887Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431903_d7g1m$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$ĐT phát động tụng kinh Tam Bảo từ đầu tháng đến cuối tháng, để hồi hướng cho các ĐH đã đăng ký lên ĐT. Đến giữa tháng có Phật tử A (ngoài danh sách các ĐH đã đăng ký hồi hướng từ đầu tháng) đăng ký xin bổ sung đăng ký hồi hướng tụng kinh Tam Bảo. Theo hướng dẫn của NLCLB: "Phải cùng nhau khai/kết đúng ngày phát nguyện." Vậy Phật tử A đó có được bổ sung tụng kinh Tam Bảo không ạ hay ĐT phát động tụng kinh Tam Bảo đợt mới hồi hướng cho ĐH đó ạ?$Q$, $Q$Đạo tràng được tiếp tục bổ sung danh sách các PT có nguyện vọng được hồi hướng tại Đạo tràng (ĐT) mà không phải đợi hết đợt phát nguyện cũ để đăng ký danh sách mới.$Q$, $Q$2026-07-15T14:57:11.907Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.903Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.899Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431907_ejq49$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Trường hợp cấp bách như Phật tử hay người thân bị tai nạn, cấp cứu, hay việc gấp. Các PT chúng con có thể làm gì để hồi hướng luôn được ạ? Vì việc viết bài đăng ký phát nguyện tụng kinh Tam Bảo thì cần phải chờ tổng hợp số lượng PT đăng ký, rồi chờ NLĐT_Bộ phận hỗ trợ đăng bài lên CLB và ra thông báo bắt đầu thực hành phát nguyện thì mới bắt đầu được (thường phải sau 1 ngày). Còn việc xin hồi hướng công đức lục hòa tại Đạo tràng/CLB thì phải chờ PT tu lên thời khóa để bạch hồi hướng, có ngày có PT không tụng thời khóa nào.
Ý kiến của Đạo tràng: Trong thời gian chờ thì các Phật tử trong đạo tràng có thể tự tụng kinh Tam Bảo và bạch nôm hồi hướng cho Phật tử cần hồi hướng.$Q$, $Q$Đồng ý với ĐT.$Q$, $Q$2026-07-15T14:57:11.910Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.907Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.906Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431913_vjhf5$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$1. Có 5 PT đăng ký tụng kinh Tam Bảo (đủ 1 nhóm nhiều hơn 4 Phật tử cùng phát nguyện). Vậy nhóm có thực hiện bước triển khai về cho NL các tổ, cho Phật tử thành phần a,b,c,d trong toàn nhóm cùng đăng ký tham gia phát nguyện để hồi hướng cho 5 PT này không ạ?
Ý 1: Chỉ đăng ký cho nhóm 5 PT cùng nhau phát nguyện, không thực hiện quy trình triển khai/tổng hợp thêm.
Ý 2: Có thực hiện triển khai về cho NL các tổ, cho Phật tử thành phần a,b,c,d trong toàn nhóm cùng đăng ký tham gia phát nguyện.
2. Cách ghi đăng ký theo mẫu (Nhóm số, Số lượng Phật tử, Nội dung, Chủ đề, Thời gian, Hồi hướng cho...) có đúng không ạ?$Q$, $Q$1. Ý 1.
2. Đúng ạ.$Q$, $Q$2026-07-15T14:57:11.915Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.913Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.916Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431917_4p8p4$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$1. Trong duyên phát nguyện tụng kinh Tam Bảo, phật tử có được tùy duyên đăng ký tụng các kinh khác như Kinh điềm lành và Lời khấn nguyện không ạ?
1.1 Phát nguyện tụng kinh Tam Bảo 1-3 biến/ngày: Ngày đầu phát nguyện 3 biến, các ngày sau PT tùy duyên có thể tụng 1 hoặc 2 hoặc 3 biến đúng không ạ?
2. Phật tử thực hành bài bạch 7 lễ tri ân khiến tuổi già không bị lú lẫn thì đăng ký trong bài phát nguyện hàng tháng hay bạch lên CLB Bộ phận hỗ trợ phật tử chứng minh và chỉ dạy ạ?
2.1 Khi thực hành bài bạch nếu do các nhân duyên đặc biệt như đau ốm... thì có được bạch SH xin nghỉ? Hoặc vì gia duyên thiếu tỉnh giác mà quên thì có được bạch SH? Hoặc bạch bù vào hôm sau không ạ?$Q$, $Q$1. Không được (chỉ tụng kinh Tam Bảo).
1.1 Đúng.
2. Đăng bài lên CLB ạ.
2.1 Phát nguyện bạch trọn đời, ngày nào cũng bạch, nếu có ngày quên thì thôi vẫn bạch tiếp, vẫn trong phát nguyện.$Q$, $Q$2026-07-15T14:57:11.920Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.917Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.925Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431921_1i5ob$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$1. Hàng tháng ĐT có đăng ký lên NLCLB một đường link doc về các phát nguyện, đăng ký HHCĐLH tại ĐT và CLB. Sau thời điểm đăng bài đó, trong tháng khi có phát sinh các việc mới hoặc có PT đăng ký bổ sung thì ĐT có cần phải đăng 1 bài mới không ạ hay chỉ cần cập nhật thông tin đăng ký mới vào link doc trước đó đã đăng là được ạ?
Ý 1: Đăng lại bài riêng các mục mới bổ sung.
Ý 2: ĐT chỉ cần cập nhật thêm vào link mà ĐT đã đăng trước đó của tháng là được.
2. PT đăng ký phát nguyện tu CT Thiền Tứ Niệm Xứ. Theo hướng dẫn của NLCLB: thời gian phát nguyện tối đa 49 ngày, nhưng CT này hoặc CT mùa hạ kéo dài hơn 49 ngày. ĐT xin được hỏi trường hợp này chỉ đăng ký cho PT phát nguyện tu từng đợt 49 ngày hết rồi mới đăng ký lại đúng không ạ?
Ý 1: Phát nguyện mỗi đợt 49 ngày xong phát nguyện tiếp gối đầu nhau để không bị chồng chéo nhiều chương trình tu ảnh hưởng tri kiến theo lộ trình.
Ý 2: Có thể phát nguyện 2, 3 lần 49 ngày như bài tu tập sám hối chuyển hóa bài tu số 8.
3. Khi PT tu bù các phát nguyện nhưng trong hướng dẫn của NLCLB không có nội dung văn bạch tu bù thì PT thực hành chi tiết như thế nào ạ?
Ý 1: Dùng văn bạch của ngày tiếp theo và bạch thêm là "thực hành bù thời khóa (tên)... của ngày... theo phát nguyện".$Q$, $Q$1. Ý 1.
2. Ý 1.
3. Dùng theo văn bạch ngày tiếp theo, đọc theo văn bạch ạ.$Q$, $Q$2026-07-15T14:57:11.924Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.921Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.934Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431926_kmb2e$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Trong đăng ký phát nguyện hát tán dương, PT có đăng ký từ đầu tháng đến cuối tháng.
1.1: Phật tử khi đăng ký theo tháng thì trong tháng PT thực hành sẽ nghỉ các ngày tu học theo hướng dẫn của CLB, vậy có được tính đủ theo tháng không ạ? Hay PT nên đăng ký theo số ngày trong tháng sau khi trừ đi các ngày tu học ạ?
1.2: Trong hướng dẫn nghỉ các phát nguyện vào các ngày tu học 8,14,30 tại nhà/chùa/nhóm. Theo ý hiểu của đạo tràng thì PT về chùa công quả cũng nghỉ hết các phát nguyện có đúng không ạ? Hay chỉ nghỉ phát nguyện vào ngày tu học?$Q$, $Q$1.1. Không đăng ký phát nguyện vào các ngày tu học định kỳ.
1.2. PT về chùa công quả cũng nghỉ hết các phát nguyện.$Q$, $Q$2026-07-15T14:57:11.928Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.926Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.950Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431932_zhyq4$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$Được sự phân công của LĐĐT_Bộ phận hỗ trợ Phật tử cùng sự đồng thuận của NLĐT_Bộ phận hỗ trợ, đạo hữu xin đại diện NLĐT_Bộ phận hỗ trợ xin gửi nội dung câu hỏi như sau.$Q$, $Q$1. Trong đạo tràng có CSĐT do vi phạm quy ước bị xuống thành phần dự thính bạch lại các bài bạch, PT xin vẫn làm phận sự là CSĐT, đang bạch lại bài phát nguyện 49 ngày, trường hợp này PT có được bạch xin người tinh tấn cùng CSĐT không ạ?
2. Trong văn bạch xin người tinh tấn, khi CSĐT đăng ký bạch, ví dụ PT làm phận sự ở các bộ phận hỗ trợ NLĐT, YTĐT thì khi bạch ở đoạn "Đệ tử con tên là... Pháp danh:... (Làm việc tại (các) bộ phận hỗ trợ)" sẽ bạch theo bộ phận cụ thể hay theo CSĐT chung ạ?
3. PHẦN 7: VĂN BẠCH CHUNG CHO CÁC TRƯỜNG HỢP TU THEO CÁC PHÁT NGUYỆN/TU ĐUỔI có hướng dẫn: khi một Phật tử đã tụng kinh Tam Bảo hằng ngày theo phát nguyện, nếu phát sinh thêm việc tu hồi hướng cho một đạo hữu (khai đàn – tu tiếp – kết đàn) thì không cần lập thêm thời khóa tụng riêng, chỉ cần bổ sung nội dung hồi hướng và mong cầu vào văn bạch hằng ngày, đồng thời hồi hướng thêm trong chính thời khóa tụng kinh Tam Bảo đã phát nguyện. NLĐT chưa hiểu thực hành thế nào ở đoạn "đồng thời hồi hướng thêm trong chính thời khóa tụng kinh Tam Bảo đã phát nguyện".
4. Khi PT phát nguyện tụng kinh Tam bảo hồi hướng nhiều nghiệp/hiện tượng ngày khai đàn cùng ngày, ngày kết khác nhau thì hướng dẫn PT bạch thế nào:
Ý 1: PT bạch văn bạch chung 1 lần bạch gộp các nội dung, kết thì bạch riêng.
Ý 2: PT bạch văn bạch chung tương ứng với nghiệp/hiện tượng đăng ký, không bạch gộp.$Q$, $Q$1. Được ạ.
2. Ý 1 (làm việc tại các bộ phận hỗ trợ NLĐT_Bộ phận hỗ trợ, YTĐT_Bộ phận hỗ trợ).
3. Phật tử sử dụng văn bạch hằng ngày, bổ sung nội dung vào đoạn: "(Tùy duyên có/không đọc lại tên/sự việc; nếu có phát sinh mới hay thay đổi thì đọc.)"
4. Ý 1.$Q$, $Q$2026-07-15T14:57:11.935Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.933Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.961Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431936_mmxrs$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$1. Trong ĐT có 7 PT (đủ 1 nhóm) đăng ký phát nguyện tụng kinh Tam Bảo (cùng tụng kinh trong ngày) để hồi hướng cho mong cầu của từng PT thì có được tính là tu nhóm không ạ?
2. Trong những ngày tu học 3, 8, 14, 20, 30 hàng tháng, trước khi vào thời khóa thì dùng văn bạch nào cho đúng pháp ạ?$Q$, $Q$1. Được ạ.
2. Theo hướng dẫn tại Văn bạch và hồi hướng dành cho nghe pháp/ngồi thiền, thiền hành.$Q$, $Q$2026-07-15T14:57:11.940Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.936Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.968Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431942_tn3qb$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Trong ĐT có Phật tử thành phần C chưa bạch phát nguyện bồ đề tu lục hòa xin đăng ký cá nhân tụng kinh Tam Bảo trong 7 ngày để hồi hướng cho bản thân phật tử.
Ý 1: Phật tử C chưa phát nguyện bồ đề tu lục hòa thì khi cá nhân phát nguyện tụng kinh Tam Bảo cần phát nguyện tu thêm Cầu An hoặc cầu siêu cho mong cầu của phật tử nữa.
Ý 2: Phật tử C tự cá nhân phát nguyện thì có thể tự hồi hướng cho các mong cầu của bản thân không cần tu thêm Cầu An hoặc cầu siêu, bài 8… chỉ có hồi hướng cho bố mẹ, chồng, con, anh, chị, em… thì mới cần phát nguyện tu thêm.$Q$, $Q$$Q$, $Q$2026-07-15T14:57:11.944Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.942Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.979Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431947_li2s2$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Nhóm đã tổng hợp xong danh sách gửi về NL CLB cho "Đăng Ký Chung Cho Các Phát Nguyện Và Xin Hồi Hướng Công Đức Lục Hoà Tại Đạo Tràng Và Câu Lạc Bộ Tháng 2/BN" rồi. Sau đó có Phật tử thuộc thành phần c mới báo đăng ký tụng kinh Tam Bảo và kinh Địa Tạng để mong cầu hồi hướng cho bố.
Ý 1: Sau khi đã tổng hợp cho các phát nguyện tháng thì thành phần Phật tử C mới phát nguyện có được bạch bổ sung lên NL CLB chứng minh không, hay chỉ thành phần đã bạch xong bài 49 ngày mới được bạch lên?
Ý 2: Nếu được bạch bổ sung lên NL CLB thì có bổ sung luôn vào đường link đã đăng bài mà không cần đăng riêng một bài mới không?
Ý 3: Cá nhân Phật tử phát nguyện tụng Kinh Tam Bảo và Kinh Địa Tạng để hồi hướng theo mong cầu của Phật tử thì có đúng hướng dẫn từ NL CLB không? (Hiểu là cá nhân muốn hồi hướng cho nghiệp/hiện tượng khổ thì phát nguyện tu cầu an, cầu siêu hoá giải oán kết/bài 8; còn tụng kinh Tam Bảo thì do CLB phát động hoặc các Phật tử trong nhóm trợ duyên tụng kinh để hồi hướng cho các hiện tượng cấp bách.)$Q$, $Q$1. ĐT xem kỹ lại: Đối tượng thực hành phát nguyện là thành phần a, b, c, d. Không có hướng dẫn về việc phát nguyện tụng kinh Địa Tạng.
2. Đăng riêng.
3. Cá nhân thuộc thành phần a, b, c, d được đăng ký thực hành các phát nguyện theo hướng dẫn tại link: https://docs.google.com/document/d/13CrCAjWS8Z_TGZFxLzktqVpAtwJMKqoys3sZeY0s7II/edit để hồi hướng cho mong cầu riêng.$Q$, $Q$2026-07-15T14:57:11.950Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.947Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:47.985Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431951_r5q8a$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Trong ĐT có PT đã đăng ký Tụng kinh Tam Bảo, hát tán dương và bạch 7 lễ tri ân khiến không lú lẫn tuổi già. Sắp tới PT đăng ký về chùa làm công quả và tham gia các chương trình tu tập của chùa như Lễ Ngũ Bách Danh, Lương Hoàng Bảo Sám.
Ý hỏi 1: Trường hợp này PT có phải bạch xin nghỉ không ạ?
Ý hỏi 2: Khi về nhà PT có phải tu bù không ạ?$Q$, $Q$1. Không.
2. Nếu sau khi công quả về mà tu bù kịp trong thời gian phát nguyện thì có bạch xin nghỉ và tu bù theo quy ước chung được hướng dẫn tại link: https://docs.google.com/document/d/13CrCAjWS8Z_TGZFxLzktqVpAtwJMKqoys3sZeY0s7II/edit. Nếu không tu bù kịp thì bạch chân thật xin hủy phát nguyện.$Q$, $Q$2026-07-15T14:57:11.954Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.951Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:48.003Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431955_zbyul$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$PT đang tu bài 8 giải điện do mẹ của PT lập, nay mẹ đã cao tuổi thì để cho con cháu thờ ở điện. Dự kiến đợt tới gia đình PT mời Chư Tăng về tác lễ giải điện. Gần đây anh trai PT có giấc mơ báo là mẹ của PT sẽ mất vào một ngày cụ thể, kiểm tra lịch thì đúng trùng ngày nên gia đình rất lo lắng, hiện tại mẹ cao tuổi nhưng vẫn khỏe mạnh. ĐT đã hướng dẫn cho PT tu hồi hướng và tụng Kinh Tam Bảo cá nhân.
1. PT muốn xin ĐT trợ duyên tụng Kinh Tam Bảo và xin hồi hướng công đức Lục Hoà tại ĐT để hồi hướng cho hiện tượng báo qua giấc mơ, và hồi hướng cho mẹ được mạnh khỏe thì ĐT có cùng nhau phát nguyện tụng Kinh Tam Bảo và hồi hướng công đức Lục Hoà cho mẹ PT được không ạ.
2. Trong trường hợp chung không liên quan đến PT trên, nếu các PT khác có giấc mơ dữ bất thường (tai nạn, có người chết...) thì PT đó có xin ĐT tụng Kinh Tam Bảo trợ duyên và xin hồi hướng công đức Lục Hoà tại ĐT được không ạ.$Q$, $Q$1, 2. Được.$Q$, $Q$2026-07-15T14:57:11.958Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.955Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:48.019Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431961_y1893$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Hiện tại PT đang bạch phát nguyện tụng kinh Tam Bảo từ đầu tháng và vẫn còn trong thời gian tụng, nhưng PT muốn đăng ký phát nguyện tụng thêm 1 đợt khác để hồi hướng khác với mong cầu lần đầu thì có được không ạ?
Ý 1: được, vì 2 phát nguyện là nội dung khác nhau.
Ý 2: không được, sau khi kết đàn mới đăng ký đợt tiếp theo.$Q$, $Q$Ý 2.$Q$, $Q$2026-07-15T14:57:11.962Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.961Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:48.029Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431965_saqya$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Trong ĐT có phát nguyện hát 4 bài hát theo ĐT vào giờ cố định 1 buổi/tuần, nhưng không phải lúc nào PT cũng đủ duyên để hát được. Như vậy phải xin nghỉ và có bị là phá nguyện không? Nếu có thì cần thay đổi phát nguyện đăng ký thế nào để PT không bị vướng duyên như thế ạ?$Q$, $Q$1. Thời gian thực hành trong ngày: Tùy duyên (bao gồm cả trường hợp phát nguyện theo nhóm/đạo tràng).
2. Bận xin nghỉ và thực hiện sau. Có thể thực hiện bù trong thời gian phát nguyện. Hình thức thực hành bù: Thực hiện không quá 3 lần/ngày (thực hiện bù 2 ngày vào 1 ngày chính).$Q$, $Q$2026-07-15T14:57:11.968Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.965Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:48.037Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431971_heahp$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$1. ĐT đang phát động chương trình tụng kinh Tam Bảo để hồi hướng công đức lục hòa cho các ĐH đang tu các chương trình cầu an, hóa giải oán kết... Chúng con có cho PT đăng ký tùy duyên tu phát nguyện trong ngày và ĐT chọn một khung giờ chung trong ngày để nếu đủ duyên thì cùng nhau tu theo phát nguyện bằng cách mở link trực tuyến. Xin được sự chứng minh từ CLB_Bộ phận hỗ trợ cho phép chúng con tùy theo nhân duyên của ĐT và PT mà được mở link trực tuyến sao cho phù hợp, có thể tự tu hoặc tu chung cùng khung giờ ạ.
2. Sau mỗi thời gian mở link trực tuyến tu theo các chương trình phát nguyện thì chúng con cũng có thể tùy duyên chia sẻ, hướng dẫn tu tập... cho các ĐH qua các câu hỏi trực tiếp để trợ duyên cho các ĐH ạ.$Q$, $Q$1. CLB từng chỉ dạy chỉ nên phát nguyện tùy duyên hát trong ngày, không nên ấn định cứng nhắc vào 1 khung giờ ạ. Lý do: Nếu đã phát nguyện hát đúng giờ mà bận đột xuất hát sai giờ thì sẽ bị mất công đức lục hòa, rất thiệt thòi cho Phật tử.
2. Việc chia sẻ, hướng dẫn tu tập thì ĐT thực hiện theo quy định của CLB.$Q$, $Q$2026-07-15T14:57:11.973Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.971Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:48.049Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431976_7bq0z$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Trong Nhóm có phát nguyện tụng kinh Tam Bảo để hồi hướng cho chị gái của Phật tử thành phần B đã phát nguyện bị bệnh trọng và 1 Phật tử thành phần C đi mổ. Nhóm có phát nguyện 25 ngày để hồi hướng. Chị gái của Phật tử đã bỏ báo thân giữa đợt phát nguyện; Phật tử đi mổ thì đã mổ và được xuất viện. Nhóm vẫn hướng dẫn các Phật tử thực hành phát nguyện hằng ngày để hồi hướng.
1. Theo hướng dẫn "Trường hợp hồi hướng cho người chết: 1 lần và trong thời gian còn trong 49 ngày": Nhóm phát nguyện tụng kinh Tam Bảo như trên với mục mong cầu bệnh căn thuyên giảm, nhưng nhân duyên TC đã bỏ báo thân thì ngày kết đàn sẽ bạch hồi hướng như đăng ký cũ hay theo mục hồi hướng cho HL ạ?
2. Tháng tới đây chị gái Phật tử vẫn còn trong 49 ngày, Nhóm vẫn đăng ký hồi hướng theo hướng dẫn hồi hướng cho người mất, tính thời gian đến khi hết ngày thứ 49 được phải không ạ?$Q$, $Q$1. Nhóm vẫn tiếp tục thực hành cho đủ thời gian đã phát nguyện, nhưng tại ngày kết đàn sẽ thay đổi nội dung hồi hướng từ mục mong cầu chữa bệnh sang hồi hướng cho hương linh của người đã mất.
2. Đúng.$Q$, $Q$2026-07-15T14:57:11.978Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.976Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:48.058Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431980_uhwpr$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$1. Trong ĐT có PT A đã bạch bài 49, đang tu bài 8 cho con trai 9 tuổi trên nhiều hiện tượng, khi tu sang quyển 2 thì phát sinh nghiệp phi nhân làm hại qua hiện tượng nhẹ (thỉnh thoảng nói cười, nhảy nhót vô cớ không kiểm soát trong ngày; đêm ngủ thức dậy khóc, nói nhảm, khoảng 3 đêm/tuần, mỗi lần 2-3 phút rồi ngủ tiếp).
1.1: ĐT xin hỏi trường hợp này PT có được xin hồi hướng công đức Lục Hoà trên CLB không ạ? (ĐT xét thấy đây là nghiệp phi nhân làm hại nhẹ, không ảnh hưởng nhiều đến cuộc sống hàng ngày nên được đăng ký hồi hướng.)
1.2: Trường hợp này có được gọi là nghiệp phi nhân làm hại nặng cần tu 7 quyển bài 8 mới được xin hồi hướng không ạ?
2. Trong văn bạch hàng ngày dành cho PT đăng ký xin hồi hướng trên CLB, PT sẽ bạch hàng ngày cho đến hết tháng mà PT đăng ký bài lên CLB đúng không ạ? Ví dụ: PT xin đăng ký hồi hướng trên CLB vào ngày 1/3/BN và đăng vào bài đăng ký tháng 3 trên NLCLB, vậy PT sẽ bạch đến hết tháng 3 là dừng đọc văn bạch hồi hướng đúng không ạ?$Q$, $Q$1. Phật tử A chưa đủ điều kiện xin hồi hướng trên Câu lạc bộ vì mới tu quyển 2 (quy định yêu cầu đang/đã tu từ 7 lần 49 ngày trở lên).
2. Bạch đến khi nào xin dừng hồi hướng ạ.$Q$, $Q$2026-07-15T14:57:11.983Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.980Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:48.069Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431984_z5mr1$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Đạo tràng đã đăng bài để đăng ký hồi hướng thi cử cho con của Phật tử thi vào một ngày cụ thể, nhưng sau đó Phật tử mới phát hiện ra là đã nhầm ngày thi của con (ngày thi thật là một tháng sau đó). Vậy Phật tử có được hồi hướng tiếp cho con hay dừng lại chờ để đăng ký lại trước 1 tháng khi con thi ạ?$Q$, $Q$Phật tử nên bạch sám hối lỗi và đăng ký lại thông tin chính xác vào đợt đăng ký trước kỳ thi 1 tháng.$Q$, $Q$2026-07-15T14:57:11.988Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.984Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:48.077Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;
insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($Q$q_1784127431991_fjm59$Q$, $Q$THỰC HÀNH CÁC PHÁT NGUYỆN TU/ HÁT TÁN DƯƠNG - ĐĂNG KÝ HỒI HƯỚNG TẠI ĐẠO TRÀNG, CÂU LẠC BỘ$Q$, $Q$$Q$, $Q$Cán sự đạo tràng cùng nhau phát nguyện tụng kinh Tam Bảo để hồi hướng cho chánh Pháp trụ lâu dài và vẫn chưa đến ngày kết đàn. Tuy nhiên khi làm phận sự, do 1 cán sự trong nghi lễ ĐT nhắc sai thông tin nên có 1 đạo hữu đã bạch tại phần văn bạch trước khi tụng là "kết đàn" và tụng xong phần kinh, khi chuẩn bị bạch văn bạch sau khi tụng kinh thì đạo hữu mới phát hiện ra là sai ngày kết đàn. Sau đó đạo hữu đã bạch Phật sám hối luôn và xin được tu thời khoá hàng ngày bình thường thì có được hay không ạ? Hay đạo hữu cần phải hủy phát nguyện ạ?$Q$, $Q$PT tiếp tục thực hành cho đến ngày kết đàn thực tế để hoàn thành nguyện chứ không cần phải hủy phát nguyện.$Q$, $Q$2026-07-15T14:57:11.992Z$Q$, $Q$$Q$, $Q$[{"action":"tao_moi","at":"2026-07-15T14:57:11.991Z","nguoiSua":"Nhap tu bai dang Facebook - Phat nguyen/hat tan duong"},{"action":"cap_nhat","at":"2026-07-16T04:22:48.084Z","nguoiSua":"Sua chu de theo yeu cau"}]$Q$::jsonb) on conflict (id) do nothing;

insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r1$Q$, $Q$lunar$Q$, 29, null, null, $Q$LƯU Ý NẾU KHÔNG THAM GIA CHƯƠNG TRÌNH CẦU SIÊU TRỰC TUYẾN THÌ BẠCH THEO VĂN BẠCH TRONG LINK CÒN NẾU THAM GIA TRỰC TUYẾN THÌ BẠCH THEO VĂN BẠCH TRÊN MÀN HÌNH Ạ
https://phamthiyen.com/van-bach-tham-gia-cac-chuong-trinh-truc-tuyen-cua-chuacau-lac-bo-c4246.html$Q$, $Q$Nhắc vào ngày 29 đối với tháng đủ 30 ngày$Q$, $Q$$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r2$Q$, $Q$lunar$Q$, 29, null, null, $Q$*🌺🌺 LỜI NHẮC 🌺🌺*

Kính thưa các đạo hữu,
CS Khối xin thỉnh các đạo hữu lưu ý:
 *Không thực hành các phát nguyện trong thời gian về chùa và các ngày tu học định kỳ (8, 14, 29/30) tại nhà, nhóm, chùa* như:
*Bạch xin người tinh tấn, Tụng kinh Tam Bảo, Hát tán dương, Nghe Pháp và ngồi thiền, thiền hành theo phát nguyện đã đăng kí*.

Trường hợp đăng kí phát nguyện mà có các ngày 08, 14, 29/30 thì các đạo hữu bạch xin nghỉ và thực hiện bù trong thời gian phát nguyện ạ.
Trường hợp đăng kí phát nguyện đã trừ các ngày 08, 14, 29/30 hoặc không rơi vào các ngày trên thì không cần bạch nghỉ và tụng bù ạ.

CS Khối xin thỉnh các đạo hữu lưu tâm ạ
Xin tuỳ hỷ công đức của các đạo hữu ạ.$Q$, $Q$Nhắc vào ngày 29 đối với tháng đủ 30 ngày$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r3$Q$, $Q$lunar$Q$, 29, null, null, $Q$Cúng mùng 1: https://phamthiyen.com/bai-cung-mung-1-ram-c3581.html$Q$, $Q$Nhắc vào ngày 29 đối với tháng thiếu$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r4$Q$, $Q$lunar$Q$, 29, null, null, $Q$NHẮC VĂN BẠCH TRƯỚC KHI NGHE PHÁP ĐỊNH KÌ NGÀY 03, 08, 14, 20, 30 (29) 
https://phamthiyen.com/van-bach-nghe-phap-ngoi-thien-c5167.html$Q$, $Q$Nhắc vào ngày 29 đối với tháng thiếu$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r5$Q$, $Q$lunar$Q$, 29, null, null, $Q$🌺🌺🌺 LỜI NHẮC BẠCH CÁC BÀI BẠCH PHÁT NGUYỆN
-------------------------------
👉1 - BẠCH PHÁT NGUYỆN BỒ ĐỀ TU LỤC HÒA
🌷🌷- Thời gian bạch: Ngày mùng 08
- Bạch sau khi nhận Bát quan trai giới
Link bài bạch:
https://phamthiyen.com/phat-nguyen-bo-de-tu-luc-hoa-c4291.html

👉2 - BẠCH PHÁT NGUYỆN 49 NGÀY
(Thực hành công hạnh Bồ Đề: Nam Mô Lâm Tỳ Ni Viên)
* Đọc tại nhà trước 3 ngày chùa tổ chức tu Bát quan trai giới.
(Bắt đầu từ ngày mùng 05, 06,07)
🌷🌷- Thời gian bạch phát nguyện 49 ngày: Ngày mùng 07
- Bạch sau khi nhận Bát quan trai giới.
Link đọc trước 3 ngày và bài bạch phát nguyện 49 ngày:
https://phamthiyen.com/phat-nguyen-49-ngay-c4292.html

👉3 - BẠCH PHÁT NGUYỆN 108 NGÀY
*Bạch văn bạch tại nhà trước 7 ngày. (Bắt đầu từ ngày 30/11, 01, 02, 03, 04, 05, 06/12) 

🌷 🌷- Thời gian bạch phát nguyện 108 ngày: Ngày mùng 07
- Bạch văn bạch trước khi Phật tử đại diện của câu lạc bộ Cúc Vàng (Chủ nhiệm câu lạc bộ) bạch phát nguyện và có thể sớm trước 30 phút.
Link đọc trước 07 ngày và bài bạch phát nguyện 108 ngày:
https://phamthiyen.com/phat-nguyen-108-ngay-c761.html
Lưu ý phần điều kiện riêng để được bạch bài 108 ngày là đối với chương trình tu kỷ niệm Đức Phật thành đạo, phải tu đủ, không tu tùy duyên. Nội dung tu: phù hợp với duyên vào đạo tràng trước sau (mỗi năm tu 1 phần).

Thỉnh các ĐH nắm bắt ạ$Q$, $Q$Không nhắc bài này$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r6$Q$, $Q$lunar$Q$, 30, null, null, $Q$Cúng mùng 1: https://phamthiyen.com/bai-cung-mung-1-ram-c3581.html$Q$, $Q$Nhắc vào ngày 30 đối với tháng đủ$Q$, $Q$ĐH Mỹ$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r7$Q$, $Q$lunar$Q$, 30, null, null, $Q$NHẮC VĂN BẠCH TRƯỚC KHI NGHE PHÁP ĐỊNH KÌ NGÀY 03, 08, 14, 20, 30 (29) 
https://phamthiyen.com/van-bach-nghe-phap-ngoi-thien-c5167.html$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r8$Q$, $Q$lunar$Q$, 1, null, null, $Q$[LỜI NHẮC] GIẤY THỈNH MỜI ĐẠO TRÀNG/NHÓM TRỢ DUYÊN TỤNG KINH, LÀM NGHI THỨC CÚNG LỄ PHẬT GIÁO

Mẫu giấy thỉnh mời đạo tràng/nhóm trợ duyên tụng kinh, làm nghi thức cúng lễ Phật giáo, gồm có 2 biểu mẫu:
Mẫu 1: Áp dụng trong trường hợp tu tại Nhà/nhà trọ/nơi tín chủ sở hữu.
Mẫu 2: Áp dụng trong trường hợp tu tại địa điểm tu nhờ.

Ghi chú hướng dẫn dùng biểu mẫu 2:
Phần “chúng tôi”: Ghi thông tin của người chủ địa chỉ tu và thông tin của tín chủ. Cả 2 cùng ký vào phần “Người Thỉnh Mời” cuối trang.

Link mẫu giấy:
https://docs.google.com/document/d/1_NgT40rlYb8G1aQmt29Oyg0jvD2Ljf-r/edit

HƯỚNG DẪN THỰC HIỆN
Link:
https://docs.google.com/document/d/1tjqk1ViEtzlpGar_ltt9MfLdY1yc_sa0cKjXj366QWk/edit?tab=t.0
 
LĐĐT, NLĐT thường xuyên xem để nắm bắt nội dung cập nhật mới trong link.

Xin tùy hỷ công đức của các quý đạo hữu ạ!$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r9$Q$, $Q$lunar$Q$, 1, null, null, $Q$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r10$Q$, $Q$lunar$Q$, 3, null, null, $Q$NHẮC VĂN BẠCH TRƯỚC KHI NGHE PHÁP ĐỊNH KÌ NGÀY 03, 08, 14, 20, 30 (29) 
https://phamthiyen.com/van-bach-nghe-phap-ngoi-thien-c5167.html$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r11$Q$, $Q$lunar$Q$, 4, null, null, $Q$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r12$Q$, $Q$lunar$Q$, 4, null, null, $Q$🌺🌺🌺 LỜI NHẮC BẠCH CÁC BÀI BẠCH PHÁT NGUYỆN
-------------------------------
👉1 - BẠCH PHÁT NGUYỆN BỒ ĐỀ TU LỤC HÒA
🌷🌷- Thời gian bạch: Ngày mùng 7
- Bạch sau khi nhận Bát quan trai giới
Link bài bạch:
https://phamthiyen.com/phat-nguyen-bo-de-tu-luc-hoa-c4291.html
👉2 - BẠCH PHÁT NGUYỆN 49 NGÀY
(Thực hành công hạnh Bồ Đề: Nam Mô Lâm Tỳ Ni Viên)
* Đọc tại nhà trước 3 ngày chùa tổ chức tu Bát quan trai giới.
(Bắt đầu từ ngày mùng 04, 05, 06)
🌷🌷- Thời gian bạch phát nguyện 49 ngày: Ngày mùng 07
- Bạch sau khi nhận Bát quan trai giới.
Link đọc trước 3 ngày và bài bạch phát nguyện 49 ngày:
https://phamthiyen.com/phat-nguyen-49-ngay-c4292.html
Thỉnh các ĐH nắm bắt ạ$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r13$Q$, $Q$lunar$Q$, 4, null, null, $Q$*🌺 🌺 🌺 (LỜI NHẮC) NGỒI THIỀN SAU CHƯƠNG TRÌNH TRẠCH PHÁP CỦA CCN VÀO CÁC NGÀY 03,20 HÀNG THÁNG*

Kính thưa các quý đạo hữu!

CS khối xin gửi lời nhắc lịch ngồi thiền sau khi nghe trạch pháp ngày 03,20 hàng tháng.

Xin thỉnh các Nhóm/ĐT nắm bắt và nhắc PT lưu tâm áp dụng đối với những buổi có đề mục thiền quán ạ.

Nếu nghe trạch Pháp đúng ngày, PT ngồi thiền trong vòng 3 ngày ngay sau ngày nghe Pháp thì được tính nghe trực tuyến đúng ngày.

Nếu nghe trạch Pháp sau trong vòng 10 ngày, ngồi thiền sau 3 ngày, tổng 13 ngày sau ngày trạch Pháp của CLB.

Xin tuỳ hỷ các đạo hữu ạ.$Q$, $Q$$Q$, $Q$ĐH Mỹ$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r14$Q$, $Q$lunar$Q$, 4, null, null, $Q$🌺🌺🌺 LỜI NHẮC BẠCH CÁC BÀI BẠCH PHÁT NGUYỆN
-------------------------------
👉1 - BẠCH PHÁT NGUYỆN BỒ ĐỀ TU LỤC HÒA
🌷🌷- Thời gian bạch: Ngày mùng 8
- Bạch sau khi nhận Bát quan trai giới
Link bài bạch:
https://phamthiyen.com/phat-nguyen-bo-de-tu-luc-hoa-c4291.html
👉2 - BẠCH PHÁT NGUYỆN 49 NGÀY
(Thực hành công hạnh Bồ Đề: Nam Mô Lâm Tỳ Ni Viên)
* Đọc tại nhà trước 3 ngày chùa tổ chức tu Bát quan trai giới.
(Bắt đầu từ ngày mùng 05, 06, 07)
🌷- Thời gian bạch phát nguyện 49 ngày: Ngày mùng 08
- Bạch sau khi nhận Bát quan trai giới.
Link đọc trước 3 ngày và bài bạch phát nguyện 49 ngày:
https://phamthiyen.com/phat-nguyen-49-ngay-c4292.html
Thỉnh các ĐH nắm bắt ạ$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r15$Q$, $Q$lunar$Q$, 6, null, null, $Q$🌺🌺 (NHẮC LỊCH) NGHI THỨC TU TẬP TRƯỚC KHI THAM DỰ LỄ CẦU SIÊU 🌺 🌺
CS Khối xin nhắc lịch tu trước khi tham dự lễ cầu siêu đến các Nhóm/ĐT như sau:
A. TRƯỜNG HỢP ĐĂNG KÝ CẦU SIÊU - ĐANG TU BÀI 8
CẦN THỰC HÀNH NGHI THỨC KINH PHỤ BÀI KINH ""TIỂU CHỦ NGÂN KHỐ"" TRƯỚC LỄ CẦU SIÊU TỪ 3 – 7 NGÀY
1. Các đạo hữu đăng ký cầu siêu cần: Tụng bài kinh “Tiểu chủ ngân khố” liền trước lễ cầu siêu từ 3-7 ngày, có thể tụng gộp hay riêng với các thời đang tu.
2. Cách thực hành:
✍ Trường hợp tu vào ngày nghe Pháp:
- Phần nghi thức: Thực hành theo nghi thức tụng kinh - bài tu số 8
Link: https://bom.so/9SWWMY
- Phần kinh: Tụng bài kinh “Tiểu chủ ngân khố” theo Link bài kinh: https://bom.so/bWMYLy
=> Tụng xong phần văn kinh -> thì đọc tiếp khai thị lấy ở phần (B) Văn Khai Thị  phía dưới ở link:
https://bom.so/gXMw2K
✍ Trường hợp tu vào ngày tụng kinh:
- Tụng theo nghi thức tụng kinh bài tu số 8 -> sau khi tụng kinh chính thì tụng thêm bài kinh “Tiểu chủ ngân khố” => sau đó đọc tiếp khai thị ở phần (B) Văn Khai Thị ở link trên.
B. CÁC TRƯỜNG HỢP ĐĂNG KÝ CẦU SIÊU KHÁC - KHÔNG TU BÀI 8
THỰC HÀNH THEO NGHI THỨC LÀM LỄ TẠI NHÀ TRƯỚC KHI THAM DỰ LỄ CẦU SIÊU TỪ 3 - 7 NGÀY:
https://bom.so/HKKSJK
C. TRƯỜNG HỢP ĐĂNG KÝ CẦU SIÊU HƯƠNG LINH THAI NHI:
THỰC HIỆN THEO NGHI THỨC LÀM LỄ TẠI NHÀ TRƯỚC KHI THAM DỰ LỄ CẦU SIÊU HƯƠNG LINH THAI NHI:
https://bom.so/5btrCT
Xin tùy hỷ công đức của các đạo hữu ạ!$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r16$Q$, $Q$lunar$Q$, 7, null, null, $Q$*🌺🌺 LỜI NHẮC KHÔNG THỰC HÀNH CÁC PHÁT NGUYỆN TRONG THỜI GIAN VỀ CHÙA TU HỌC🌺🌺*

Kính thưa các đạo hữu,
CS Khối xin thỉnh các đạo hữu lưu ý:
 *Không thực hành các phát nguyện trong thời gian về chùa và các ngày tu học định kỳ (8, 14, 29/30) tại nhà, nhóm, chùa* như:
*Bạch xin người tinh tấn, Tụng kinh Tam Bảo, Hát tán dương, Nghe Pháp và ngồi thiền, thiền hành theo phát nguyện đã đăng kí*.

Trường hợp đăng kí phát nguyện mà có các ngày 08, 14, 29/30 thì các đạo hữu bạch xin nghỉ và thực hiện bù trong thời gian phát nguyện ạ.
Trường hợp đăng kí phát nguyện đã trừ các ngày 08, 14, 29/30 hoặc không rơi vào các ngày trên thì không cần bạch nghỉ và tụng bù ạ.

CS Khối xin thỉnh các đạo hữu lưu tâm ạ
Xin tuỳ hỷ công đức của các đạo hữu ạ.$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r17$Q$, $Q$lunar$Q$, 7, null, null, $Q$🌺 LỜI NHẮC VỀ VIỆC THỈNH HƯƠNG LINH KHI VỀ CHÙA TU TẬP, PHẬN SỰ 🌺

Khi về chùa tu tập Bát Quan Trai, công quả, các quý đạo hữu chỉ cần bạch tại nhà theo nội dung sau để thỉnh các mục hương linh về chùa.
- Đối tượng: Tất cả các thành phần a, b, c, d, e
- Địa điểm bạch: Tùy duyên.
- Lưu ý: Nếu ở nhà quên bạch thỉnh văn bạch này, thì khi về chùa không bạch văn bạch này nữa.
- Văn bạch:
Nam Mô Phật Bổn Sư Thích Ca Mâu Ni!
Đệ tử con tên là:… Pháp danh:… ở (trọ/nhờ)... tại địa chỉ:… (là thành phần đang/đã bạch bài phát nguyện 49 ngày) đang (tu tập/nương tựa)... tại đạo tràng… thuộc câu lạc bộ Cúc Vàng.
Nhân duyên ngày… tháng... năm… con về chùa (tu tập/công quả…).
Con xin thỉnh tất cả chư vị hương linh gia tiên, tiền tổ; chư hương linh hữu duyên với con được về chùa Ba Vàng tùy duyên tu tập và thọ thực khi chư Tăng cúng thí thực tại chùa trong thời gian con về chùa.
Nam Mô Phật Bổn Sư Thích Ca Mâu Ni!$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r18$Q$, $Q$lunar$Q$, 7, null, null, $Q$🌿🌸 KÍNH THƯA CÁC ĐẠO HỮU CS KHỐI XIN GỬI LINK TU BQT VÀ LINK TU TẬP TRÊN XE VỀ CHÙA NGÀY MÙNG 8,9
👉 Link tu BQT:
https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
👉 Link tu tập trên xe về Chùa:
https://phamthiyen.com/chuong-trinh-tu-tap-tren-xe-ve-chua-vao-cac-ngay-tu-bat-quan-trai-c1995.html
Xin tùy hỷ công đức của các quý đạo hữu ạ$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r19$Q$, $Q$lunar$Q$, 7, null, null, $Q$NHẮC VĂN BẠCH TRƯỚC KHI NGHE PHÁP ĐỊNH KÌ NGÀY 03, 08, 14, 20, 30 (29) 
https://phamthiyen.com/van-bach-nghe-phap-ngoi-thien-c5167.html$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r20$Q$, $Q$lunar$Q$, 10, null, null, $Q$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r21$Q$, $Q$lunar$Q$, 13, null, null, $Q$LƯU Ý NẾU KHÔNG THAM GIA CHƯƠNG TRÌNH CẦU SIÊU TRỰC TUYẾN THÌ BẠCH THEO VĂN BẠCH TRONG LINK CÒN NẾU THAM GIA TRỰC TUYẾN THÌ BẠCH THEO VĂN BẠCH TRÊN MÀN HÌNH Ạ
https://phamthiyen.com/van-bach-tham-gia-cac-chuong-trinh-truc-tuyen-cua-chuacau-lac-bo-c4246.html$Q$, $Q$$Q$, $Q$$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r22$Q$, $Q$lunar$Q$, 13, null, null, $Q$*🌺🌺 LỜI NHẮC NGHỈ TU CÁC CHƯƠNG TRÌNH PHÁT NGUYỆN TRONG NGÀY TU HỌC THƯỜNG KỲ

Kính thưa các đạo hữu,
CS Khối xin thỉnh các đạo hữu lưu ý:
 *Không thực hành các phát nguyện trong thời gian về chùa và các ngày tu học định kỳ (8, 14, 29/30) tại nhà, nhóm, chùa* như:
*Bạch xin người tinh tấn, Tụng kinh Tam Bảo, Hát tán dương, Nghe Pháp và ngồi thiền, thiền hành theo phát nguyện đã đăng kí*.

Trường hợp đăng kí phát nguyện mà có các ngày 08, 14, 29/30 thì các đạo hữu bạch xin nghỉ và thực hiện bù trong thời gian phát nguyện ạ.
Trường hợp đăng kí phát nguyện đã trừ các ngày 08, 14, 29/30 hoặc không rơi vào các ngày trên thì không cần bạch nghỉ và tụng bù ạ.

CS Khối xin thỉnh các đạo hữu lưu tâm ạ
Xin tuỳ hỷ công đức của các đạo hữu ạ.$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r23$Q$, $Q$lunar$Q$, 14, null, null, $Q$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r24$Q$, $Q$lunar$Q$, 14, null, null, $Q$🌺 🌺 🌺 (LỜI NHẮC)
TỔNG HỢP CÁC NGHI THỨC/CHƯƠNG TRÌNH TU MỜI VỀ ĐÀN CHẨN TẾ VÀO LÚC 20 NGÀY 15/03/BN

I. Các chương trình được thỉnh HL trong nghi thức tu tập về ĐCT gồm:

1. Chương trình Sám hối Chư Tăng, an vị lô hương, tượng Phật/khánh treo xe, giải bùa chú nơi thờ tà kiến trực tuyến tháng 03/ÂL
2. Chương trình tu tâm từ bi - chính Pháp trụ lâu dài
II. Điều kiện đủ được thỉnh HL trong nghi thức tu tập về ĐCT

+ Tu các chương trình tuần tự theo số thứ tự đã có trong các nghi thức (1, 2, 3,…) phù hợp với nhân duyên của mình. Ví dụ: Đã tu xong phần 1 thì sẽ tu đến phần 2, không tu nhảy cách.
+ Tu đúng/tu bù theo đúng hướng dẫn tại trong link: https://phamthiyen.com/huong-dan-tu-dung-tu-tuy-duyen-tu-bu-tu-duoi-tu-them-c4643.html
+ Đạo tràng phải đăng ký danh sách tu tập cho Phật tử đúng hạn của câu lạc bộ.

III. Văn bạch trước khi tham dự chương trình trực tuyến đàn chẩn tế 
Link: https://phamthiyen.com/van-bach-tham-gia-cac-chuong-trinh-truc-tuyen-cua-chuacau-lac-bo-c4246.html
Xin tuỳ hỷ quý đạo hữu ạ. ".$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r25$Q$, $Q$lunar$Q$, 14, null, null, $Q$NHẮC VĂN BẠCH TRƯỚC KHI NGHE PHÁP ĐỊNH KÌ NGÀY 03, 08, 14, 20, 30 (29) 
https://phamthiyen.com/van-bach-nghe-phap-ngoi-thien-c5167.html$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r26$Q$, $Q$lunar$Q$, 14, null, null, $Q$Cúng mùng dằm: https://phamthiyen.com/bai-cung-mung-1-ram-c3581.html;$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r27$Q$, $Q$lunar$Q$, 18, null, null, $Q$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r28$Q$, $Q$lunar$Q$, 20, null, null, $Q$NHẮC VĂN BẠCH TRƯỚC KHI NGHE PHÁP ĐỊNH KÌ NGÀY 03, 08, 14, 20, 30 (29) 
https://phamthiyen.com/van-bach-nghe-phap-ngoi-thien-c5167.html$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r29$Q$, $Q$lunar$Q$, 21, null, null, $Q$*🌺 🌺 🌺 (LỜI NHẮC) NGỒI THIỀN SAU CHƯƠNG TRÌNH NGHE PHÁP CỦA SƯ PHỤ VÀO CÁC NGÀY 03,20 HÀNG THÁNG*

Kính thưa các quý đạo hữu!

CS khối xin gửi lời nhắc lịch ngồi thiền sau khi nghe pháp ngày 03,20 hàng tháng.

Xin thỉnh các Nhóm/ĐT nắm bắt và nhắc PT lưu tâm áp dụng đối với những buổi có đề mục thiền quán ạ.

Nếu nghe trạch Pháp đúng ngày, PT ngồi thiền trong vòng 3 ngày ngay sau ngày nghe Pháp thì được tính nghe trực tuyến đúng ngày.

Nếu nghe trạch Pháp sau trong vòng 10 ngày, ngồi thiền sau 3 ngày, tổng 13 ngày sau ngày trạch Pháp của CLB.

Xin tuỳ hỷ các đạo hữu ạ.$Q$, $Q$$Q$, $Q$ĐH Mỹ$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r30$Q$, $Q$lunar$Q$, 22, null, null, $Q$🌺🌺 (NHẮC LỊCH) NGHI THỨC TU TẬP TRƯỚC KHI THAM DỰ LỄ CẦU SIÊU 🌺 🌺
CS Khối xin nhắc lịch tu trước khi tham dự lễ cầu siêu đến các Nhóm/ĐT như sau:
A. TRƯỜNG HỢP ĐĂNG KÝ CẦU SIÊU - ĐANG TU BÀI 8
CẦN THỰC HÀNH NGHI THỨC KINH PHỤ BÀI KINH """"TIỂU CHỦ NGÂN KHỐ"""" TRƯỚC LỄ CẦU SIÊU TỪ 3 – 7 NGÀY
1. Các đạo hữu đăng ký cầu siêu cần: Tụng bài kinh “Tiểu chủ ngân khố” liền trước lễ cầu siêu từ 3-7 ngày, có thể tụng gộp hay riêng với các thời đang tu.
2. Cách thực hành:
✍ Trường hợp tu vào ngày nghe Pháp:
- Phần nghi thức: Thực hành theo nghi thức tụng kinh - bài tu số 8
Link: https://bom.so/9SWWMY
- Phần kinh: Tụng bài kinh “Tiểu chủ ngân khố” theo Link bài kinh: https://bom.so/bWMYLy
=> Tụng xong phần văn kinh -> thì đọc tiếp khai thị lấy ở phần (B) Văn Khai Thị  phía dưới ở link:
https://bom.so/gXMw2K
✍ Trường hợp tu vào ngày tụng kinh:
- Tụng theo nghi thức tụng kinh bài tu số 8 -> sau khi tụng kinh chính thì tụng thêm bài kinh “Tiểu chủ ngân khố” => sau đó đọc tiếp khai thị ở phần (B) Văn Khai Thị ở link trên.
B. CÁC TRƯỜNG HỢP ĐĂNG KÝ CẦU SIÊU KHÁC - KHÔNG TU BÀI 8
THỰC HÀNH THEO NGHI THỨC LÀM LỄ TẠI NHÀ TRƯỚC KHI THAM DỰ LỄ CẦU SIÊU TỪ 3 - 7 NGÀY:
https://bom.so/HKKSJK
C. TRƯỜNG HỢP ĐĂNG KÝ CẦU SIÊU HƯƠNG LINH THAI NHI:
THỰC HIỆN THEO NGHI THỨC LÀM LỄ TẠI NHÀ TRƯỚC KHI THAM DỰ LỄ CẦU SIÊU HƯƠNG LINH THAI NHI:
https://bom.so/5btrCT
Xin tùy hỷ công đức của các đạo hữu ạ!$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r31$Q$, $Q$lunar$Q$, 22, null, null, $Q$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r32$Q$, $Q$lunar$Q$, 22, null, null, $Q$*🌺 🌺 🌺 (NHẮC LỊCH) TU CẦU NGUYỆN CHÁNH PHÁP TRỤ LÂU DÀI THÁNG 03/ÂL*

Kính thưa các đạo hữu, CS khối xin gửi nhắc lịch chương trình tu như sau:

*I. Nghi thức tu cầu nguyện Chánh Pháp trụ lâu dài tháng 03/ÂL*
*1. Link nghi thức:*
https://chuabavang.com/nghi-thuc-tu-tam-tu-bi-cau-nguyen-chanh-phap-tru-lau-dai-d9910.html
*2. Thời gian tu tập:*  6 ngày (Bắt đầu từ ngày 23 âm lịch và tùy duyên tu trong thời gian 10 ngày).
*3. Ngày thỉnh hương linh về đàn chẩn tế tại chùa:* Ngày 15/04/ÂL
*4. Ngày tu bát quan trai:* Ngày câu lạc bộ phát nguyện tu: 26/03/ÂL. Tu bát quan trai không tính trong nhân duyên thỉnh hương linh về đàn chẩn tế.
*5. Cúng thí thực:* Tùy duyên có/không cúng thí thực, nếu cúng thí thì tùy duyên có/không thỉnh hương linh cúng thí về đàn chẩn tế; nếu thỉnh hương linh về đàn chẩn tế thì cần đáp ứng điều kiện thỉnh hương linh cúng thí về đàn chẩn tế. Link cúng thí thực: https://phamthiyen.com/nghi-thuc-cung-thi-thuc-co-hon-c1262.html
1. Điều kiện để thỉnh HL về đàn chẩn tế*
2. Tu đúng/tu bù theo đúng hướng dẫn tại trong link: https://phamthiyen.com/huong-dan-tu-dung-tu-tuy-duyen-tu-bu-tu-duoi-tu-them-c4643.html
+ Đạo tràng phải đăng ký danh sách tu tập cho Phật tử đúng hạn của câu lạc bộ.
Link: https://phamthiyen.com/huong-dan-dieu-kien-duoc-thinh-vong-linh-trong-nghi-thuc-tu-va-dan-le-cung-thi-thuc-ve-dan-chan-te-c4633.html


CS Khối xin tuỳ hỷ các đạo hữu!$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r33$Q$, $Q$lunar$Q$, 23, null, null, $Q$*🌺 🌺 🌺 (LỜI NHẮC) TUỲ DUYÊN CÚNG THÍ NHÂN DUYÊN TU CẦU NGUYỆN CHÁNH PHÁP TRỤ LÂU DÀI THÁNG 04/ÂL*

Kính thưa các đạo hữu, 
CS khối xin khuyến tấn các đạo hữu tuỳ duyên có/không cúng thí thực, nếu cúng thí thì tùy duyên có/không thỉnh hương linh cúng thí về đàn chẩn tế; nếu thỉnh hương linh về đàn chẩn tế thì cần đáp ứng điều kiện thỉnh hương linh cúng thí về đàn chẩn tế.
Link cúng thí thực: https://phamthiyen.com/nghi-thuc-cung-thi-thuc-co-hon-c1262.html

*Điều kiện để thỉnh HL về đàn chẩn tế*
+ Tu đúng/tu bù chương trình cầu nguyện Chánh pháp trụ lâu dài theo đúng hướng dẫn tại trong link: https://phamthiyen.com/huong-dan-tu-dung-tu-tuy-duyen-tu-bu-tu-duoi-tu-them-c4643.html
+ Đạo tràng phải đăng ký danh sách tu tập cho Phật tử đúng hạn của câu lạc bộ.
Link: https://phamthiyen.com/huong-dan-dieu-kien-duoc-thinh-vong-linh-trong-nghi-thuc-tu-va-dan-le-cung-thi-thuc-ve-dan-chan-te-c4633.html
CS Khối xin tuỳ hỷ các đạo hữu!$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r34$Q$, $Q$lunar$Q$, 25, null, null, $Q$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r35$Q$, $Q$lunar$Q$, 25, null, null, $Q$*🌺 🌺 🌺 (LỜI NHẮC) TUỲ DUYÊN CÚNG THÍ NHÂN DUYÊN TU CẦU NGUYỆN CHÁNH PHÁP TRỤ LÂU DÀI THÁNG 02/ÂL*

Kính thưa các đạo hữu, 
CS khối xin khuyến tấn các đạo hữu tuỳ duyên có/không cúng thí thực, nếu cúng thí thì tùy duyên có/không thỉnh hương linh cúng thí về đàn chẩn tế; nếu thỉnh hương linh về đàn chẩn tế thì cần đáp ứng điều kiện thỉnh hương linh cúng thí về đàn chẩn tế.
Link cúng thí thực: https://phamthiyen.com/nghi-thuc-cung-thi-thuc-co-hon-c1262.html

*Điều kiện để thỉnh HL về đàn chẩn tế*
+ Tu đúng/tu bù chương trình cầu nguyện Chánh pháp trụ lâu dài theo đúng hướng dẫn tại trong link: https://phamthiyen.com/huong-dan-tu-dung-tu-tuy-duyen-tu-bu-tu-duoi-tu-them-c4643.html
+ Đạo tràng phải đăng ký danh sách tu tập cho Phật tử đúng hạn của câu lạc bộ.
Link: https://phamthiyen.com/huong-dan-dieu-kien-duoc-thinh-vong-linh-trong-nghi-thuc-tu-va-dan-le-cung-thi-thuc-ve-dan-chan-te-c4633.html
CS Khối xin tuỳ hỷ các đạo hữu!$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r36$Q$, $Q$lunar$Q$, 27, null, null, $Q$🌺🌺LỜI NHẮC🌺🌺
*DANH SÁCH VIDEO NGHE PHÁP, TU TẬP DÀNH CHO PHẬT TỬ*

Kính thưa các đạo hữu,
CS Khối xin thỉnh các đạo hữu nắm bắt danh sách Phật tử cần hoàn thành việc nghe video tương ứng với thành phần đó trước khi được xét duyệt lên thành phần ạ.
- Phật tử thuộc thành phần a, b, c, d, e cần nghe lần lượt các video tại các mục tương ứng. Ngoài ra, Phật tử có thể tùy duyên xem, nghe thêm các video trong danh sách video theo chủ đề được hướng dẫn trong link.
- Phật tử nào đã lên thành phần rồi, đang ở thành phần nào thì nghe video của thành phần đó và nghe bổ sung các video chưa nghe dành cho thành phần trước đó. Do đó, Nhóm/ĐT cần hướng dẫn sách tấn PT thực hiện theo đúng hướng dẫn và báo cáo lên Nhóm/ĐT để Nhóm/ĐT nắm bắt ạ.
- Nhóm/ĐT cần nắm bắt Cách Thức Thực Hành và Quy Trình Nghe Các Video Và Báo Cáo trong link để thực hiện theo đúng hướng dẫn ạ. 
Link: https://phamthiyen.com/tong-hop-danh-sach-video-nghe-phap-tu-tap-danh-cho-phat-tu-c5899.html

Xin tuỳ hỷ công đức của các đạo hữu ạ!$Q$, $Q$$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r37$Q$, $Q$lunar$Q$, 28, null, null, $Q$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$Q$, $Q$$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r38$Q$, $Q$lunar$Q$, 28, null, null, $Q$LƯU Ý NẾU KHÔNG THAM GIA CHƯƠNG TRÌNH CẦU SIÊU TRỰC TUYẾN THÌ BẠCH THEO VĂN BẠCH TRONG LINK CÒN NẾU THAM GIA TRỰC TUYẾN THÌ BẠCH THEO VĂN BẠCH TRÊN MÀN HÌNH Ạ
https://phamthiyen.com/van-bach-tham-gia-cac-chuong-trinh-truc-tuyen-cua-chuacau-lac-bo-c4246.html$Q$, $Q$Nhắc vào ngày 28 đối với tháng thiếu 29 ngày$Q$, $Q$ĐH HƯƠNG$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r39$Q$, $Q$lunar$Q$, 28, null, null, $Q$*🌺🌺 LỜI NHẮC KHÔNG THỰC HÀNH CÁC PHÁT NGUYỆN TRONG THỜI GIAN VỀ CHÙA TU HỌC🌺🌺*

Kính thưa các đạo hữu,
CS Khối xin thỉnh các đạo hữu lưu ý:
 *Không thực hành các phát nguyện trong thời gian về chùa và các ngày tu học định kỳ (8, 14, 29/30) tại nhà, nhóm, chùa* như:
*Bạch xin người tinh tấn, Tụng kinh Tam Bảo, Hát tán dương, Nghe Pháp và ngồi thiền, thiền hành theo phát nguyện đã đăng kí*.

Trường hợp đăng kí phát nguyện mà có các ngày 08, 14, 29/30 thì các đạo hữu bạch xin nghỉ và thực hiện bù trong thời gian phát nguyện ạ.
Trường hợp đăng kí phát nguyện đã trừ các ngày 08, 14, 29/30 hoặc không rơi vào các ngày trên thì không cần bạch nghỉ và tụng bù ạ.

CS Khối xin thỉnh các đạo hữu lưu tâm ạ
Xin tuỳ hỷ công đức của các đạo hữu ạ.$Q$, $Q$Nhắc vào ngày 28 đối với tháng thiếu (29 ngày)$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r40$Q$, $Q$special$Q$, null, $Q$THỨ BẢY HÀNG TUẦN$Q$, null, $Q$🌺 🌺 🌺 LỜI NHẮC: BẠCH HỒI HƯỚNG CÔNG ĐỨC LỤC HÒA SAU KHI BẠCH XONG 49 NGÀY
(DÀNH CHO CÁC PT ĐÃ  BẠCH XONG 49 NGÀY)

LINK CHUNG: https://phamthiyen.com/phat-nguyen-49-ngay-c4292.html

🌷 1. VĂN BẠCH XIN HỒI HƯỚNG CÔNG ĐỨC LỤC HÒA NGÀY THỨ NHẤT (NGÀY CHỦ NHẬT) (ĐÃ BẠCH XONG 49 NGÀY)

LINK BẠCH:
https://docs.google.com/document/d/1LDWDudsFTpv6FaxHXwBuFck4WDr3YorsXFvc_0Qmruw/edit?usp=drivesdk

🌷 2. VĂN BẠCH HỒI HƯỚNG SAU 7 NGÀY CÔNG ĐỨC LỤC HÒA (VÀO NGÀY CHỦ NHẬT TIẾP THEO). (ĐÃ BẠCH XONG 49 NGÀY)
LINK BẠCH
https://docs.google.com/document/d/17LI-LB5OScFQv_8myYMG9oWvgo00__sFqyBdgjhI9jQ/edit?usp=drivesdk

🌺 LƯU Ý: VĂN BẠCH NÀY SỬ DỤNG CHO PT ĐÃ BẠCH XONG 49 NGÀY, KHI BẠCH MỞ LINK ĐỂ BẠCH$Q$, $Q$Thứ bảy hàng tuần$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r41$Q$, $Q$special$Q$, null, $Q$Chủ nhật hàng tuần$Q$, null, $Q$*🌺🌺LỜI NHẮC🌺🌺*
*DANH SÁCH VIDEO NGHE PHÁP, TU TẬP DÀNH CHO PHẬT TỬ*

Kính thưa các đạo hữu,
CS Khối xin thỉnh các đạo hữu nắm bắt danh sách Phật tử cần hoàn thành việc nghe video tương ứng với thành phần đó trước khi được xét duyệt lên thành phần ạ.
- Phật tử thuộc thành phần a, b, c, d, e cần nghe lần lượt các video tại các mục tương ứng. Ngoài ra, Phật tử có thể tùy duyên xem, nghe thêm các video trong danh sách video theo chủ đề được hướng dẫn trong link.
- Phật tử nào đã lên thành phần rồi, đang ở thành phần nào thì nghe video của thành phần đó và nghe bổ sung các video chưa nghe dành cho thành phần trước đó. Do đó, Nhóm/ĐT cần hướng dẫn sách tấn PT thực hiện theo đúng hướng dẫn và báo cáo lên Nhóm/ĐT để Nhóm/ĐT nắm bắt ạ.
- Nhóm/ĐT cần nắm bắt Cách Thức Thực Hành và Quy Trình Nghe Các Video Và Báo Cáo trong link để thực hiện theo đúng hướng dẫn ạ. 
Link: https://phamthiyen.com/tong-hop-danh-sach-video-nghe-phap-tu-tap-danh-cho-phat-tu-c5899.html

Xin tuỳ hỷ công đức của các đạo hữu ạ!$Q$, $Q$Chủ nhật hàng tuần$Q$, $Q$ĐH THOA$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r42$Q$, $Q$special$Q$, null, $Q$Chủ nhật hàng tuần$Q$, null, $Q$🍁 TỔNG HỢP CÁC VẤN ĐỀ VỀ NGHI LỄ 🍁 🍁
-----------------
Các Nhóm/ĐT đọc kỹ các mục sau để ÁP DỤNG khi làm bài nghi lễ ạ.

🍁. Link Tổng hợp các vấn đề nghi lễ (mục tâm linh theo dạng bảng, kinh phụ, bài nghi lễ tham khảo của BCS Khối, đám tang)
https://tinyurl.com/yomywnde

Chi tiết khi muốn tra cứu nhanh.
🍁 1. Link tổng hợp mục tâm linh của BĐHNL:
https://tinyurl.com/ylkd638q
🍁 2. Link tổng hợp Thông báo từ BĐH Nghi Lễ CLB
https://tinyurl.com/ylyvwkea
🍁 3. MẪU BÀI 8 (MỤC VL ĐƠN GIẢN): Áp dụng cho thành phần tùy hỷ, gieo duyên.
Các ĐT tạo bản sao khi làm bài.
https://s.net.vn/UTaQ
🍁 4. MẪU CẦU AN TỪ BHD: Các ĐT tạo bản sao khi làm bài.
https://tinyurl.com/ynsrnwdf$Q$, $Q$$Q$, $Q$$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r43$Q$, $Q$special$Q$, null, $Q$22h00 các ngày trong tuần$Q$, null, $Q$💐 💐 BÁO CÁO PHẬN SỰ TRONG NGÀY CỦA TEAM NGHI LỄ
Kính thưa LĐ Khối và các ĐH, Team Nghi Lễ xin được báo cáo 
I.🌷 Đã tiếp nhận đợi Khối duyệt: 04 đàn lễ
1. Đàn lễ Sám hối chuyển hóa bài tu số 8 - (Nhóm Đại Nghĩa)
+ Thời gian Nhóm đăng bài: 22h07 phút ngày 08/6N/ÂT
+ Ngày làm lễ: 14/06N/ÂT
+ Tiến độ xử lý: ĐH Anh Tâm Hòa – Lấy ý kiến CS Khối và chờ TK duyệt bài
2. Đàn lễ Sám hối chuyển hóa bài tu số 8 - (Nhóm Đại Nghĩa)
+ Thời gian Nhóm đăng bài: 22h10 phút ngày 08/6N/ÂT
+ Ngày làm lễ: 14/06N/ÂT
+ Tiến độ xử lý: ĐH Anh Tâm Hòa – Lấy ý kiến CS Khối và chờ TK duyệt bài
3. Đàn lễ Cầu an - (Nhóm Hà Linh)
+ Thời gian Nhóm đăng bài: 21h37 phút ngày 07/6N/ÂT
+ Ngày làm lễ: 17/06N/ÂT
+ Tiến độ xử lý: ĐH Anh Tâm Hòa – Lấy ý kiến CS Khối và chờ TK duyệt bài
4. Đàn lễ Cầu an - (Nhóm Hà Linh)
+ Thời gian Nhóm đăng bài 21h41 phút ngày 07/6N/ÂT
+ Ngày làm lễ: 17/06N/ÂT
+ Tiến độ xử lý: ĐH Anh Tâm Hòa – Lấy ý kiến CS Khối và chờ TK duyệt bài
II.🌷 Đã trả bài trong ngày: 
- 01 Đàn lễ Cầu an - (Nhóm Đại Nghĩa)
III.🌷 Nhắc lịch các chương trình Tu tập ngày mai: 
- LINK TU BQT VÀ LINK TU TẬP TRÊN XE VỀ CHÙA NGÀY 9,10/6N/ÂL , 
Thỉnh CS Khối @Dịu ngày mai nhắc lịch trên ạ.
IV.🌷 Chưa tiếp nhận: 0 

* Tính đến 22h00: Đã rà soát hết các bài đăng trên FB K6_NL_Bộ phận hỗ trợ rồi ạ 
Xin tùy hỷ công đức của các quý đạo hữu ạ$Q$, $Q$$Q$, $Q$ĐH Mỹ TRỰC 3,5,7; ĐH THOA TRỰC 2,4,6,CN$Q$, null) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, once_date, noi_dung, luu_y, phu_trach, hoan_thanh_ky) values ($Q$r44$Q$, $Q$special$Q$, null, $Q$Ngày 03 và 20 hàng tháng$Q$, null, $Q$*🌺 🌺 🌺 (LỜI NHẮC) NGỒI THIỀN SAU CHƯƠNG TRÌNH TRẠCH PHÁP CỦA CCN VÀO CÁC NGÀY 03,20 HÀNG THÁNG*

Kính thưa các quý đạo hữu!

CS khối xin gửi lời nhắc lịch ngồi thiền sau khi nghe trạch pháp ngày 03,20 hàng tháng.

Xin thỉnh các Nhóm/ĐT nắm bắt và nhắc PT lưu tâm áp dụng đối với những buổi có đề mục thiền quán ạ.

Nếu nghe trạch Pháp đúng ngày, PT ngồi thiền trong vòng 3 ngày ngay sau ngày nghe Pháp thì được tính nghe trực tuyến đúng ngày.

Nếu nghe trạch Pháp sau trong vòng 10 ngày, ngồi thiền sau 3 ngày, tổng 13 ngày sau ngày trạch Pháp của CLB.

Xin tuỳ hỷ các đạo hữu ạ.$Q$, $Q$$Q$, $Q$$Q$, null) on conflict (id) do nothing;

insert into docs (id, tieu_de, chu_de, link, noi_dung, ngay_cap_nhat) values ($Q$d_1784115011702_cju3t$Q$, $Q$Hướng dẫn tu sám hối Chư Tăng trong mùa hạ$Q$, $Q$NGHI THỨC TU TẬP TRƯỚC VÀ SAU KHI SÁM HỐI CHƯ TĂNG TRỰC TUYẾN$Q$, $Q$$Q$, $Q$Phật tử đã đăng ký SHCT trong thời gian diễn ra chương trình tu mùa hạ và phát nguyện tu đủ chương trình mùa hạ được thay thế cho chương trình tu trước và sau SHCT. Phật tử lựa chọn 1 trong 2 cách tu tập sau (ưu tiên chất lượng):

1. Cách 1: Tu tập theo đúng nghi thức trước và sau SHCT như thông thường.

2. Cách 2: Tu chương trình tu mùa hạ (được tính là thời khóa thay thế cho nghi thức trước và sau SHCT).

Hướng dẫn cụ thể về cách 2:

- Phật tử bạch thỉnh các mục tâm linh của nghiệp SHCT về tu chương trình tu mùa hạ trong ngày tu đầu tiên của chương trình (không đợi đến 7 ngày trước kỳ SHCT mới bạch).

- Nếu việc đăng ký SHCT diễn ra sau ngày đầu tu mùa hạ (không thể bạch thỉnh mục tâm linh SHCT về ngày đầu) thì bạch tại thời điểm đăng ký. Đồng thời, duy trì tu tập trong suốt thời gian còn lại của chương trình tu mùa hạ.

LƯU Ý QUAN TRỌNG:
- Trường hợp Phật tử đã chọn phương án tu đủ chương trình mùa hạ để thay thế SHCT, nhưng sau đó vì duyên sự không tu đủ được mà phải chuyển sang dạng "tu tùy duyên chương trình mùa hạ" thì: được chuyển đổi sang tu theo nghi thức SHCT (tu trước + tu sau), không phải hủy đăng ký SHCT nhưng cần phải bạch sám hối.

- Nếu thời gian tu trước/sau SHCT trùng với các chương trình lễ: Đức Phật chuyển Pháp luân, Đức Đại Thế Chí Bồ Tát đản sinh, Khuyến phát tâm Bồ Đề, Vu Lan --> Phật tử phải tu riêng thời khóa SHCT (vì bài tu mùa hạ không bao gồm các chương trình lễ này).$Q$, $Q$2026-07-15T11:30:11.698Z$Q$) on conflict (id) do nothing;
insert into docs (id, tieu_de, chu_de, link, noi_dung, ngay_cap_nhat) values ($Q$d_1784115174183_m6690$Q$, $Q$Các lỗi sai và cách sám hối, tu lại$Q$, $Q$CÁC VẤN ĐỀ KHÁC$Q$, $Q$$Q$, $Q$A. TỔNG QUAN
I. NHÓM 1: LỖI SAI CẦN TU LẠI
1. Các lỗi
2. Cách sám hối
3. Cách tu lại
II. NHÓM 2: LỖI SAI CHỈ CẦN BẠCH SÁM HỐI, KHÔNG PHẢI TU LẠI
1. Các lỗi
2. Cách sám hối

B. CHI TIẾT

I. NHÓM 1: LỖI SAI CẦN TU LẠI
1. Các lỗi:
- Tu nhầm vào các ngày nghỉ: Các ngày tu học thường kỳ (mùng 3, 8, 14, 20, 30 (tháng thiếu: 29)); các ngày tu kỷ niệm Đức Phật chuyển Pháp luân, Khuyến phát tâm Bồ Đề, Vu Lan, Đức Đại Thế Chí Bồ Tát đản sinh.
- Tu chưa xong chu kỳ này, đã tu sang chu kỳ kia..., nhưng cách vài chu kỳ mới nhớ ra.
- Tu sai, tu nhầm:
* Tu sai bài kinh, tụng thiếu 1 hoặc 1 số phần bắt buộc trong nghi thức tụng kinh.
* Tu sai bài Pháp.
* Tu sai đề mục quán, ngồi thiền 2 thời khóa gộp với nhau.

2. Cách sám hối:
- Lý do sám hối khi tu sai/nhầm: Mất chánh niệm.
- Lợi ích sám hối: Giữ được công đức tu tập, công đức lục hòa.
- Cách sám hối: Đạo tràng lập nhóm chung, Phật tử đăng lên nhóm, NLĐT-BPHT đăng lên NLCLB-BPHT.
- Lưu ý: Phật tử đăng lên nhóm và tu lại được ngay hoặc tu lại rồi đăng lên nhóm.
- Công hạnh: Trường hợp tu bỏ cách tiến lên (ví dụ: Tu đúng là ngày 3, nhưng tu thành ngày 5, nhưng tu đến ngày 10 mới phát hiện ra): Sám hồng danh 1 quyển.

3. Cách tu lại:
- Trường hợp tu nhầm vào các ngày nghỉ: tu lại đúng theo chương trình (Ví dụ: ngày mùng 3 nghỉ, nhưng lại tu chương trình của ngày mùng 4 vào ngày mùng 3, thì đến ngày mùng 4 vẫn tu lại).
- Trường hợp tu sai, tu nhầm, tu chưa xong chu kỳ này, đã tu sang chu kỳ kia..., nhưng cách vài chu kỳ mới nhớ ra, thì tu lại toàn bộ chu kỳ sai đó và chu kỳ đang tu. Ví dụ: Tu sai từ chu kỳ 2, nhưng đến chu kỳ 4 mới phát hiện ra thì sẽ tu lại chu kỳ 2 và chu kỳ đang tu (4). Lưu ý tu xong chu kỳ 2 rồi tu tiếp chu kỳ 4, không tu đồng thời chu kỳ 2 và chu kỳ 4.

II. NHÓM 2: LỖI SAI CHỈ CẦN BẠCH SÁM HỐI, KHÔNG PHẢI TU LẠI
1. Các lỗi:
- Không bạch trước/sau hoặc không bạch cả trước và sau khi nghe Pháp, ngồi thiền.
- Đọc sai tên bài Pháp, sai/thiếu văn bạch nghe Pháp/ngồi thiền.
- Đọc sai một vài từ trong nghi thức tụng kinh, sai vài từ khi tụng kinh.
- Nghỉ tu quên bạch.

2. Cách sám hối:
- Lý do sám hối khi tu sai/nhầm: Mất chánh niệm.
- Lợi ích sám hối: Giữ được công đức tu tập, công đức lục hòa.
- Cách sám hối: Đạo tràng lập nhóm chung, Phật tử đăng lên nhóm, NLĐT-BPHT đăng lên NLCLB-BPHT.$Q$, $Q$2026-07-15T11:32:54.029Z$Q$) on conflict (id) do nothing;
insert into docs (id, tieu_de, chu_de, link, noi_dung, ngay_cap_nhat) values ($Q$d_1784115311890_68jbz$Q$, $Q$Hướng dẫn viết bài nghi lễ$Q$, $Q$CÁC VẤN ĐỀ KHÁC$Q$, $Q$https://docs.google.com/document/d/13crUmJmgkIHoCF6UErta2QZ-XCtekuKEFToAR6a_PEE/edit$Q$, $Q$$Q$, $Q$2026-07-15T11:35:11.664Z$Q$) on conflict (id) do nothing;
insert into docs (id, tieu_de, chu_de, link, noi_dung, ngay_cap_nhat) values ($Q$d_1784115311921_v35dk$Q$, $Q$Mẫu đăng bài tác lễ thỉnh Chư Tăng giải điện$Q$, $Q$NGHI THỨC AN VỊ LÔ HƯƠNG, TƯỢNG PHẬT/KHÁNH TREO XE; GIẢI BÙA CHÚ, NƠI THỜ TÀ KIẾN$Q$, $Q$https://docs.google.com/document/d/1461knZABN4_YhzjsOyuwov3P_1oU4PS3CjJ2WWyehEM/edit$Q$, $Q$$Q$, $Q$2026-07-15T11:35:11.911Z$Q$) on conflict (id) do nothing;
insert into docs (id, tieu_de, chu_de, link, noi_dung, ngay_cap_nhat) values ($Q$d_1784115311933_0duu1$Q$, $Q$Tài liệu hướng dẫn BĐH nghi lễ$Q$, $Q$NGHI THỨC TU TẬP SÁM HỐI CHUYỂN HÓA (BÀI TU SỐ 8)$Q$, $Q$https://docs.google.com/document/d/1KAmsAOyqyXkRxqElO96JaqEEP1XUFxPjStP1GXvZAqM/edit$Q$, $Q$$Q$, $Q$2026-07-15T11:35:11.925Z$Q$) on conflict (id) do nothing;
