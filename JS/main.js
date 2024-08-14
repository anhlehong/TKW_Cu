if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", ready);
} else {
  ready();
}

function filter(name) {
  const e = document.querySelectorAll("#raucu,#thit,#ca");
  for (var i = 0; i < e.length; i++) {
    e[i].style.display = "inline-block";
    if (name == "all") {
      e[i].style.display = "inline-block";
    } else {
      if (e[i].id != name) {
        e[i].style.display = "none";
      }
    }
  }
}

function ready() {
  var removeItem = document.getElementsByClassName("delbtn");
  for (var i = 0; i < removeItem.length; i++) {
    var btn = removeItem[i];
    btn.addEventListener("click", removeCartItem);
  }

  var quantiInp = document.getElementsByClassName("quanti");
  for (var i = 0; i < quantiInp.length; i++) {
    var inp = quantiInp[i];
    inp.addEventListener("change", quantiChanged);
  }

  var addCartBtn = document.getElementsByClassName("addbtn");
  for (var i = 0; i < addCartBtn.length; i++) {
    var btn = addCartBtn[i];
    btn.addEventListener("click", addCartClicked);
  }
  var productImages = document.getElementsByClassName("sp-img");
  for (var i = 0; i < productImages.length; i++) {
    var img = productImages[i];
    img.addEventListener("click", showProductDetails);
  }
  // document
  // .getElementsByClassName("ord")[0]
  // .addEventListener("click", ordClicked);
}
// Chi tiết sản phẩm

function showProductDetails(event) {
  var productElement = event.target.closest(".sp");
  if (productElement) {
    var productName = productElement.querySelector(".sp-name").textContent;
    var productPrice = productElement.querySelector(".price").textContent;
    var productType = productElement.querySelector(".category").textContent.replace("Loại: ", "");
    var productUnit = productElement.querySelector(".unit").textContent.replace("Đơn vị: ", "");
    var productOrigin = productElement.querySelector(".origin").textContent.replace("Xuất xứ: ", "");
    var productQuantity = productElement.querySelector(".quantity").textContent.replace("Số lượng: ", "");
    var productDescription = productElement.querySelector(".description").textContent.replace("Mô tả: ", "");

    // Cập nhật nội dung trong modal
    document.getElementById("modalProductName").textContent = productName;
    document.getElementById("modalProductPrice").textContent = productPrice;
    document.getElementById("modalProductType").textContent = productType;
    document.getElementById("modalProductUnit").textContent = productUnit;
    document.getElementById("modalProductOrigin").textContent = productOrigin;
    document.getElementById("modalProductQuantity").textContent = productQuantity;
    document.getElementById("modalProductDescription").textContent = productDescription;
    
    var productImage = productElement.querySelector(".sp-img").src;
    document.getElementById("modalProductImage").src = productImage;

    // Hiển thị modal chi tiết sản phẩm
    var productDetailModal = document.getElementById("productDetailModal");
    productDetailModal.style.display = "block";
  }
}
function closeProductDetail() {
  var productDetailModal = document.getElementById("productDetailModal");
  productDetailModal.style.display = "none";
}

// Đảm bảo rằng khi nhấp vào nút "X" hoặc bên ngoài modal, modal sẽ đóng
window.onclick = function(event) {
  var modal = document.getElementById("productDetailModal");
  if (event.target == modal) {
      modal.style.display = "none";
  }
}
function addCartClicked(event) {
  var btn = event.target;
  var item = btn.parentElement.parentElement;
  var name = item.getElementsByClassName("sp-name")[0].innerText;
  var price = item.getElementsByClassName("price")[0].innerText;
  var img = item.getElementsByClassName("sp-img")[0].src;
  addItem(name, price, img);
  updateCart();
}

function addItem(name, price, img) {
  var cartRow = document.createElement("div");
  var carRowContent = `
  <div class="item">
    <div class="imn item-col">
      <img src="${img}">
      <span class="item-name">${name}</span>
    </div>
    <span class="price item-col">${price}</span>
    <div class="item-col">
      <input class="quanti" type="number" value="1">
      <button class="delbtn">Xóa</button>
    </div>
  </div>`;
  cartRow.innerHTML = carRowContent;
  var items = document.getElementsByClassName("items")[0];
  var itemName = items.getElementsByClassName("item-name");
  for (var i = 0; i < itemName.length; i++) {
    if (itemName[i].innerText === name) {
      alert("Vật phẩm này đã có trong giỏ hàng.");
      return;
    }
  }
  items.append(cartRow);
  cartRow
    .getElementsByClassName("delbtn")[0]
    .addEventListener("click", removeCartItem);
  cartRow
    .getElementsByClassName("quanti")[0]
    .addEventListener("change", quantiChanged);
}

function removeCartItem(event) {
  var btn_remove = event.target;
  btn_remove.parentElement.parentElement.remove();
  updateCart();
}

