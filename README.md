# Kho Dữ Liệu Nghi Lễ

Ứng dụng nội bộ — lưu trữ và tra cứu hỏi đáp nghi lễ theo chủ đề, kèm nhắc lịch theo ngày âm và kho tài liệu.

## Link tra cứu (đã chạy)

**https://kho-du-lieu-nghi-le.web.app** — gửi link này cho mọi người. Ai mở cũng xem và tìm kiếm được toàn bộ kho, không cần đăng nhập.

Bản trên link này là **bản tra cứu (chỉ đọc)**: các nút thêm/sửa/xóa được ẩn đi. Việc nhập dữ liệu làm trên máy quản trị (xem mục dưới), xong chạy 1 lệnh để cập nhật lại link.

## Nhập/sửa dữ liệu (trên máy quản trị)

```
npm install
npm start
```

Mở `http://localhost:3000`. Bản này có đầy đủ nút thêm/sửa/xóa.

Bấm nút khóa ở cuối thanh bên trái, nhập mã **`010203`** để mở chế độ chỉnh sửa. Khi đã mở, chế độ này **giữ nguyên cho đến khi bạn tự bấm khóa lại** (kể cả khi tải lại trang). Nhập sai mã sẽ báo lỗi ngay.

Đổi mã bằng biến môi trường `EDIT_PIN` nếu cần.

## Cập nhật lại link sau khi nhập dữ liệu

```
npm run deploy
```

Lệnh này đóng gói dữ liệu mới nhất rồi đẩy lên Firebase Hosting. Sau khoảng 1 phút, mọi người mở link sẽ thấy nội dung mới.

## Cấu trúc

- `public/` — giao diện (HTML/CSS/JS thuần, không cần build)
- `server.js` — máy chủ Express chạy trên máy quản trị, cho phép thêm/sửa/xóa
- `data.json` / `reminders.json` / `docs.json` — kho dữ liệu gốc
- `build.js` — đóng gói `public/` + dữ liệu thành thư mục `dist/` để đưa lên Firebase
- `firebase.json`, `.firebaserc` — cấu hình Firebase Hosting (project `kho-du-lieu-nghi-le`)
- `api/`, `lib/db.js`, `supabase-setup.sql` — phương án Vercel + Supabase (đã chuẩn bị sẵn, hiện chưa dùng)

## Ghi chú kỹ thuật

Giao diện tự nhận biết môi trường: nếu gọi được API của `server.js` thì bật chế độ chỉnh sửa; nếu không (bản tĩnh trên Firebase) thì tự đọc dữ liệu từ `data/*.json` và chuyển sang chế độ chỉ đọc.

Nếu sau này cần cho nhiều người cùng nhập dữ liệu trực tiếp trên link (không phải chỉ máy quản trị), cần chuyển sang phương án có cơ sở dữ liệu trực tuyến — thư mục `api/` và `supabase-setup.sql` đã chuẩn bị sẵn cho việc đó.
