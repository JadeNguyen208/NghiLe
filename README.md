# Kho Dữ Liệu Nghi Lễ

Ứng dụng nội bộ — lưu trữ và tra cứu hỏi đáp nghi lễ theo chủ đề, kèm nhắc lịch theo ngày âm.

## Cấu trúc

- `public/` — giao diện (HTML/CSS/JS thuần, không cần build)
- `api/` — serverless functions cho Vercel (`/api/entries`, `/api/reminders`, `/api/entries-export`)
- `lib/db.js` — kết nối Supabase dùng chung cho các API
- `supabase-setup.sql` — script tạo bảng + nạp dữ liệu mẫu vào Supabase
- `server.js` + `data.json` + `reminders.json` — bản chạy local bằng Express (dùng để xem thử trên máy, không dùng khi đã deploy lên Vercel)

## Mã khóa chỉnh sửa

Mặc định là `nghile2026` — bất kỳ ai có link đều xem được dữ liệu, nhưng cần đúng mã này mới thêm/sửa/xóa được (hỏi đáp lẫn nhắc lịch). Đổi mã khi deploy thật bằng biến môi trường `EDIT_PIN`. Nhớ đổi mã mặc định trước khi chia sẻ link công khai.

## Đưa lên Vercel + Supabase (miễn phí, không cần thẻ)

### Bước 1 — Tạo project Supabase (kho dữ liệu chung)

1. Vào [supabase.com](https://supabase.com), đăng nhập bằng GitHub.
2. Tạo **New project** (đặt tên tùy ý, chọn mật khẩu database — tự lưu lại, không cần gửi cho ai).
3. Vào **SQL Editor** trong project, dán toàn bộ nội dung file `supabase-setup.sql` rồi bấm **Run**. Lệnh này tạo 2 bảng (`entries`, `reminders`) và nạp sẵn dữ liệu hiện có.
4. Vào **Settings → API**, ghi lại 2 giá trị:
   - **Project URL**
   - **service_role key** (không phải `anon` key — cần quyền ghi)

### Bước 2 — Đưa code lên GitHub

```
git remote add origin <URL repo GitHub bạn vừa tạo>
git push -u origin main
```

### Bước 3 — Deploy trên Vercel

1. Vào [vercel.com](https://vercel.com), đăng nhập bằng GitHub.
2. **Add New → Project**, chọn repo vừa đẩy lên.
3. Ở phần **Environment Variables**, thêm:
   - `SUPABASE_URL` = Project URL ở Bước 1
   - `SUPABASE_SERVICE_KEY` = service_role key ở Bước 1
   - `EDIT_PIN` = mã chỉnh sửa riêng của bạn (thay cho mã mặc định)
4. Bấm **Deploy**. Vercel cấp một URL dạng `https://ten-app.vercel.app` — gửi link này cho mọi người là dùng chung được một kho, dữ liệu lưu thật trên Supabase, không mất khi deploy lại.

## Chạy thử trên máy này (không cần Supabase)

```
npm install
npm start
```

Mở `http://localhost:3000` — bản này dùng file `data.json`/`reminders.json` cục bộ, chỉ để xem giao diện, không đồng bộ với bản Vercel.