function quantiChanged(event) {
  var inp = event.target;
  if (isNaN(inp.value) || inp.value <= 0) {
    inp.value = 1;
  }
  updateCart();
}

// function ordClicked() {
//   alert("Cảm ơn bạn đã thanh toán đơn hàng!");
//   var items = document.getElementsByClassName("items")[0];
//   while (items.hasChildNodes()) {
//     items.removeChild(items.firstChild);
//   }
//   updateCart();
// }

// JavaScript: main.js

document.querySelectorAll('.sp-img').forEach(img => {
  img.addEventListener('click', function() {
      // Lấy thông tin chi tiết từ ảnh sản phẩm
      const productDiv = img.closest('.sp');
      const productName = productDiv.querySelector('.sp-name').textContent;
      const productPrice = productDiv.querySelector('.price').textContent;
      const productCategory = productDiv.querySelector('.category') ? productDiv.querySelector('.category').textContent : 'N/A';
      const productUnit = productDiv.querySelector('.unit') ? productDiv.querySelector('.unit').textContent : 'N/A';
      const productOrigin = productDiv.querySelector('.origin') ? productDiv.querySelector('.origin').textContent : 'N/A';
      const productQuantity = productDiv.querySelector('.quantity') ? productDiv.querySelector('.quantity').textContent : 'N/A';
      const productDescription = productDiv.querySelector('.description') ? productDiv.querySelector('.description').textContent : 'N/A';

      // Hiển thị thông tin chi tiết trong modal
      document.getElementById('modalProductName').textContent = productName;
      document.getElementById('modalProductImage').src = img.src;
      document.getElementById('modalProductPrice').textContent = productPrice;
      document.getElementById('modalProductType').textContent = productCategory;
      document.getElementById('modalProductUnit').textContent = productUnit;
      document.getElementById('modalProductOrigin').textContent = productOrigin;
      document.getElementById('modalProductQuantity').textContent = productQuantity;
      document.getElementById('modalProductDescription').textContent = productDescription;

      // Mở modal
      document.getElementById('productDetailModal').style.display = 'block';
  });
});

function closeProductDetail() {
  document.getElementById('productDetailModal').style.display = 'none';
}

function updateCart() {
  var itemContainer = document.getElementsByClassName("items")[0];
  var cartRows = itemContainer.getElementsByClassName("item");
  var total = 0;
  for (var i = 0; i < cartRows.length; i++) {
      var cartRow = cartRows[i];
      var priceEl = cartRow.getElementsByClassName("price")[0];
      var quantiEl = cartRow.getElementsByClassName("quanti")[0];
      var price = parseFloat(priceEl.innerText.replace(".000 VNĐ", ""));
      var quanti = quantiEl.value;
      total += price * quanti;
  }
  document.getElementsByClassName("total-price")[0].innerText = total + ".000 VNĐ";
  calculateTotal(); // Cập nhật tổng cộng khi cập nhật giỏ hàng
}

function display() {
  var modal = document.getElementById("basket");
  modal.style.display = "block";
}

function close_m() {
  var modal = document.getElementById("basket");
  modal.style.display = "none";
}
document.querySelector('.ord').addEventListener('click', function() {
  document.getElementById('checkoutModal').style.display = 'block';
  displayProductList();
  calculateTotal();
  applyDiscount(); // Áp dụng giảm giá ngay sau khi hiển thị tổng tiền
});

function closeCheckout() {
  document.getElementById('checkoutModal').style.display = 'none';
}

function displayProductList() {
  // Lấy danh sách sản phẩm trong giỏ hàng và hiển thị trong modal
  var productList = ''; // Sử dụng biến này để tạo danh sách sản phẩm
  var items = document.querySelectorAll('.item'); // Lấy tất cả các sản phẩm trong giỏ hàng
  items.forEach(function(item) {
      var name = item.querySelector('.item-name').innerText;
      var quantity = item.querySelector('input').value;
      var price = item.querySelector('.price').innerText;
      productList += `<p>${name} x ${quantity} - ${price}</p>`;
  });
  document.getElementById('productList').innerHTML = productList;
}

// Hàm áp dụng mã giảm giá
function applyDiscount() {
  calculateTotal();
}

