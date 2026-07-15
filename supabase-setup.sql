-- Kho Du Lieu Nghi Le: schema + seed data cho Supabase
create table if not exists entries (
  id text primary key,
  chu_de text not null,
  cau_hoi text default '',
  noi_dung text not null,
  tra_loi text default '',
  ngay_cap_nhat timestamptz not null default now(),
  link_cap_nhat text default '',
  history jsonb default '[]'::jsonb
);

create table if not exists reminders (
  id text primary key,
  day_type text not null,
  lunar_day int,
  special_label text,
  noi_dung text not null,
  luu_y text default '',
  phu_trach text default ''
);

alter table entries enable row level security;
alter table reminders enable row level security;

insert into entries (id, chu_de, cau_hoi, noi_dung, tra_loi, ngay_cap_nhat, link_cap_nhat, history) values ($a$seed_1$a$, $b$CHƯƠNG TRÌNH TU MÙA HẠ$b$, $c$Kính thưa NLCLB, được sự thống nhất của BLD và NLĐT, đh xin gửi câu hỏi ạ.$c$, $d$Nội dung câu hỏi:
1. Trong chương trình tu Mùa Hạ, 1 chu kỳ sẽ có 2 thời khoá ngồi thiền, theo hướng dẫn của CLB về cách tu bù thì sẽ: "...Ngồi thiền: Không tu bù gộp 2 ngày ngồi thiền vào 1 thời khóa. Được tu bù thời khóa ngồi thiền riêng..."
ĐT đang có 2 luồng ý kiến:
- Ý 1: Được tu 2 thời khoá ngồi thiền/ 1 ngày, mỗi thời khoá phải cách nhau ít nhất là 30 phút.
- Ý 2: Không khuyến khích tu 2 thời khoá ngồi thiền trong 1 ngày, bao gồm 2 thời cách nhau hơn 30 phút hoặc hai thời sáng, tối.

2. Trong khoảng thời gian tu các chương trình phát động của CLB, tính chất công việc của các PTXX gia duyên đi làm và lệch múi giờ, các PT thường tranh thủ tu sáng sớm hoặc tối khuya, và có thể còn tham gia phận sự nên rất hạn hẹp thời gian. Nếu 1 ngày có 3-4 thời khoá cần phải tu mà mỗi thời chỉ được tu 2 chương trình kết hợp (ví dụ 1 thời tụng kinh bài 8 và tụng kinh CT Mùa Hạ, hoặc tụng kinh và nghe pháp) sau thời khoá tu đó PT có phải đợi ít nhất là 30 phút mới được vào tu thời khoá tiếp theo không ạ?
- Ý 1: Được tu. (Trừ 2 thời khoá ngồi thiền là bắt buộc phải cách nhau 30 phút.)
- Ý 2: Không được, các thời khoá đều phải cách nhau 30 phút, ví dụ tụng kinh + nghe pháp sau đó đợi 30 phút mới được ngồi thiền/nghe pháp cho thời khoá tiếp theo.

Kính thỉnh NLCLB_BPHT hướng dẫn cho ĐT để Phật tử thực hành được đúng Pháp, lợi ích ạ!
Xin tùy hỷ công đức của NLCLB_BPHT ạ!$d$, $e$Kính thưa các quý đạo hữu! NLCLB - Bộ phận hỗ trợ xin hướng dẫn:
1. Được tu 2 thời khoá ngồi thiền/ 1 ngày, mỗi thời khoá không phải cách nhau 30 phút.
2. Tu ngay được, không còn quy định 2 thời khóa cách nhau 30 phút.
Xin tùy hỷ công đức các quý đạo hữu ạ!$e$, $f$2026-07-15T00:00:00.000Z$f$, $g$$g$, $h$[{"action": "tao_moi", "at": "2026-07-15T00:00:00.000Z", "nguoiSua": "Khởi tạo dữ liệu mẫu"}]$h$::jsonb) on conflict (id) do nothing;

insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r1$i$, $j$lunar$j$, 29, null, $k$LƯU Ý NẾU KHÔNG THAM GIA CHƯƠNG TRÌNH CẦU SIÊU TRỰC TUYẾN THÌ BẠCH THEO VĂN BẠCH TRONG LINK CÒN NẾU THAM GIA TRỰC TUYẾN THÌ BẠCH THEO VĂN BẠCH TRÊN MÀN HÌNH Ạ
https://phamthiyen.com/van-bach-tham-gia-cac-chuong-trinh-truc-tuyen-cua-chuacau-lac-bo-c4246.html$k$, $l$Nhắc vào ngày 29 đối với tháng đủ 30 ngày$l$, $m$$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r2$i$, $j$lunar$j$, 29, null, $k$*🌺🌺 LỜI NHẮC 🌺🌺*

Kính thưa các đạo hữu,
CS Khối xin thỉnh các đạo hữu lưu ý:
 *Không thực hành các phát nguyện trong thời gian về chùa và các ngày tu học định kỳ (8, 14, 29/30) tại nhà, nhóm, chùa* như:
*Bạch xin người tinh tấn, Tụng kinh Tam Bảo, Hát tán dương, Nghe Pháp và ngồi thiền, thiền hành theo phát nguyện đã đăng kí*.

Trường hợp đăng kí phát nguyện mà có các ngày 08, 14, 29/30 thì các đạo hữu bạch xin nghỉ và thực hiện bù trong thời gian phát nguyện ạ.
Trường hợp đăng kí phát nguyện đã trừ các ngày 08, 14, 29/30 hoặc không rơi vào các ngày trên thì không cần bạch nghỉ và tụng bù ạ.

CS Khối xin thỉnh các đạo hữu lưu tâm ạ
Xin tuỳ hỷ công đức của các đạo hữu ạ.$k$, $l$Nhắc vào ngày 29 đối với tháng đủ 30 ngày$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r3$i$, $j$lunar$j$, 29, null, $k$Cúng mùng 1: https://phamthiyen.com/bai-cung-mung-1-ram-c3581.html$k$, $l$Nhắc vào ngày 29 đối với tháng thiếu$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r4$i$, $j$lunar$j$, 29, null, $k$NHẮC VĂN BẠCH TRƯỚC KHI NGHE PHÁP ĐỊNH KÌ NGÀY 03, 08, 14, 20, 30 (29) 
https://phamthiyen.com/van-bach-nghe-phap-ngoi-thien-c5167.html$k$, $l$Nhắc vào ngày 29 đối với tháng thiếu$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r5$i$, $j$lunar$j$, 29, null, $k$🌺🌺🌺 LỜI NHẮC BẠCH CÁC BÀI BẠCH PHÁT NGUYỆN
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

Thỉnh các ĐH nắm bắt ạ$k$, $l$Không nhắc bài này$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r6$i$, $j$lunar$j$, 30, null, $k$Cúng mùng 1: https://phamthiyen.com/bai-cung-mung-1-ram-c3581.html$k$, $l$Nhắc vào ngày 30 đối với tháng đủ$l$, $m$ĐH Mỹ$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r7$i$, $j$lunar$j$, 30, null, $k$NHẮC VĂN BẠCH TRƯỚC KHI NGHE PHÁP ĐỊNH KÌ NGÀY 03, 08, 14, 20, 30 (29) 
https://phamthiyen.com/van-bach-nghe-phap-ngoi-thien-c5167.html$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r8$i$, $j$lunar$j$, 1, null, $k$[LỜI NHẮC] GIẤY THỈNH MỜI ĐẠO TRÀNG/NHÓM TRỢ DUYÊN TỤNG KINH, LÀM NGHI THỨC CÚNG LỄ PHẬT GIÁO

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

