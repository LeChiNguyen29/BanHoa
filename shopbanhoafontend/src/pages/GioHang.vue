<template>
    <div class="container py-5">
      <h2 class="fw-bold text-primary">🛒 Giỏ hàng của bạn</h2>
      <p v-if="cart.length === 0" class="text-muted">Giỏ hàng trống.</p>
      
      <table v-if="cart.length > 0" class="table table-bordered mt-3">
        <thead class="table-dark">
          <tr>
            <th>Hình ảnh</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Thành tiền</th>
            <th>Hành động</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item, index) in cart" :key="item.id">
            <td><img :src="item.image" class="img-thumbnail" width="80"></td>
            <td>{{ item.name }}</td>
            <td>{{ item.price.toLocaleString() }} vnđ</td>
            <td>
              <button class="btn btn-outline-danger btn-sm" @click="decreaseQuantity(index)">➖</button>
              <span class="mx-2">{{ item.quantity }}</span>
              <button class="btn btn-outline-success btn-sm" @click="increaseQuantity(index)">➕</button>
            </td>
            <td>{{ (item.price * item.quantity).toLocaleString() }} vnđ</td>
            <td>
              <button class="btn btn-danger btn-sm" @click="removeFromCart(index)">🗑 Xóa</button>
            </td>
          </tr>
        </tbody>
      </table>
      
      <h4 v-if="cart.length > 0" class="text-success mt-3">
        Tổng tiền: <strong>{{ totalAmount.toLocaleString() }} vnđ</strong>
      </h4>
      
      <button v-if="cart.length > 0" class="btn btn-success w-100 mt-3" @click="checkout">
        ✅ Thanh toán ngay
      </button>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        cart: JSON.parse(localStorage.getItem("cart")) || []
      };
    },
    computed: {
      totalAmount() {
        return this.cart.reduce((sum, item) => sum + item.price * item.quantity, 0);
      }
    },
    created() {
      if (this.cart.length === 0) {
        this.generateFakeCart();
      }
    },
    methods: {
      generateFakeCart() {
        this.cart = [
          { id: "sp001", name: "Giày Nike Air Max", price: 1200000, quantity: 2, image: "https://via.placeholder.com/80" },
          { id: "sp002", name: "Áo Hoodie Adidas", price: 750000, quantity: 1, image: "https://via.placeholder.com/80" },
          { id: "sp003", name: "Balo thể thao Puma", price: 500000, quantity: 3, image: "https://via.placeholder.com/80" }
        ];
        this.saveCart();
      },
      increaseQuantity(index) {
        this.cart[index].quantity++;
        this.saveCart();
      },
      decreaseQuantity(index) {
        if (this.cart[index].quantity > 1) {
          this.cart[index].quantity--;
          this.saveCart();
        }
      },
      removeFromCart(index) {
        if (confirm("Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?")) {
          this.cart.splice(index, 1);
          this.saveCart();
        }
      },
      checkout() {
        alert("🚀 Chuyển đến trang thanh toán!");
        this.$router.push("/thanh-toan");
      },
      saveCart() {
        localStorage.setItem("cart", JSON.stringify(this.cart));
      }
    }
  };
  </script>
  