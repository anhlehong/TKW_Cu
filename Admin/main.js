// Hàm để ẩn tất cả các phần quản lý
function hideAllSections() {
    document.getElementById('product-management').style.display = 'none';
    document.getElementById('order-management').style.display = 'none';
    document.getElementById('customer-management').style.display = 'none';
    document.getElementById('employee-management').style.display = 'none';
}

// QLSP - Quản lý Sản phẩm
document.getElementById('manage-products').addEventListener('click', function() {
    hideAllSections();
    document.getElementById('product-management').style.display = 'block';
});

// QL Đơn hàng - Quản lý Đơn hàng
document.getElementById('manage-orders').addEventListener('click', function() {
    hideAllSections();
    document.getElementById('order-management').style.display = 'block';
});

// QL Khách hàng - Quản lý Khách hàng
document.getElementById('manage-customers').addEventListener('click', function() {
    hideAllSections();
    document.getElementById('customer-management').style.display = 'block';
});

// QL Nhân viên - Quản lý Nhân viên
document.getElementById('manage-employees').addEventListener('click', function() {
    hideAllSections();
    document.getElementById('employee-management').style.display = 'block';
});

// Thêm sản phẩm mới
document.getElementById('add-product').addEventListener('click', function() {
    const productId = prompt('Nhập ID sản phẩm:');
    const productName = prompt('Nhập tên sản phẩm:');
    const productCategory = prompt('Nhập loại sản phẩm:');
    const productUnit = prompt('Nhập đơn vị sản phẩm:'); // Thêm đơn vị
    const productOrigin = prompt('Nhập nguồn gốc sản phẩm:');
    const productPrice = prompt('Nhập giá sản phẩm:');
    const productQuantity = prompt('Nhập số lượng sản phẩm:');
    const productDescription = prompt('Nhập mô tả sản phẩm:'); // Thêm mô tả
    const productImage = prompt('Nhập URL hình ảnh sản phẩm:');

    if (productId && productName && productCategory && productUnit && productOrigin && productPrice && productQuantity && productDescription && productImage) {
        const productList = document.getElementById('product-list');
        const newRow = document.createElement('tr');

        newRow.innerHTML = `
            <td>${productId}</td>
            <td>${productName}</td>
            <td>${productCategory}</td>
            <td>${productUnit}</td> <!-- Hiển thị đơn vị -->
            <td>${productOrigin}</td>
            <td>${productPrice}</td>
            <td>${productQuantity}</td>
            <td>${productDescription}</td> <!-- Hiển thị mô tả -->
            <td><img src="${productImage}" alt="${productName}" style="width: 50px; height: 50px;"></td>
            <td>
                <button class="edit-btn">Sửa</button>
                <button class="delete-btn">Xóa</button>
            </td>
        `;
        productList.appendChild(newRow);

        attachEventListeners(newRow);
    }
});

// Gắn sự kiện cho các nút sửa và xóa sản phẩm
function attachEventListeners(row) {
    row.querySelector('.edit-btn').addEventListener('click', function() {
        const productName = prompt('Nhập tên mới của sản phẩm:', row.children[1].textContent);
        const productCategory = prompt('Nhập loại mới của sản phẩm:', row.children[2].textContent);
        const productUnit = prompt('Nhập đơn vị mới của sản phẩm:', row.children[3].textContent); // Sửa đơn vị
        const productOrigin = prompt('Nhập nguồn gốc mới của sản phẩm:', row.children[4].textContent);
        const productPrice = prompt('Nhập giá mới của sản phẩm:', row.children[5].textContent);
        const productQuantity = prompt('Nhập số lượng mới của sản phẩm:', row.children[6].textContent);
        const productDescription = prompt('Nhập mô tả mới của sản phẩm:', row.children[7].textContent); // Sửa mô tả
        const productImage = prompt('Nhập URL hình ảnh mới của sản phẩm:', row.children[8].querySelector('img').src);

        if (productName && productCategory && productUnit && productOrigin && productPrice && productQuantity && productDescription && productImage) {
            row.children[1].textContent = productName;
            row.children[2].textContent = productCategory;
            row.children[3].textContent = productUnit; // Cập nhật đơn vị
            row.children[4].textContent = productOrigin;
            row.children[5].textContent = productPrice;
            row.children[6].textContent = productQuantity;
            row.children[7].textContent = productDescription; // Cập nhật mô tả
            row.children[8].querySelector('img').src = productImage;
        }
    });

    row.querySelector('.delete-btn').addEventListener('click', function() {
        if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')) {
            row.remove();
        }
    });
}


