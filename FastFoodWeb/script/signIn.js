function validateForm() {
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const emailError = document.getElementById('email-error');
    const passwordError = document.getElementById('password-error');

    // Xóa thông báo lỗi trước đó
    emailError.textContent = "";
    passwordError.textContent = "";

    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    // Kiểm tra email
    if (!email.match(emailPattern)) {
        emailError.textContent = "Vui lòng nhập địa chỉ email hợp lệ!";
        return false;
    }

    // Kiểm tra mật khẩu
    if (password.length < 6) {
        passwordError.textContent = "Mật khẩu phải có ít nhất 6 ký tự!";
        return false;
    }

    // Điều hướng tùy thuộc vào email
    if (email.includes("hieuly98252005@gmail.com")&&password.includes("FunFastFresh")) {
        window.location.href = "homeAD.html"; // Điều hướng đến trang đăng nhập của quản trị viên
    } else {
        window.location.href = "home.html"; // Điều hướng đến trang chính cho người dùng thông thường
    }

    return true;
}
function togglePassword() {
    const passwordInput = document.getElementById("password");
    const eyeIcon = document.getElementById("eye-icon");

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        eyeIcon.src = "hinh/eyeOpen.png"; // Đổi icon mắt

        if (passwordInput.value === "") {
            passwordInput.value = ""; // Khi chưa nhập gì, ô nhập trống
        }
    } else {
        passwordInput.type = "password";
        eyeIcon.src = "hinh/eyeClosed.png"; // Đổi icon mắt

        if (passwordInput.value === "") {
            passwordInput.placeholder = ""; // Khi chưa nhập gì, ô nhập trống
        }
    }
}