Xin tùy hỷ công đức của các quý đạo hữu ạ!$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r9$i$, $j$lunar$j$, 1, null, $k$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r10$i$, $j$lunar$j$, 3, null, $k$NHẮC VĂN BẠCH TRƯỚC KHI NGHE PHÁP ĐỊNH KÌ NGÀY 03, 08, 14, 20, 30 (29) 
https://phamthiyen.com/van-bach-nghe-phap-ngoi-thien-c5167.html$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r11$i$, $j$lunar$j$, 4, null, $k$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r12$i$, $j$lunar$j$, 4, null, $k$🌺🌺🌺 LỜI NHẮC BẠCH CÁC BÀI BẠCH PHÁT NGUYỆN
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
Thỉnh các ĐH nắm bắt ạ$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r13$i$, $j$lunar$j$, 4, null, $k$*🌺 🌺 🌺 (LỜI NHẮC) NGỒI THIỀN SAU CHƯƠNG TRÌNH TRẠCH PHÁP CỦA CCN VÀO CÁC NGÀY 03,20 HÀNG THÁNG*

Kính thưa các quý đạo hữu!

CS khối xin gửi lời nhắc lịch ngồi thiền sau khi nghe trạch pháp ngày 03,20 hàng tháng.

Xin thỉnh các Nhóm/ĐT nắm bắt và nhắc PT lưu tâm áp dụng đối với những buổi có đề mục thiền quán ạ.

Nếu nghe trạch Pháp đúng ngày, PT ngồi thiền trong vòng 3 ngày ngay sau ngày nghe Pháp thì được tính nghe trực tuyến đúng ngày.

Nếu nghe trạch Pháp sau trong vòng 10 ngày, ngồi thiền sau 3 ngày, tổng 13 ngày sau ngày trạch Pháp của CLB.

Xin tuỳ hỷ các đạo hữu ạ.$k$, $l$$l$, $m$ĐH Mỹ$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r14$i$, $j$lunar$j$, 4, null, $k$🌺🌺🌺 LỜI NHẮC BẠCH CÁC BÀI BẠCH PHÁT NGUYỆN
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
Thỉnh các ĐH nắm bắt ạ$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r15$i$, $j$lunar$j$, 6, null, $k$🌺🌺 (NHẮC LỊCH) NGHI THỨC TU TẬP TRƯỚC KHI THAM DỰ LỄ CẦU SIÊU 🌺 🌺
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
Xin tùy hỷ công đức của các đạo hữu ạ!$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r16$i$, $j$lunar$j$, 7, null, $k$*🌺🌺 LỜI NHẮC KHÔNG THỰC HÀNH CÁC PHÁT NGUYỆN TRONG THỜI GIAN VỀ CHÙA TU HỌC🌺🌺*

Kính thưa các đạo hữu,
CS Khối xin thỉnh các đạo hữu lưu ý:
 *Không thực hành các phát nguyện trong thời gian về chùa và các ngày tu học định kỳ (8, 14, 29/30) tại nhà, nhóm, chùa* như:
*Bạch xin người tinh tấn, Tụng kinh Tam Bảo, Hát tán dương, Nghe Pháp và ngồi thiền, thiền hành theo phát nguyện đã đăng kí*.

Trường hợp đăng kí phát nguyện mà có các ngày 08, 14, 29/30 thì các đạo hữu bạch xin nghỉ và thực hiện bù trong thời gian phát nguyện ạ.
Trường hợp đăng kí phát nguyện đã trừ các ngày 08, 14, 29/30 hoặc không rơi vào các ngày trên thì không cần bạch nghỉ và tụng bù ạ.

CS Khối xin thỉnh các đạo hữu lưu tâm ạ
Xin tuỳ hỷ công đức của các đạo hữu ạ.$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r17$i$, $j$lunar$j$, 7, null, $k$🌺 LỜI NHẮC VỀ VIỆC THỈNH HƯƠNG LINH KHI VỀ CHÙA TU TẬP, PHẬN SỰ 🌺