// Thêm đơn hàng mới
document.getElementById('add-order').addEventListener('click', function() {
    const orderId = prompt('Nhập ID đơn hàng:');
    const employeeId = prompt('Nhập ID nhân viên:');
    const orderInfo = prompt('Nhập thông tin đơn hàng:');
    const orderDate = prompt('Nhập ngày đặt hàng (YYYY-MM-DD):');
    const shippingMethod = prompt('Nhập hình thức vận chuyển:');
    const shippingAddress = prompt('Nhập địa chỉ giao hàng:');

    if (orderId && employeeId && orderDate && shippingMethod && shippingAddress) {
        const orderList = document.getElementById('order-list');
        const newRow = document.createElement('tr');

        newRow.innerHTML = `
            <td>${orderId}</td>
            <td>${employeeId}</td>
            <td>${orderInfo}</td>
            <td>${orderDate}</td>
            <td>${shippingMethod}</td>
            <td>${shippingAddress}</td>
            <td>
                <button class="edit-order-btn">Sửa</button>
                <button class="delete-order-btn">Xóa</button>
            </td>
        `;
        orderList.appendChild(newRow);

        attachOrderEventListeners(newRow);
    }
});

// Gắn sự kiện cho các nút sửa và xóa đơn hàng
function attachOrderEventListeners(row) {
    row.querySelector('.edit-order-btn').addEventListener('click', function() {
        const orderId = prompt('Nhập ID đơn hàng mới:', row.children[0].textContent);
        const employeeId = prompt('Nhập ID nhân viên mới:', row.children[1].textContent);
        const orderInfo = prompt('Nhập thông tin đơn hàng:', row.children[2].textContent);
        const orderDate = prompt('Nhập ngày đặt hàng mới (YYYY-MM-DD):', row.children[3].textContent);
        const shippingMethod = prompt('Nhập hình thức vận chuyển mới:', row.children[4].textContent);
        const shippingAddress = prompt('Nhập địa chỉ giao hàng mới:', row.children[5].textContent);

        if (orderId && employeeId && orderDate && shippingMethod && shippingAddress) {
            row.children[0].textContent = orderId;
            row.children[1].textContent = employeeId;
            row.children[2].textContent = orderInfo;
            row.children[3].textContent = orderDate;
            row.children[4].textContent = shippingMethod;
            row.children[5].textContent = shippingAddress;
        }
    });

    row.querySelector('.delete-order-btn').addEventListener('click', function() {
        if (confirm('Bạn có chắc chắn muốn xóa đơn hàng này không?')) {
            row.remove();
        }
    });
};

// Thêm khách hàng mới
document.getElementById('add-customer').addEventListener('click', function() {
    const customerId = prompt('Nhập ID khách hàng:');
    const customerName = prompt('Nhập họ và tên khách hàng:');
    const customerEmail = prompt('Nhập email khách hàng:');
    const customerPassword = prompt('Nhập mật khẩu khách hàng:');
    const customerAddress = prompt('Nhập địa chỉ khách hàng:');
    const customerPhone = prompt('Nhập số điện thoại khách hàng:');
    const customerDob = prompt('Nhập ngày sinh khách hàng (YYYY-MM-DD):');
    const customerGender = prompt('Nhập giới tính khách hàng (Nam/Nữ):');

    if (customerId && customerName && customerEmail && customerPassword && customerAddress && customerPhone && customerDob && customerGender) {
        const customerList = document.getElementById('customer-list');
        const newRow = document.createElement('tr');

        newRow.innerHTML = `
            <td>${customerId}</td>
            <td>${customerName}</td>
            <td>${customerEmail}</td>
            <td>${customerPassword}</td>
            <td>${customerAddress}</td>
            <td>${customerPhone}</td>
            <td>${customerDob}</td>
            <td>${customerGender}</td>
            <td>
                <button class="edit-customer-btn">Sửa</button>
                <button class="delete-customer-btn">Xóa</button>
            </td>
        `;
        customerList.appendChild(newRow);

        attachCustomerEventListeners(newRow);
    }
});

