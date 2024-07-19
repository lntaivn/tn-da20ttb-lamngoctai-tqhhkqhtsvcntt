# XÂY DỰNG HỆ THỐNG TRỰC QUAN HÓA KẾT QUẢ HỌC TẬP SINH VIÊN CÔNG NGHỆ THÔNG TIN


## Giới thiệu
Dự án xây dựng ứng dụng thể trực quan hóa điểm của sinh viên cũng như kết quả học tập. Xây dựng các API để có thể mở rộng thêm.

## Công nghệ Sử Dụng
- NodeJS
- ExpressJS
- ReactJS
- TailwildCSS
- MySQL
- Docker
- Firebase

## Yêu Cầu Hệ Thống
- Node v18.18.0
## Cài Đặt

### Thiết Lập Môi Trường
1. Cài đặt Node.js: Tải xuống và cài đặt Node.js từ [trang web chính thức của Node.js](https://nodejs.org/en/download/).

### Thiết lập dự án
1. Clone dự án từ repository:
   git clone https://github.com/lntaivn/tn-da20ttb-lamngoctai-tqhhkqhtsvcntt.git
2. Chuyển vào thư mục dự án:
```
cd tn-da20ttb-lamngoctai-tqhhkqhtsvcntt
```
### Cấu hình Ứng Dụng
Tạo file 2 file .env `src\datn\frontend\.env` và `src\datn\backend\.env` để tạo các biến môi trường.

#### frontend\.env
```properties
REACT_APP_APIKEY=AIzaSyCZPdWAoY1kZ3PGy_02JQP4bHe4EAyVn2M
REACT_APP_AUTH_DOMAIN=ploclo-fd713.firebaseapp.com
REACT_APP_PROJECT_ID=ploclo-fd713
REACT_APP_STORAGE_BUCKET=ploclo-fd713.appspot.com
REACT_APP_MESSAGING_SENDER_ID=857065623701
REACT_APP_APP_ID=1:857065623701:web:19f5ea47b15996b4fccb9c
REACT_APP_MEASUREMENT_ID=G-Y40B4ZXLTQ

REACT_APP_API_DOMAIN_CLIENT=http://localhost:1509/api
REACT_APP_API_DOMAIN_ADMIN=http://localhost:1509/api/admin
```

#### backend\.env
```properties
JWT_SECRET=your_jwt_secret
DB_NAME=TVU
DB_USER=AdminTVU
DB_PASSWORD=CongNgheThongTin-DA20TTB
DB_HOST=103.200.20.110
DB_DIALECT=mysql
```

### Cài đặt các gói npm 
```
cd backend
npm i 
```
```
cd frontend
npm i
```

### Khởi động ứng dụng
Chạy dự án :
```
cd backend
npm start
```
```
cd frontend
npm start
```
#### Website
```
http://localhost:3000
```

#### API Documentation
Sau khi dự án khởi động, bạn có thể truy cập tài liệu API tự động được tạo bởi openapi tại:
```
http://localhost:1509/api/docs
```
### Liên Hệ
1. Người quản lý dự án: Lâm Ngọc Tài
2. Email: lamngoctai2002@gmail.com
3. Điện thoại: 0965577180