Khi về chùa tu tập Bát Quan Trai, công quả, các quý đạo hữu chỉ cần bạch tại nhà theo nội dung sau để thỉnh các mục hương linh về chùa.
- Đối tượng: Tất cả các thành phần a, b, c, d, e
- Địa điểm bạch: Tùy duyên.
- Lưu ý: Nếu ở nhà quên bạch thỉnh văn bạch này, thì khi về chùa không bạch văn bạch này nữa.
- Văn bạch:
Nam Mô Phật Bổn Sư Thích Ca Mâu Ni!
Đệ tử con tên là:… Pháp danh:… ở (trọ/nhờ)... tại địa chỉ:… (là thành phần đang/đã bạch bài phát nguyện 49 ngày) đang (tu tập/nương tựa)... tại đạo tràng… thuộc câu lạc bộ Cúc Vàng.
Nhân duyên ngày… tháng... năm… con về chùa (tu tập/công quả…).
Con xin thỉnh tất cả chư vị hương linh gia tiên, tiền tổ; chư hương linh hữu duyên với con được về chùa Ba Vàng tùy duyên tu tập và thọ thực khi chư Tăng cúng thí thực tại chùa trong thời gian con về chùa.
Nam Mô Phật Bổn Sư Thích Ca Mâu Ni!$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r18$i$, $j$lunar$j$, 7, null, $k$🌿🌸 KÍNH THƯA CÁC ĐẠO HỮU CS KHỐI XIN GỬI LINK TU BQT VÀ LINK TU TẬP TRÊN XE VỀ CHÙA NGÀY MÙNG 8,9
👉 Link tu BQT:
https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
👉 Link tu tập trên xe về Chùa:
https://phamthiyen.com/chuong-trinh-tu-tap-tren-xe-ve-chua-vao-cac-ngay-tu-bat-quan-trai-c1995.html
Xin tùy hỷ công đức của các quý đạo hữu ạ$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r19$i$, $j$lunar$j$, 7, null, $k$NHẮC VĂN BẠCH TRƯỚC KHI NGHE PHÁP ĐỊNH KÌ NGÀY 03, 08, 14, 20, 30 (29) 
https://phamthiyen.com/van-bach-nghe-phap-ngoi-thien-c5167.html$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r20$i$, $j$lunar$j$, 10, null, $k$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r21$i$, $j$lunar$j$, 13, null, $k$LƯU Ý NẾU KHÔNG THAM GIA CHƯƠNG TRÌNH CẦU SIÊU TRỰC TUYẾN THÌ BẠCH THEO VĂN BẠCH TRONG LINK CÒN NẾU THAM GIA TRỰC TUYẾN THÌ BẠCH THEO VĂN BẠCH TRÊN MÀN HÌNH Ạ
https://phamthiyen.com/van-bach-tham-gia-cac-chuong-trinh-truc-tuyen-cua-chuacau-lac-bo-c4246.html$k$, $l$$l$, $m$$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r22$i$, $j$lunar$j$, 13, null, $k$*🌺🌺 LỜI NHẮC NGHỈ TU CÁC CHƯƠNG TRÌNH PHÁT NGUYỆN TRONG NGÀY TU HỌC THƯỜNG KỲ

Kính thưa các đạo hữu,
CS Khối xin thỉnh các đạo hữu lưu ý:
 *Không thực hành các phát nguyện trong thời gian về chùa và các ngày tu học định kỳ (8, 14, 29/30) tại nhà, nhóm, chùa* như:
*Bạch xin người tinh tấn, Tụng kinh Tam Bảo, Hát tán dương, Nghe Pháp và ngồi thiền, thiền hành theo phát nguyện đã đăng kí*.

Trường hợp đăng kí phát nguyện mà có các ngày 08, 14, 29/30 thì các đạo hữu bạch xin nghỉ và thực hiện bù trong thời gian phát nguyện ạ.
Trường hợp đăng kí phát nguyện đã trừ các ngày 08, 14, 29/30 hoặc không rơi vào các ngày trên thì không cần bạch nghỉ và tụng bù ạ.

