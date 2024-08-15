// Định dạng tiền tệ VND
function formatCurrencyVND(amount) {
    // Sử dụng toLocaleString để định dạng số và sau đó loại bỏ ký hiệu "₫"
    return amount.toLocaleString('vi-VN').replace('₫', '').trim() + ' VNĐ';
}

// Hiển thị chi tiết sản phẩm trong modal
function showProductDetail(product) {
    // Lấy các phần tử trong modal
    const modal = document.getElementById('productDetailModal');
    const modalProductName = document.getElementById('modalProductName');
    const modalProductImage = document.getElementById('modalProductImage');
    const modalProductPrice = document.getElementById('modalProductPrice');
    const modalProductType = document.getElementById('modalProductType');
    const modalProductUnit = document.getElementById('modalProductUnit');
    const modalProductOrigin = document.getElementById('modalProductOrigin');
    const modalProductQuantity = document.getElementById('modalProductQuantity');
    const modalProductDescription = document.getElementById('modalProductDescription');

    // Điền thông tin sản phẩm vào modal
    modalProductName.textContent = product.product_name;
    modalProductImage.src = product.picture;
    modalProductPrice.textContent = formatCurrencyVND(product.unit_price);
    modalProductType.textContent = product.category;
    modalProductUnit.textContent = product.unit;
    modalProductOrigin.textContent = product.origin;
    modalProductQuantity.textContent = product.stock;
    modalProductDescription.textContent = product.description;

    // Hiển thị modal
    modal.style.display = 'block';
}

// Đóng modal
function closeProductDetail() {
    const modal = document.getElementById('productDetailModal');
    modal.style.display = 'none';
}

// Đóng modal khi người dùng nhấp ra ngoài khu vực modal
window.onclick = function (event) {
    const modal = document.getElementById('productDetailModal');
    if (event.target == modal) {
        modal.style.display = 'none';
    }
}

// Fetch dữ liệu từ server và chèn vào div với class "content"
fetch('/api/products')
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
    })
    .then(data => {
        const contentDiv = document.querySelector('.content');
        data.forEach(product => {
            console.log("product: ", product);

            // Tạo thẻ div chứa thông tin sản phẩm
            const productDiv = document.createElement('div');
            productDiv.classList.add('sp');
            productDiv.setAttribute('id', `product-${product.id}`);

            // Tạo và thêm hình ảnh sản phẩm
            const img = document.createElement('img');
            img.src = product.picture;
            img.classList.add('sp-img');
            productDiv.appendChild(img);

            // Tạo và thêm tên sản phẩm
            const nameP = document.createElement('p');
            nameP.classList.add('sp-name');
            nameP.textContent = product.product_name;
            productDiv.appendChild(nameP);

            // Tạo và thêm giá sản phẩm
            const priceP = document.createElement('p');
            priceP.classList.add('price');
            priceP.textContent = `${formatCurrencyVND(product.unit_price)}`;
            productDiv.appendChild(priceP);

            // Tạo và thêm chi tiết sản phẩm
            const detailsDiv = document.createElement('div');
            detailsDiv.classList.add('details');
            detailsDiv.setAttribute('id', 'raucu-details');
            detailsDiv.style.display = 'none';

            const categoryP = document.createElement('p');
            categoryP.classList.add('category');
            categoryP.textContent = `Loại: ${product.category}`;
            detailsDiv.appendChild(categoryP);

            const unitP = document.createElement('p');
            unitP.classList.add('unit');
            unitP.textContent = `Đơn vị: ${product.unit}`;
            detailsDiv.appendChild(unitP);

            const originP = document.createElement('p');
            originP.classList.add('origin');
            originP.textContent = `Xuất xứ: ${product.origin}`;
            detailsDiv.appendChild(originP);

            const quantityP = document.createElement('p');
            quantityP.classList.add('quantity');
            quantityP.textContent = `Số lượng: ${product.stock}`;
            detailsDiv.appendChild(quantityP);

            const descriptionP = document.createElement('p');
            descriptionP.classList.add('description');
            descriptionP.textContent = product.description;
            detailsDiv.appendChild(descriptionP);

            productDiv.appendChild(detailsDiv);

            // Thêm sự kiện click để hiển thị chi tiết sản phẩm trong modal
            img.addEventListener('click', () => {
                showProductDetail(product);
            });

            // Tạo và thêm nút thêm vào giỏ hàng
            const btnP = document.createElement('p');
            btnP.classList.add('btn');

            const addButton = document.createElement('button');
            addButton.classList.add('addbtn');
            addButton.textContent = 'Thêm Vào Giỏ Hàng';
            btnP.appendChild(addButton);

            productDiv.appendChild(btnP);

            // Thêm sản phẩm vào contentDiv
            contentDiv.appendChild(productDiv);
        });
    })
    .catch(error => {
        console.error('Error fetching data:', error);
    });
