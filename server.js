const express = require('express');
const path = require('path');
const mysql = require('mysql2');
const app = express();
const port = 3000;

// Thiết lập kết nối cơ sở dữ liệu MySQL
const connection = mysql.createConnection({
    host: 'localhost',  // Địa chỉ host của MySQL
    user: 'root',  // Tên người dùng MySQL
    password: '123456',  // Mật khẩu MySQL của bạn
    database: 'BachHoa'  // Tên cơ sở dữ liệu MySQL
});

connection.connect(err => {
    if (err) {
        console.error('Lỗi kết nối cơ sở dữ liệu:', err);
        return;
    }
    console.log('Kết nối thành công đến cơ sở dữ liệu MySQL');
});

// Serve các tệp tĩnh từ thư mục hiện tại
app.use(express.static(path.join(__dirname)));

// Định nghĩa route để phục vụ trang chủ
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// API để lấy danh sách sản phẩm
app.get('/api/products', (req, res) => {
    connection.query('SELECT * FROM products', (err, results) => {
        if (err) {
            console.error('Lỗi khi truy vấn dữ liệu:', err);
            res.status(500).send('Đã xảy ra lỗi khi lấy dữ liệu sản phẩm');
        } else {
            res.json(results);
        }
    });
});

// API để lấy danh sách category
app.get('/api/categories', (req, res) => {
    connection.query('SELECT * FROM category', (err, results) => {
        if (err) {
            console.error('Lỗi khi truy vấn dữ liệu:', err);
            res.status(500).send('Đã xảy ra lỗi khi lấy dữ liệu category');
        } else {
            res.json(results);
        }
    });
});

// Khởi động server
app.listen(port, () => {
    console.log(`Server đang chạy tại http://localhost:${port}`);
});
