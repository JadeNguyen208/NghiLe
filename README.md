# Kho Dữ Liệu Nghi Lễ

Ứng dụng nội bộ — lưu trữ và tra cứu hỏi đáp nghi lễ theo chủ đề, kèm nhắc lịch theo ngày âm và kho tài liệu.

## Link tra cứu (đã chạy)

**https://nl-dulieu.web.app** — gửi link này cho mọi người.

Trang có **màn hình yêu cầu nhập mã trước khi xem**, mã là `0102023`. Mỗi trình duyệt chỉ cần nhập đúng 1 lần (tự nhớ cho lần sau). Sau khi vào, mọi người xem và tìm kiếm được toàn bộ kho, nhưng không thấy nút thêm/sửa/xóa (bản chỉ đọc).

> Lưu ý về mức độ riêng tư: đây là màn hình chặn ở phía giao diện, đủ để ngăn người xem lướt qua tình cờ, nhưng không phải bảo mật cấp máy chủ thật sự — ai rành kỹ thuật và biết đường dẫn file dữ liệu vẫn có thể lấy trực tiếp. Nếu cần bảo mật chặt hơn, phải chuyển sang phương án có backend thật (xem mục Supabase bên dưới).

Link cũ `kho-du-lieu-nghi-le.web.app` vẫn còn tồn tại (chạy cùng code, cùng mã) nhưng không dùng làm link chính nữa — trình duyệt của ai từng ghé link đó trước đây có thể cần một lúc để tự làm mới cache.

## Nhập/sửa dữ liệu (trên máy quản trị)

```
npm install
npm start
```

Mở `http://localhost:3000`. Bản này có đầy đủ nút thêm/sửa/xóa, **không có** màn hình mã xem (chỉ máy chủ tĩnh mới có).

Bấm nút khóa ở cuối thanh bên trái, nhập mã **`010203`** để mở chế độ chỉnh sửa. Khi đã mở, chế độ này **giữ nguyên cho đến khi bạn tự bấm khóa lại** (kể cả khi tải lại trang). Nhập sai mã sẽ báo lỗi ngay.

Đổi mã chỉnh sửa bằng biến môi trường `EDIT_PIN` nếu cần. Đổi mã xem (`0102023`) thì sửa hằng số `VIEW_CODE` trong `public/app.js`.

## Cập nhật lại link sau khi nhập dữ liệu

```
npm run deploy
```

Lệnh này đóng gói dữ liệu mới nhất rồi đẩy lên cả 2 site Firebase Hosting (`nl-dulieu` và `kho-du-lieu-nghi-le`). Sau khoảng 1 phút, mọi người mở link sẽ thấy nội dung mới.

## Cấu trúc

- `public/` — giao diện (HTML/CSS/JS thuần, không cần build)
- `server.js` — máy chủ Express chạy trên máy quản trị, cho phép thêm/sửa/xóa
- `data.json` / `reminders.json` / `docs.json` — kho dữ liệu gốc
- `build.js` — đóng gói `public/` + dữ liệu thành thư mục `dist/` để đưa lên Firebase
- `firebase.json`, `.firebaserc` — cấu hình Firebase Hosting (project `kho-du-lieu-nghi-le`, 2 site: `nl-dulieu` là site chính)
- `api/`, `lib/db.js`, `supabase-setup.sql` — phương án Vercel + Supabase (đã chuẩn bị sẵn, hiện chưa dùng)

## Ghi chú kỹ thuật

Giao diện tự nhận biết môi trường: nếu gọi được API của `server.js` thì bật chế độ chỉnh sửa, bỏ qua màn hình mã xem; nếu không (bản tĩnh trên Firebase) thì yêu cầu mã xem, rồi tự đọc dữ liệu từ `data/*.json` và chuyển sang chế độ chỉ đọc.

Nếu sau này cần cho nhiều người cùng nhập dữ liệu trực tiếp trên link (không phải chỉ máy quản trị), hoặc cần bảo mật thật sự thay vì màn hình mã xem ở giao diện, cần chuyển sang phương án có cơ sở dữ liệu + backend trực tuyến — thư mục `api/` và `supabase-setup.sql` đã chuẩn bị sẵn cho việc đó.