CS Khối xin thỉnh các đạo hữu lưu tâm ạ
Xin tuỳ hỷ công đức của các đạo hữu ạ.$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r23$i$, $j$lunar$j$, 14, null, $k$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r24$i$, $j$lunar$j$, 14, null, $k$🌺 🌺 🌺 (LỜI NHẮC)
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
Xin tuỳ hỷ quý đạo hữu ạ. ".$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r25$i$, $j$lunar$j$, 14, null, $k$NHẮC VĂN BẠCH TRƯỚC KHI NGHE PHÁP ĐỊNH KÌ NGÀY 03, 08, 14, 20, 30 (29) 
https://phamthiyen.com/van-bach-nghe-phap-ngoi-thien-c5167.html$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r26$i$, $j$lunar$j$, 14, null, $k$Cúng mùng dằm: https://phamthiyen.com/bai-cung-mung-1-ram-c3581.html;$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r27$i$, $j$lunar$j$, 18, null, $k$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r28$i$, $j$lunar$j$, 20, null, $k$NHẮC VĂN BẠCH TRƯỚC KHI NGHE PHÁP ĐỊNH KÌ NGÀY 03, 08, 14, 20, 30 (29) 
https://phamthiyen.com/van-bach-nghe-phap-ngoi-thien-c5167.html$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r29$i$, $j$lunar$j$, 21, null, $k$*🌺 🌺 🌺 (LỜI NHẮC) NGỒI THIỀN SAU CHƯƠNG TRÌNH NGHE PHÁP CỦA SƯ PHỤ VÀO CÁC NGÀY 03,20 HÀNG THÁNG*

Kính thưa các quý đạo hữu!

CS khối xin gửi lời nhắc lịch ngồi thiền sau khi nghe pháp ngày 03,20 hàng tháng.

Xin thỉnh các Nhóm/ĐT nắm bắt và nhắc PT lưu tâm áp dụng đối với những buổi có đề mục thiền quán ạ.

Nếu nghe trạch Pháp đúng ngày, PT ngồi thiền trong vòng 3 ngày ngay sau ngày nghe Pháp thì được tính nghe trực tuyến đúng ngày.

Nếu nghe trạch Pháp sau trong vòng 10 ngày, ngồi thiền sau 3 ngày, tổng 13 ngày sau ngày trạch Pháp của CLB.

Xin tuỳ hỷ các đạo hữu ạ.$k$, $l$$l$, $m$ĐH Mỹ$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r30$i$, $j$lunar$j$, 22, null, $k$🌺🌺 (NHẮC LỊCH) NGHI THỨC TU TẬP TRƯỚC KHI THAM DỰ LỄ CẦU SIÊU 🌺 🌺
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
Xin tùy hỷ công đức của các đạo hữu ạ!$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r31$i$, $j$lunar$j$, 22, null, $k$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r32$i$, $j$lunar$j$, 22, null, $k$*🌺 🌺 🌺 (NHẮC LỊCH) TU CẦU NGUYỆN CHÁNH PHÁP TRỤ LÂU DÀI THÁNG 03/ÂL*

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


CS Khối xin tuỳ hỷ các đạo hữu!$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r33$i$, $j$lunar$j$, 23, null, $k$*🌺 🌺 🌺 (LỜI NHẮC) TUỲ DUYÊN CÚNG THÍ NHÂN DUYÊN TU CẦU NGUYỆN CHÁNH PHÁP TRỤ LÂU DÀI THÁNG 04/ÂL*

Kính thưa các đạo hữu, 
CS khối xin khuyến tấn các đạo hữu tuỳ duyên có/không cúng thí thực, nếu cúng thí thì tùy duyên có/không thỉnh hương linh cúng thí về đàn chẩn tế; nếu thỉnh hương linh về đàn chẩn tế thì cần đáp ứng điều kiện thỉnh hương linh cúng thí về đàn chẩn tế.
Link cúng thí thực: https://phamthiyen.com/nghi-thuc-cung-thi-thuc-co-hon-c1262.html

