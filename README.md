# Kho Dữ Liệu Nghi Lễ

Ứng dụng nội bộ NLCLB — lưu trữ và tra cứu hỏi đáp nghi lễ theo chủ đề.

## Chạy thử trên máy này

```
npm install
npm start
```

Mở trình duyệt tại `http://localhost:3000`.

## Cấu trúc

- `server.js` — backend Express, API REST (`/api/entries`, `/api/reminders`)
- `data.json` — kho hỏi đáp dùng chung
- `reminders.json` — kho nhắc lịch theo ngày âm lịch (nhập từ file Excel gốc)
- `public/` — giao diện (HTML/CSS/JS thuần, không cần build)

## Mã khóa chỉnh sửa

Mặc định là `nghile2026` — bất kỳ ai có link đều xem được dữ liệu, nhưng cần đúng mã này mới thêm/sửa/xóa được (hỏi đáp lẫn nhắc lịch). Đổi mã khi deploy thật bằng biến môi trường `EDIT_PIN` (ví dụ trên Render: vào mục Environment, thêm `EDIT_PIN=mã-riêng-của-bạn`). Nhớ đổi mã mặc định trước khi chia sẻ link công khai.

## Đưa lên hosting thật (để nhiều máy/nhiều người cùng truy cập qua Internet)

Khuyến nghị dùng **Render.com** (có gói miễn phí, dễ dùng nhất cho ứng dụng Node nhỏ):

1. Đưa thư mục này lên một repo GitHub (private hoặc public đều được).
2. Vào [render.com](https://render.com), đăng nhập bằng GitHub, chọn **New +** → **Web Service**.
3. Chọn repo vừa tạo. Cấu hình:
   - Build command: `npm install`
   - Start command: `npm start`
4. Bấm **Create Web Service**. Render sẽ cấp một URL dạng `https://ten-app.onrender.com` — gửi link này cho mọi người là dùng chung được một kho.

**Lưu ý về dữ liệu:** gói miễn phí của Render không có ổ đĩa lưu trữ cố định (persistent disk), nên `data.json` có thể bị mất khi bạn deploy lại phiên bản code mới (không mất khi server chỉ ngủ/thức bình thường). Nếu cần an toàn dữ liệu lâu dài, hai lựa chọn:
- Nâng cấp gói Render có **Persistent Disk**, trỏ `data.json` vào ổ đó.
- Hoặc đổi sang một database thật (Postgres) — có thể làm bước sau khi kho dữ liệu lớn dần.
