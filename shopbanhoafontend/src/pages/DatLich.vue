<template>
    <div class="container py-5">
        <h2 class="fw-bold text-primary text-center">🗓️ Đặt lịch ngay</h2>
        <p class="fw-bold text-primary text-center">Hãy liên hệ ngay với chúng tôi để được tư vấn sớm nhất về các mẫu
            tóc hot nhất hiện nay!</p>
        <div id="form-booking" class="container mt-4" style="width: 45%;">
            <div class="border p-4 rounded shadow-sm">
                <form action="" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate>
                    <input type="hidden" id="salon_active" name="salon_active" value="">
                    <input type="hidden" id="stylist_active" name="stylist_active" value="">

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="id_list" class="form-label"><i class="fas fa-map-marker-alt"></i> 📍Tỉnh/Thành Phố</label>
                            <select id="id_list" name="id_list" class="form-select">
                                <option value="0">Chọn Tỉnh/Thành Phố</option>
                                <option value="4">TP. Hồ Chí Minh</option>
                                <option value="7">TP. Hà Nội</option>
                                <option value="8">Cần Thơ</option>
                                <option value="9">Đà Nẵng</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="id_cat" class="form-label"><i class="fas fa-location-arrow"></i> 📍 Quận/Huyện</label>
                            <select id="id_cat" name="id_cat" class="form-select">
                                <option value="0">Chọn Quận/Huyện</option>
                            </select>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label"><i class="fas fa-store"></i> 🏢 Chọn Salon</label>
                        <div class="alert alert-warning">Chọn <b>Tỉnh/Thành phố</b> để hiển thị những salon của chúng
                            tôi!
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="service" class="form-label"><i class="fas fa-layer-group"></i> 🛠️ Dịch vụ</label>
                            <select id="service" name="service" class="form-select">
                                <option value="0">Chọn dịch vụ</option>
                                <option value="22">UỐN/DUỖI/NHUỘM</option>
                                <option value="26">NỐI TÓC</option>
                                <option value="25">PHỤC HỒI</option>
                                <option value="24">CẮT TÓC</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="stylist" class="form-label"><i class="fas fa-cut"></i> ✂️ Kỹ thuật viên</label>
                            <select id="stylist" name="stylist" class="form-select">
                                <option value="0">Chọn salon trước</option>
                            </select>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="booking_time" class="form-label"><i class="fas fa-calendar-alt"></i> 📆 Chọn ngày giờ</label>
                        <input type="datetime-local" id="booking_time" name="dataBooking[notes]" class="form-control"
                            min="2025-03-21T01:57" required>
                    </div>

                    <div class="mb-3">
                        <label for="fullname" class="form-label"><i class="fas fa-user"></i> 👤 Họ và Tên</label>
                        <input type="text" id="fullname" name="dataBooking[fullname]" class="form-control"
                            placeholder="Họ tên" required>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label"><i class="fas fa-phone"></i> 📞 Số điện thoại</label>
                        <input type="text" id="phone" name="dataBooking[phone]" class="form-control"
                            placeholder="Số điện thoại" required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Gửi đặt lịch</button>
                    <input type="hidden" name="recaptcha_response_booking" id="recaptchaResponseBooking">
                </form>
            </div>
        </div>
    </div>
</template>