// Gắn sự kiện cho các nút sửa và xóa khách hàng
function attachCustomerEventListeners(row) {
    row.querySelector('.edit-customer-btn').addEventListener('click', function() {
        const customerName = prompt('Nhập họ và tên mới:', row.children[1].textContent);
        const customerEmail = prompt('Nhập email mới:', row.children[2].textContent);
        const customerPassword = prompt('Nhập mật khẩu mới:', row.children[3].textContent);
        const customerAddress = prompt('Nhập địa chỉ mới:', row.children[4].textContent);
        const customerPhone = prompt('Nhập số điện thoại mới:', row.children[5].textContent);
        const customerDob = prompt('Nhập ngày sinh mới (YYYY-MM-DD):', row.children[6].textContent);
        const customerGender = prompt('Nhập giới tính mới (Nam/Nữ):', row.children[7].textContent);

        if (customerName && customerEmail && customerPassword && customerAddress && customerPhone && customerDob && customerGender) {
            row.children[1].textContent = customerName;
            row.children[2].textContent = customerEmail;
            row.children[3].textContent = customerPassword;
            row.children[4].textContent = customerAddress;
            row.children[5].textContent = customerPhone;
            row.children[6].textContent = customerDob;
            row.children[7].textContent = customerGender;
        }
    });

    row.querySelector('.delete-customer-btn').addEventListener('click', function() {
        if (confirm('Bạn có chắc chắn muốn xóa khách hàng này không?')) {
            row.remove();
        }
    });
};

// Thêm nhân viên mới
document.getElementById('add-employee').addEventListener('click', function() {
    const employeeId = prompt('Nhập ID nhân viên:');
    const employeeName = prompt('Nhập họ và tên nhân viên:');
    const employeeEmail = prompt('Nhập email nhân viên:');
    const employeePassword = prompt('Nhập mật khẩu nhân viên:');
    const employeeAddress = prompt('Nhập địa chỉ nhân viên:');
    const employeeDob = prompt('Nhập ngày sinh nhân viên (YYYY-MM-DD):');
    const employeeGender = prompt('Nhập giới tính nhân viên (Nam/Nữ):');
    const employeePosition = prompt('Nhập chức vụ nhân viên:');

    if (employeeId && employeeName && employeeEmail && employeePassword && employeeAddress && employeeDob && employeeGender && employeePosition) {
        const employeeList = document.getElementById('employee-list');
        const newRow = document.createElement('tr');

        newRow.innerHTML = `
            <td>${employeeId}</td>
            <td>${employeeName}</td>
            <td>${employeeEmail}</td>
            <td>${employeePassword}</td>
            <td>${employeeAddress}</td>
            <td>${employeeDob}</td>
            <td>${employeeGender}</td>
            <td>${employeePosition}</td>
            <td>
                <button class="edit-employee-btn">Sửa</button>
                <button class="delete-employee-btn">Xóa</button>
            </td>
        `;
        employeeList.appendChild(newRow);

        attachEmployeeEventListeners(newRow);
    }
});

// Gắn sự kiện cho các nút sửa và xóa nhân viên
function attachEmployeeEventListeners(row) {
    row.querySelector('.edit-employee-btn').addEventListener('click', function() {
        const employeeName = prompt('Nhập họ và tên mới:', row.children[1].textContent);
        const employeeEmail = prompt('Nhập email mới:', row.children[2].textContent);
        const employeePassword = prompt('Nhập mật khẩu mới:', row.children[3].textContent);
        const employeeAddress = prompt('Nhập địa chỉ mới:', row.children[4].textContent);
        const employeeDob = prompt('Nhập ngày sinh mới (YYYY-MM-DD):', row.children[5].textContent);
        const employeeGender = prompt('Nhập giới tính mới (Nam/Nữ):', row.children[6].textContent);
        const employeePosition = prompt('Nhập chức vụ mới:', row.children[7].textContent);

        if (employeeName && employeeEmail && employeePassword && employeeAddress && employeeDob && employeeGender && employeePosition) {
            row.children[1].textContent = employeeName;
            row.children[2].textContent = employeeEmail;
            row.children[3].textContent = employeePassword;
            row.children[4].textContent = employeeAddress;
            row.children[5].textContent = employeeDob;
            row.children[6].textContent = employeeGender;
            row.children[7].textContent = employeePosition;
        }
    });

    row.querySelector('.delete-employee-btn').addEventListener('click', function() {
        if (confirm('Bạn có chắc chắn muốn xóa nhân viên này không?')) {
            row.remove();
        }
    });
}
// Xử lý sự kiện đăng xuất
document.querySelector('.logout').addEventListener('click', function() {
    // Thực hiện các hành động đăng xuất
    alert('Bạn đã đăng xuất thành công!');
    // Ví dụ: chuyển hướng đến trang đăng nhập
    // window.location.href = 'login.html';
});