*Điều kiện để thỉnh HL về đàn chẩn tế*
+ Tu đúng/tu bù chương trình cầu nguyện Chánh pháp trụ lâu dài theo đúng hướng dẫn tại trong link: https://phamthiyen.com/huong-dan-tu-dung-tu-tuy-duyen-tu-bu-tu-duoi-tu-them-c4643.html
+ Đạo tràng phải đăng ký danh sách tu tập cho Phật tử đúng hạn của câu lạc bộ.
Link: https://phamthiyen.com/huong-dan-dieu-kien-duoc-thinh-vong-linh-trong-nghi-thuc-tu-va-dan-le-cung-thi-thuc-ve-dan-chan-te-c4633.html
CS Khối xin tuỳ hỷ các đạo hữu!$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r34$i$, $j$lunar$j$, 25, null, $k$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r35$i$, $j$lunar$j$, 25, null, $k$*🌺 🌺 🌺 (LỜI NHẮC) TUỲ DUYÊN CÚNG THÍ NHÂN DUYÊN TU CẦU NGUYỆN CHÁNH PHÁP TRỤ LÂU DÀI THÁNG 02/ÂL*

Kính thưa các đạo hữu, 
CS khối xin khuyến tấn các đạo hữu tuỳ duyên có/không cúng thí thực, nếu cúng thí thì tùy duyên có/không thỉnh hương linh cúng thí về đàn chẩn tế; nếu thỉnh hương linh về đàn chẩn tế thì cần đáp ứng điều kiện thỉnh hương linh cúng thí về đàn chẩn tế.
Link cúng thí thực: https://phamthiyen.com/nghi-thuc-cung-thi-thuc-co-hon-c1262.html

*Điều kiện để thỉnh HL về đàn chẩn tế*
+ Tu đúng/tu bù chương trình cầu nguyện Chánh pháp trụ lâu dài theo đúng hướng dẫn tại trong link: https://phamthiyen.com/huong-dan-tu-dung-tu-tuy-duyen-tu-bu-tu-duoi-tu-them-c4643.html
+ Đạo tràng phải đăng ký danh sách tu tập cho Phật tử đúng hạn của câu lạc bộ.
Link: https://phamthiyen.com/huong-dan-dieu-kien-duoc-thinh-vong-linh-trong-nghi-thuc-tu-va-dan-le-cung-thi-thuc-ve-dan-chan-te-c4633.html
CS Khối xin tuỳ hỷ các đạo hữu!$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r36$i$, $j$lunar$j$, 27, null, $k$🌺🌺LỜI NHẮC🌺🌺
*DANH SÁCH VIDEO NGHE PHÁP, TU TẬP DÀNH CHO PHẬT TỬ*

Kính thưa các đạo hữu,
CS Khối xin thỉnh các đạo hữu nắm bắt danh sách Phật tử cần hoàn thành việc nghe video tương ứng với thành phần đó trước khi được xét duyệt lên thành phần ạ.
- Phật tử thuộc thành phần a, b, c, d, e cần nghe lần lượt các video tại các mục tương ứng. Ngoài ra, Phật tử có thể tùy duyên xem, nghe thêm các video trong danh sách video theo chủ đề được hướng dẫn trong link.
- Phật tử nào đã lên thành phần rồi, đang ở thành phần nào thì nghe video của thành phần đó và nghe bổ sung các video chưa nghe dành cho thành phần trước đó. Do đó, Nhóm/ĐT cần hướng dẫn sách tấn PT thực hiện theo đúng hướng dẫn và báo cáo lên Nhóm/ĐT để Nhóm/ĐT nắm bắt ạ.
- Nhóm/ĐT cần nắm bắt Cách Thức Thực Hành và Quy Trình Nghe Các Video Và Báo Cáo trong link để thực hiện theo đúng hướng dẫn ạ. 
Link: https://phamthiyen.com/tong-hop-danh-sach-video-nghe-phap-tu-tap-danh-cho-phat-tu-c5899.html

Xin tuỳ hỷ công đức của các đạo hữu ạ!$k$, $l$$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r37$i$, $j$lunar$j$, 28, null, $k$🌺 🌺 🌺
(LỜI NHẮC)
TU BÁT QUAN TRAI DÀNH CHO PT ĐANG TU CHƯƠNG TRÌNH SÁM HỐI CHUYỂN HOÁ (BÀI TU SỐ 8)

