<template>
    <div class="container py-5">
      <button class="btn btn-outline-dark mb-3" @click="$router.push('/san-pham')">
        ⬅ Quay lại
      </button>
  
      <div v-if="product" class="row">
        <div class="col-md-6">
          <img :src="product.image" class="img-fluid rounded shadow product-img">
        </div>
  
        <div class="col-md-6">
          <h2 class="fw-bold text-primary">{{ product.name }}</h2>
          <p class="text-muted fs-5">💰 Giá: <strong>{{ product.price.toLocaleString() }} vnđ</strong></p>
          <p class="text-secondary">{{ product.description }}</p>
  
          <!-- Điều chỉnh số lượng sản phẩm -->
          <div class="d-flex align-items-center my-3">
            <button class="btn btn-outline-danger" @click="decreaseQuantity">➖</button>
            <span class="mx-3 fs-4">{{ quantity }}</span>
            <button class="btn btn-outline-success" @click="increaseQuantity">➕</button>
          </div>
  
          <!-- Nút thêm vào giỏ hàng -->
          <button class="btn btn-warning w-100 my-2" @click="addToCart">
            🛒 Thêm vào giỏ hàng
          </button>
  
          <!-- Nút mua ngay -->
          <button class="btn btn-success w-100" @click="buyNow">
            ⚡ Mua ngay
          </button>
  
          <!-- Hiển thị số lượng sản phẩm trong giỏ -->
          <p v-if="cart.length > 0" class="mt-3 text-success">
            🛍 Bạn có {{ cart.length }} sản phẩm trong giỏ hàng.
          </p>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        product: null,
        quantity: 1,
        cart: [],
        products: [
          { id: 1, name: "Sáp vuốt tóc nam", price: 150000, image: "https://via.placeholder.com/300x200?text=Sáp+vuốt+tóc", description: "Giữ nếp tóc mạnh mẽ, không bết dính." },
          { id: 2, name: "Dầu gội phục hồi", price: 180000, image: "https://via.placeholder.com/300x200?text=Dầu+gội", description: "Giúp tóc khỏe mạnh, bóng mượt." },
          { id: 3, name: "Máy sấy tóc cao cấp", price: 350000, image: "https://via.placeholder.com/300x200?text=Máy+sấy+tóc", description: "Máy sấy tóc công suất lớn, giữ ẩm tốt." },
          { id: 4, name: "Kéo cắt tóc chuyên nghiệp", price: 220000, image: "https://via.placeholder.com/300x200?text=Kéo+cắt+tóc", description: "Lưỡi kéo sắc bén, dễ dàng tạo kiểu." },
          { id: 5, name: "Dưỡng tóc mềm mượt", price: 200000, image: "https://via.placeholder.com/300x200?text=Dưỡng+tóc", description: "Tăng độ ẩm, giúp tóc luôn óng mượt." }
        ]
      };
    },
    created() {
      const productId = this.$route.params.id;
      this.product = this.products.find(p => p.id == productId);
    },
    methods: {
      increaseQuantity() {
        this.quantity++;
      },
      decreaseQuantity() {
        if (this.quantity > 1) this.quantity--;
      },
      addToCart() {
        const cartItem = { ...this.product, quantity: this.quantity };
        this.cart.push(cartItem);
        alert("🎉 Đã thêm vào giỏ hàng!");
      },
      buyNow() {
        alert("✅ Chuyển đến trang thanh toán!");
        this.$router.push(`/thanh-toan?product=${this.product.id}&quantity=${this.quantity}`);
      }
    }
  };
  </script>
  