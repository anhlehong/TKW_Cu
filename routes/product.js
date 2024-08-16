const express = require('express');
const router = express.Router();
const connection = require('../db'); // Tệp kết nối cơ sở dữ liệu

// Lấy danh sách tất cả sản phẩm
router.get('/', (req, res) => {
    connection.query('SELECT * FROM products', (err, results) => {
        if (err) {
            console.error('Lỗi khi truy vấn sản phẩm:', err);
            return res.status(500).send('Đã xảy ra lỗi khi lấy dữ liệu sản phẩm');
        }
        res.json(results);
    });
});

router.delete('/:id', (req, res) => {
    const productId = req.params.id;

    connection.promise().query('DELETE FROM products WHERE id = ?', [productId])
        .then(() => {
            res.json({ message: 'Sản phẩm đã bị xóa thành công!' });
        })
        .catch(error => {
            console.error('Error deleting product:', error);
            res.status(500).json({ message: 'Đã xảy ra lỗi khi xóa sản phẩm.' });
        });
});

router.put('/:id', (req, res) => {
    const productId = req.params.id;
    const { product_name, category_id, unit, origin, unit_price, stock, description } = req.body;

    connection.promise().query(
        'UPDATE products SET product_name = ?, category_id = ?, unit = ?, origin = ?, unit_price = ?, stock = ?, description = ? WHERE id = ?',
        [product_name, category_id, unit, origin, unit_price, stock, description, productId]
    )
        .then(() => {
            res.json({ message: 'Cập nhật sản phẩm thành công!' });
        })
        .catch(error => {
            console.error('Error updating product:', error);
            res.status(500).json({ message: 'Đã xảy ra lỗi khi cập nhật sản phẩm.' });
        });
});

router.post('/add', (req, res) => {
    const { product_name, picture, origin, unit_price, unit, stock, description, category_id } = req.body;
    const supplier_id = req.body.supplier_id || null;  // Mặc định supplier_id là null nếu không cung cấp

    connection.query(
        'INSERT INTO products (product_name, picture, origin, unit_price, unit, stock, description, category_id, supplier_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [product_name, picture, origin, unit_price, unit, stock, description, category_id, supplier_id],
        (err, result) => {
            if (err) {
                console.error('Lỗi khi thêm sản phẩm:', err);
                return res.status(500).send('Đã xảy ra lỗi khi thêm sản phẩm');
            }
            res.status(201).send('Thêm sản phẩm thành công');
        }
    );
});

module.exports = router;
