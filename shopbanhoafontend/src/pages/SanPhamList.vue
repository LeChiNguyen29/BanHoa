<template>
    <div class="container py-5">
      <h2 class="fw-bold text-primary text-center">🛍 Sản phẩm chăm sóc tóc</h2>
  
      <div class="row mt-4">
        <div v-for="product in products" :key="product.id" class="col-md-4 mb-4">
          <div class="card shadow-lg border-0">
            <img :src="product.image" class="card-img-top product-img" @click="goToDetail(product.id)">
            <div class="card-body">
              <h5 class="card-title">{{ product.name }}</h5>
              <p class="text-muted">💰 {{ product.price.toLocaleString() }} vnđ</p>
              <button class="btn btn-warning w-100" @click="goToDetail(product.id)">Xem chi tiết</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        products: [
          { id: 1, name: "Sáp vuốt tóc nam", price: 150000, image: "https://via.placeholder.com/300x200?text=Sáp+vuốt+tóc" },
          { id: 2, name: "Dầu gội phục hồi", price: 180000, image: "https://via.placeholder.com/300x200?text=Dầu+gội" },
          { id: 3, name: "Máy sấy tóc cao cấp", price: 350000, image: "https://via.placeholder.com/300x200?text=Máy+sấy+tóc" },
          { id: 4, name: "Kéo cắt tóc chuyên nghiệp", price: 220000, image: "https://via.placeholder.com/300x200?text=Kéo+cắt+tóc" },
          { id: 5, name: "Dưỡng tóc mềm mượt", price: 200000, image: "https://via.placeholder.com/300x200?text=Dưỡng+tóc" }
        ]
      };
    },
    methods: {
      goToDetail(id) {
        this.$router.push(`/san-pham/${id}`);
      }
    }
  };
  </script>
  
  <style>
  .product-img {
    cursor: pointer;
    transition: transform 0.3s ease;
  }
  .product-img:hover {
    transform: scale(1.05);
  }
  </style>
  