Kính thưa các đạo hữu!
CS Khối xin gửi nhắc lịch tu BQTG trong chương trình tu sám hối chuyển hóa (bài tu số 8) như sau ạ:
+ Tu đúng ngày theo pháp Lục Hòa: 2; 5; 11; 15; 19; 23; 26; 29.
- Số lượng ngày tu: Tùy duyên (không đăng ký lên đạo tràng).
- Hình thức tu: Tinh nghiêm, tùy hỷ

✍ Link nghi thức tu BQTG: https://phamthiyen.com/nghi-thuc-tu-bat-quan-trai-gioi-c4363.html
Xin tùy hỷ công đức của các đạo hữu ạ$k$, $l$$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r38$i$, $j$lunar$j$, 28, null, $k$LƯU Ý NẾU KHÔNG THAM GIA CHƯƠNG TRÌNH CẦU SIÊU TRỰC TUYẾN THÌ BẠCH THEO VĂN BẠCH TRONG LINK CÒN NẾU THAM GIA TRỰC TUYẾN THÌ BẠCH THEO VĂN BẠCH TRÊN MÀN HÌNH Ạ
https://phamthiyen.com/van-bach-tham-gia-cac-chuong-trinh-truc-tuyen-cua-chuacau-lac-bo-c4246.html$k$, $l$Nhắc vào ngày 28 đối với tháng thiếu 29 ngày$l$, $m$ĐH HƯƠNG$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r39$i$, $j$lunar$j$, 28, null, $k$*🌺🌺 LỜI NHẮC KHÔNG THỰC HÀNH CÁC PHÁT NGUYỆN TRONG THỜI GIAN VỀ CHÙA TU HỌC🌺🌺*

Kính thưa các đạo hữu,
CS Khối xin thỉnh các đạo hữu lưu ý:
 *Không thực hành các phát nguyện trong thời gian về chùa và các ngày tu học định kỳ (8, 14, 29/30) tại nhà, nhóm, chùa* như:
*Bạch xin người tinh tấn, Tụng kinh Tam Bảo, Hát tán dương, Nghe Pháp và ngồi thiền, thiền hành theo phát nguyện đã đăng kí*.

Trường hợp đăng kí phát nguyện mà có các ngày 08, 14, 29/30 thì các đạo hữu bạch xin nghỉ và thực hiện bù trong thời gian phát nguyện ạ.
Trường hợp đăng kí phát nguyện đã trừ các ngày 08, 14, 29/30 hoặc không rơi vào các ngày trên thì không cần bạch nghỉ và tụng bù ạ.

CS Khối xin thỉnh các đạo hữu lưu tâm ạ
Xin tuỳ hỷ công đức của các đạo hữu ạ.$k$, $l$Nhắc vào ngày 28 đối với tháng thiếu (29 ngày)$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r40$i$, $j$special$j$, null, $sl$THỨ BẢY HÀNG TUẦN$sl$, $k$🌺 🌺 🌺 LỜI NHẮC: BẠCH HỒI HƯỚNG CÔNG ĐỨC LỤC HÒA SAU KHI BẠCH XONG 49 NGÀY
(DÀNH CHO CÁC PT ĐÃ  BẠCH XONG 49 NGÀY)

LINK CHUNG: https://phamthiyen.com/phat-nguyen-49-ngay-c4292.html

🌷 1. VĂN BẠCH XIN HỒI HƯỚNG CÔNG ĐỨC LỤC HÒA NGÀY THỨ NHẤT (NGÀY CHỦ NHẬT) (ĐÃ BẠCH XONG 49 NGÀY)

LINK BẠCH:
https://docs.google.com/document/d/1LDWDudsFTpv6FaxHXwBuFck4WDr3YorsXFvc_0Qmruw/edit?usp=drivesdk

🌷 2. VĂN BẠCH HỒI HƯỚNG SAU 7 NGÀY CÔNG ĐỨC LỤC HÒA (VÀO NGÀY CHỦ NHẬT TIẾP THEO). (ĐÃ BẠCH XONG 49 NGÀY)
LINK BẠCH
https://docs.google.com/document/d/17LI-LB5OScFQv_8myYMG9oWvgo00__sFqyBdgjhI9jQ/edit?usp=drivesdk

