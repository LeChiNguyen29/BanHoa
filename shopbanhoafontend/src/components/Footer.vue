<template>
    <footer class="bg-dark text-light py-4 mt-5">
        <div class="container">
            <div class="row">

                <div class="col-md-4">
                    <h5 class="fw-bold">Salon Tóc</h5>
                    <p>Địa chỉ: 123 Đường ABC, Quận 1, TP.HCM</p>
                    <p>Email: contact@salontoc.com</p>
                    <p>Điện thoại: 0123 456 789</p>
                </div>

                <div class="col-md-4 text-center">
                    <h5 class="fw-bold">Kết nối với chúng tôi</h5>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="#" class="text-light fs-4"><i class="fab fa-facebook">Hehe</i></a>
                        <a href="#" class="text-light fs-4"><i class="fab fa-instagram">Hehe</i></a>
                        <a href="#" class="text-light fs-4"><i class="fab fa-youtube">Hehe</i></a>
                    </div>
                </div>

                <div class="col-md-4 text-end">
                    <h5 class="fw-bold">Thông tin</h5>
                    <ul class="list-unstyled">
                        <li><RouterLink to="/lien-he" class="text-light">Liên hệ</RouterLink></li>
                        <!-- <li><RouterLink to="/privacy-policy" class="text-light">Chính sách bảo mật</RouterLink></li>
                        <li><RouterLink to="/terms" class="text-light">Điều khoản sử dụng</RouterLink></li> -->
                    </ul>
                </div>
            </div>

            <div class="text-center mt-3">
                <p class="mb-0">© 2025 Salon Tóc. All Rights Reserved.</p>
            </div>
        </div>
    </footer>
</template>

<style scoped>
footer {
    font-size: 14px;
}

footer a {
    text-decoration: none;
}

footer a:hover {
    color: rgb(239, 86, 86) !important;
}
</style>