document.querySelector('.ord').addEventListener('click', function() {
  document.getElementById('checkoutModal').style.display = 'block';
  displayProductList();
  calculateTotal(); // Tính tổng lại sau khi hiển thị modal thanh toán
});
function calculateTotal() {
  // Lấy tổng giá trị các sản phẩm trong giỏ hàng
  var itemContainer = document.getElementsByClassName("items")[0];
  var cartRows = itemContainer.getElementsByClassName("item");
  var total = 0;
  for (var i = 0; i < cartRows.length; i++) {
      var cartRow = cartRows[i];
      var priceEl = cartRow.getElementsByClassName("price")[0];
      var quantiEl = cartRow.getElementsByClassName("quanti")[0];
      var price = parseFloat(priceEl.innerText.replace(".000 VNĐ", ""));
      var quanti = quantiEl.value;
      total += price * quanti;
  }

  // Lấy chi phí vận chuyển từ phương thức vận chuyển được chọn
  var shippingMethod = document.getElementById("shippingMethod");
  var shippingCost = parseFloat(shippingMethod.options[shippingMethod.selectedIndex].dataset.cost);

  // Cộng thêm chi phí vận chuyển vào tổng tiền
  total += shippingCost / 1000;

  // Lấy giá trị giảm giá
  const discountCode = document.getElementById('discountCode');
  const discountValue = parseFloat(discountCode.options[discountCode.selectedIndex].dataset.cost);

  //Trừ tiền giảm giá
  total -=discountValue / 1000;

  // Đảm bảo tổng tiền không âm
  if (total < 0) {
    total = 0;
  }

  // Hiển thị tổng tiền sau khi áp dụng vận chuyển và giảm giá
  document.getElementById('totalAfterDiscount').innerText = total.toFixed(3) + " VNĐ";
}
document.getElementById("shippingMethod").addEventListener('change', calculateTotal)
document.getElementById("discountCode").addEventListener("change", calculateTotal);

function confirmPayment() {
  // Hiển thị thông báo xác nhận
  alert("Cảm ơn bạn đã thanh toán đơn hàng!");

  // Xóa các sản phẩm trong giỏ hàng
  var itemsContainer = document.getElementsByClassName("items")[0];
  while (itemsContainer.hasChildNodes()) {
      itemsContainer.removeChild(itemsContainer.firstChild);
  }

  // Reset thông tin thanh toán
  document.getElementById('shippingMethod').selectedIndex = 0;
  document.getElementById('shippingAddress').value = '';
  document.getElementById('discountCode').selectedIndex = 0;
  document.getElementById('totalAfterDiscount').innerText = '0.000 VNĐ';

  // Đóng modal thanh toán
  closeCheckout();

  // Cập nhật lại giỏ hàng và tổng cộng
  updateCart();
}
function resetCart() {
  // Xóa tất cả các sản phẩm trong giỏ hàng
  const cartItemsContainer = document.querySelector('.items');
  cartItemsContainer.innerHTML = ''; // Xóa tất cả các sản phẩm trong giỏ hàng

  // Đặt lại tổng giá về 0
  const totalPriceElement = document.querySelector('.total-price');
  totalPriceElement.textContent = '0.000 VNĐ';

  // Reset lại các thông tin khác nếu cần thiết
  // Ví dụ: Đặt lại số lượng sản phẩm trong giỏ về 0
}
function resetCheckout() {
  // Reset giá trị của các trường trong phần thanh toán
  document.getElementById('shippingAddress').value = '';
  document.getElementById('discountCode').value = '0';
  document.getElementById('shippingMethod').selectedIndex = 0;
  document.getElementById('totalBeforeDiscount').innerText = '0.000 VNĐ';
  document.getElementById('totalAfterDiscount').innerText = '0.000 VNĐ';
  
  // Xóa các sản phẩm trong giỏ hàng
  resetCart(); // Xóa giỏ hàng

  // Cập nhật lại tổng giá trị giỏ hàng
  updateCart();
}
// Mở modal
function openProfile() {
  document.getElementById("profileModal").style.display = "block";
}

// Đóng modal
function closeProfile() {
  document.getElementById("profileModal").style.display = "none";
}

// Lưu thông tin hồ sơ (giả sử lưu vào localStorage hoặc gửi lên server)
function saveProfile() {
  const fullname = document.getElementById("fullname").value;
  const email = document.getElementById("email").value;
  const password = document.getElementById("password").value;
  const address = document.getElementById("address").value;
  const phone = document.getElementById("phone").value;
  const birthday = document.getElementById("birthday").value;
  const gender = document.getElementById("gender").value;

  // Giả lập lưu thông tin vào localStorage
  localStorage.setItem("fullname", fullname);
  localStorage.setItem("email", email);
  localStorage.setItem("password", password);
  localStorage.setItem("address", address);
  localStorage.setItem("phone", phone);
  localStorage.setItem("birthday", birthday);
  localStorage.setItem("gender", gender);

  // Thông báo đã lưu
  alert("Hồ sơ của bạn đã được cập nhật!");     
  closeProfile();
}

// Tự động điền thông tin vào form nếu có dữ liệu trong localStorage
window.onload = function() {
  document.getElementById("fullname").value = localStorage.getItem("fullname") || "";
  document.getElementById("email").value = localStorage.getItem("email") || "";
  document.getElementById("password").value = localStorage.getItem("password") || "";
  document.getElementById("address").value = localStorage.getItem("address") || "";
  document.getElementById("phone").value = localStorage.getItem("phone") || "";
  document.getElementById("birthday").value = localStorage.getItem("birthday") || "";
  document.getElementById("gender").value = localStorage.getItem("gender") || "male";
}