🌺 LƯU Ý: VĂN BẠCH NÀY SỬ DỤNG CHO PT ĐÃ BẠCH XONG 49 NGÀY, KHI BẠCH MỞ LINK ĐỂ BẠCH$k$, $l$Thứ bảy hàng tuần$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r41$i$, $j$special$j$, null, $sl$Chủ nhật hàng tuần$sl$, $k$*🌺🌺LỜI NHẮC🌺🌺*
*DANH SÁCH VIDEO NGHE PHÁP, TU TẬP DÀNH CHO PHẬT TỬ*

Kính thưa các đạo hữu,
CS Khối xin thỉnh các đạo hữu nắm bắt danh sách Phật tử cần hoàn thành việc nghe video tương ứng với thành phần đó trước khi được xét duyệt lên thành phần ạ.
- Phật tử thuộc thành phần a, b, c, d, e cần nghe lần lượt các video tại các mục tương ứng. Ngoài ra, Phật tử có thể tùy duyên xem, nghe thêm các video trong danh sách video theo chủ đề được hướng dẫn trong link.
- Phật tử nào đã lên thành phần rồi, đang ở thành phần nào thì nghe video của thành phần đó và nghe bổ sung các video chưa nghe dành cho thành phần trước đó. Do đó, Nhóm/ĐT cần hướng dẫn sách tấn PT thực hiện theo đúng hướng dẫn và báo cáo lên Nhóm/ĐT để Nhóm/ĐT nắm bắt ạ.
- Nhóm/ĐT cần nắm bắt Cách Thức Thực Hành và Quy Trình Nghe Các Video Và Báo Cáo trong link để thực hiện theo đúng hướng dẫn ạ. 
Link: https://phamthiyen.com/tong-hop-danh-sach-video-nghe-phap-tu-tap-danh-cho-phat-tu-c5899.html

Xin tuỳ hỷ công đức của các đạo hữu ạ!$k$, $l$Chủ nhật hàng tuần$l$, $m$ĐH THOA$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r42$i$, $j$special$j$, null, $sl$Chủ nhật hàng tuần$sl$, $k$🍁 TỔNG HỢP CÁC VẤN ĐỀ VỀ NGHI LỄ 🍁 🍁
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
https://tinyurl.com/ynsrnwdf$k$, $l$$l$, $m$$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r43$i$, $j$special$j$, null, $sl$22h00 các ngày trong tuần$sl$, $k$💐 💐 BÁO CÁO PHẬN SỰ TRONG NGÀY CỦA TEAM NGHI LỄ
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
Xin tùy hỷ công đức của các quý đạo hữu ạ$k$, $l$$l$, $m$ĐH Mỹ TRỰC 3,5,7; ĐH THOA TRỰC 2,4,6,CN$m$) on conflict (id) do nothing;
insert into reminders (id, day_type, lunar_day, special_label, noi_dung, luu_y, phu_trach) values ($i$r44$i$, $j$special$j$, null, $sl$Ngày 03 và 20 hàng tháng$sl$, $k$*🌺 🌺 🌺 (LỜI NHẮC) NGỒI THIỀN SAU CHƯƠNG TRÌNH TRẠCH PHÁP CỦA CCN VÀO CÁC NGÀY 03,20 HÀNG THÁNG*

Kính thưa các quý đạo hữu!

CS khối xin gửi lời nhắc lịch ngồi thiền sau khi nghe trạch pháp ngày 03,20 hàng tháng.

Xin thỉnh các Nhóm/ĐT nắm bắt và nhắc PT lưu tâm áp dụng đối với những buổi có đề mục thiền quán ạ.

Nếu nghe trạch Pháp đúng ngày, PT ngồi thiền trong vòng 3 ngày ngay sau ngày nghe Pháp thì được tính nghe trực tuyến đúng ngày.

Nếu nghe trạch Pháp sau trong vòng 10 ngày, ngồi thiền sau 3 ngày, tổng 13 ngày sau ngày trạch Pháp của CLB.

Xin tuỳ hỷ các đạo hữu ạ.$k$, $l$$l$, $m$$m$) on conflict (id) do nothing;