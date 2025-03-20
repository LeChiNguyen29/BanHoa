import DatLich from '@/pages/DatLich.vue'
import DichVuDetail from '@/pages/DichVuDetail.vue'
import DichVuPage from '@/pages/DichVuPage.vue'
import GioHang from '@/pages/GioHang.vue'
import SanPhamDetail from '@/pages/SanPhamDetail.vue'
import SanPhamList from '@/pages/SanPhamList.vue'
import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    // {
    //   path: '/',
    //   name: 'home',
    //   // component: HomeView,
    // },
    {
      path: '/dich-vu/:id',
      name: 'dich-vu-detail',
      component: DichVuDetail,
    },
    {
      path: '/dich-vu',
      name: 'dich-vu-page',
      component: DichVuPage,
    },
    {
      path: '/san-pham/:id',
      name: 'san-pham-detail',
      component: SanPhamDetail,
    },
    {
      path: '/san-pham',
      name: 'san-pham-page',
      component: SanPhamList,
    },
    {
      path: '/gio-hang',
      name: 'gio-hang',
      component: GioHang,
    },
    {
      path: '/dat-lich',
      name: 'dat-lich',
      component: DatLich,
    },
    // {
    //   path: '/about',
    //   name: 'about',
    // },
  ],
})

export default router
