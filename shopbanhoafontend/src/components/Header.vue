<script setup>
import { RouterLink } from 'vue-router';
import cartIcon from '@/assets/gio_hang.png';
import { ref } from 'vue';
const cartCount = ref(3);
</script>

<template>
    <nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top shadow-sm">
        <div class="container d-flex justify-content-between">

            <RouterLink class="navbar-brand fw-bold text-danger" to="/">Salon Tóc</RouterLink>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto d-flex align-items-center">
                    <li class="nav-item">
                        <RouterLink class="nav-link px-3 text-uppercase fw-bold" to="/he-thong">Hệ Thống Salon</RouterLink>
                    </li>
                    <li class="nav-item">
                        <RouterLink class="nav-link px-3 text-uppercase fw-bold" to="/dich-vu">Dịch Vụ</RouterLink>
                    </li>
                    <li class="nav-item">
                        <RouterLink class="nav-link px-3 text-uppercase fw-bold" to="/san-pham">Sản Phẩm</RouterLink>
                    </li>
                    <li class="nav-item">
                        <RouterLink class="nav-link px-3 text-uppercase fw-bold" to="/bo-sieu-tap">Bộ Siêu Tập</RouterLink>
                    </li>
                </ul>
            </div>



            <RouterLink class="nav-link px-3" style="margin-right: 15px;" to="/gio-hang">
                <div class="cart-container">
                    <img :src="cartIcon" width="30" height="30">
                    <span v-if="cartCount > 0" class="cart-badge">{{ cartCount }}</span>
                </div>

            </RouterLink>

            <RouterLink to="/dat-lich" class="btn btn-outline-danger">Đặt Lịch</RouterLink>
        </div>
    </nav>
</template>

<style scoped>
    .navbar-nav .nav-link {
        transition: color 0.3s ease-in-out;
    }

    .navbar-nav .nav-link:hover {
        color: rgb(239, 86, 86) !important;
    }

    .navbar-nav .nav-link.active {
        color: #0d6efd !important;
    }

    .navbar-nav {
        margin: auto;
    }

    .cart-container {
        position: relative;
        display: inline-block;
    }

    .cart-badge {
        position: absolute;
        top: -5px;
        right: -5px;
        background: rgb(0, 0, 0);
        color: white;
        font-size: 8px;
        font-weight: bold;
        border-radius: 55%;
        padding: 3px 6px;
        min-width: 20px;
        text-align: center;
        line-height: 1;
    }
</style>
