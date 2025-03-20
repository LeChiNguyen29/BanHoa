<script setup>

</script>

<!-- <template>
    <div class="container py-5">
      <h2 class="fw-bold mb-4">Dịch vụ</h2>
      <div class="row">
        <div 
          v-for="service in services" 
          :key="service.id" 
          class="col-md-4 mb-4 service-card"
        >
          <div class="card shadow-lg border-0">
            <img :src="service.image" class="card-img-top" alt="Service Image">
            <div class="card-body">
              <h5 class="card-title">{{ service.name }}</h5>
              <p class="text-muted">Giá từ: {{ service.price }}vnđ</p>
              <div class="d-flex align-items-center">
                <span class="me-2">{{ service.rating }}</span>
                <i class="bi bi-star-fill text-warning"></i>
                <span class="ms-2">Đánh giá</span>
              </div>
              <button class="btn btn-warning mt-3 w-100">Đặt lịch ngay</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import serviceApi from '@/api/serviceApi';
  
  export default {
    data() {
      return {
        services: []
      };
    },
    async mounted() {
      try {
        this.services = await serviceApi.getServices();
      } catch (error) {
        console.error("Lỗi tải dữ liệu:", error);
      }
    }
  };
  </script>
  
  <style>
  .service-card {
    transition: transform 0.3s;
  }
  .service-card:hover {
    transform: translateY(-5px);
  }
  </style>
   -->

   <template>
    <div class="container py-5">
      <h2 class="fw-bold mb-4">Dịch vụ</h2>
      <div class="row">
        <div v-for="service in services" :key="service.id" class="col-md-4 mb-4 service-card">
          <div class="card shadow-lg border-0">
            <img :src="service.image" class="card-img-top service-img" alt="Service Image"
              @click="goToDetail(service.id)">
            <div class="card-body">
              <h5 class="card-title">{{ service.name }}</h5>
              <p class="text-muted">Giá từ: {{ service.price.toLocaleString() }} vnđ</p>
              <div class="d-flex align-items-center">
                <span class="me-2">{{ service.rating }}</span>
                <i class="bi bi-star-fill text-warning"></i>
                <span class="ms-2">Đánh giá</span>
              </div>
              <RouterLink class="btn btn-warning mt-3 w-100 animate-button" to="/dat-lich">Đặt lịch ngay</RouterLink>
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
        services: [
          { id: 1, name: "Cắt tóc nam", price: 100000, rating: 4.8, image: "https://via.placeholder.com/300x200?text=Cắt+Tóc+Nam" },
          { id: 2, name: "Cạo râu", price: 50000, rating: 4.5, image: "https://via.placeholder.com/300x200?text=Cạo+Râu" },
          { id: 3, name: "Uốn tóc", price: 250000, rating: 4.7, image: "https://via.placeholder.com/300x200?text=Uốn+Tóc" }
        ]
      };
    },
    methods: {
      goToDetail(serviceId) {
        this.$router.push(`/dich-vu/${serviceId}`);
      }
    }
  };
  </script>
  
  <style>
  .service-card {
    transition: transform 0.3s;
  }
  .service-card:hover {
    transform: translateY(-5px);
  }
  
  /* Hiệu ứng click vào ảnh */
  .service-img {
    cursor: pointer;
    transition: opacity 0.3s;
  }
  .service-img:hover {
    opacity: 0.8;
  }
  
  /* Button đặt lịch có hiệu ứng */
  .animate-button {
    transition: transform 0.3s ease;
  }
  .animate-button:hover {
    transform: scale(1.05);
  }
  </style>
  