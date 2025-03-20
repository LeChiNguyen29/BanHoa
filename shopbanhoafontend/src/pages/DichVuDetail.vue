<template>
    <div class="container py-5">
      <button class="btn btn-outline-dark mb-3 back-button" @click="$router.push('/dich-vu')">
        ⬅ Quay lại
      </button>
  
      <div v-if="service" class="row">
        <div class="col-md-6">
          <img :src="service.image" class="img-fluid rounded shadow service-img">
        </div>
  
        <div class="col-md-6">
          <h2 class="fw-bold text-primary">{{ service.name }}</h2>
          <p class="text-muted fs-5">💰 Giá: <strong>{{ service.price.toLocaleString() }} vnđ</strong></p>
          <p class="text-secondary">{{ service.description }}</p>
          <div class="d-flex align-items-center">
            <span class="fs-5 fw-bold text-warning">{{ averageRating.toFixed(1) }}</span>
            <i class="bi bi-star-fill text-warning mx-1"></i>
            <span class="ms-2">({{ service.reviews.length }} đánh giá)</span>
          </div>
          <button class="btn btn-warning mt-3 w-100 animate-button">🗓 Đặt lịch ngay</button>
        </div>
      </div>
  
      <div class="mt-5">
        <h4 class="fw-bold text-dark">📢 Đánh giá dịch vụ</h4>
  
        <!-- Form đánh giá -->
        <div class="mb-4 shadow-sm p-3 rounded bg-light">
          <input v-model="newReview.user" type="text" class="form-control mb-2" placeholder="✍ Nhập tên của bạn">
          <textarea v-model="newReview.comment" class="form-control mb-2" placeholder="💬 Viết đánh giá..." maxlength="200"></textarea>
          <select v-model="newReview.rating" class="form-select mb-2">
            <option disabled value="">⭐ Chọn số sao</option>
            <option v-for="n in 5" :key="n" :value="n">{{ n }} sao</option>
          </select>
          <button class="btn btn-primary w-100" @click="addReview">🚀 Gửi đánh giá</button>
        </div>
  
        <!-- Hiển thị thanh tiến trình đánh giá -->
        <div v-if="service.reviews.length > 0" class="progress-container mb-4">
          <div v-for="n in 5" :key="n" class="d-flex align-items-center">
            <span class="fs-5 fw-bold me-2">{{ n }}</span>
            <div class="progress flex-grow-1">
              <div class="progress-bar bg-warning" :style="{ width: getStarPercentage(n) + '%' }"></div>
            </div>
            <span class="ms-2 text-muted">{{ getStarPercentage(n).toFixed(1) }}%</span>
          </div>
        </div>
  
        <!-- Hiển thị danh sách đánh giá -->
        <div v-if="service.reviews.length > 0">
          <div v-for="review in sortedReviews" :key="review.id" class="review-item">
            <p class="fw-bold mb-1 text-primary">{{ review.user }} 
              <span class="text-muted fs-6">({{ formatDate(review.date) }})</span>
            </p>
            <p class="text-secondary fst-italic">"{{ review.comment }}"</p>
            <div>
              <i v-for="star in 5" :key="star" :class="['bi', star <= review.rating ? 'bi-star-fill text-warning' : 'bi-star']"></i>
            </div>
          </div>
        </div>
        <p v-else class="text-muted text-center">🚫 Chưa có đánh giá nào.</p>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        service: null,
        newReview: { user: '', comment: '', rating: '', date: new Date() }
      };
    },
    computed: {
      averageRating() {
        if (this.service.reviews.length === 0) return 0;
        const total = this.service.reviews.reduce((sum, r) => sum + r.rating, 0);
        return total / this.service.reviews.length;
      },
      sortedReviews() {
        return [...this.service.reviews].sort((a, b) => new Date(b.date) - new Date(a.date));
      }
    },
    methods: {
      addReview() {
        if (this.newReview.user && this.newReview.comment && this.newReview.rating) {
          this.service.reviews.push({ 
            id: this.service.reviews.length + 1, 
            user: this.newReview.user, 
            comment: this.newReview.comment, 
            rating: this.newReview.rating, 
            date: new Date()
          });
          this.newReview = { user: '', comment: '', rating: '', date: new Date() };
        } else {
          alert("⚠ Vui lòng nhập đầy đủ thông tin!");
        }
      },
      formatDate(date) {
        return new Date(date).toLocaleDateString('vi-VN');
      },
      getStarPercentage(star) {
        const count = this.service.reviews.filter(r => r.rating === star).length;
        return (count / this.service.reviews.length) * 100;
      }
    },
    created() {
      this.service = {
        id: 1,
        name: "Cắt tóc nam",
        price: 100000,
        image: "https://via.placeholder.com/300x200?text=Cắt+Tóc+Nam",
        description: "Dịch vụ cắt tóc chuyên nghiệp cho nam giới.",
        reviews: []
      };
    }
  };
  </script>
  
  <style>
  /* Hiệu ứng nút bấm */
  .back-button {
    transition: background-color 0.3s, transform 0.3s;
  }
  .back-button:hover {
    background-color: #444;
    color: white;
    transform: scale(1.05);
  }
  
  /* Hiệu ứng ảnh dịch vụ */
  .service-img {
    cursor: pointer;
    transition: transform 0.3s ease, opacity 0.3s;
  }
  .service-img:hover {
    transform: scale(1.05);
    opacity: 0.9;
  }
  
  /* Hiệu ứng nút đặt lịch */
  .animate-button {
    transition: transform 0.3s ease, box-shadow 0.3s;
  }
  .animate-button:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  }
  
  /* Hiệu ứng thanh tiến trình */
  .progress-container .progress {
    height: 12px;
    border-radius: 6px;
  }
  
  /* Định dạng đánh giá */
  .review-item {
    padding: 10px;
    border-bottom: 1px solid #ddd;
  }
  .review-item:last-child {
    border-bottom: none;
  }
  </style>
  