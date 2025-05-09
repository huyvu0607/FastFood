<?php
// Giả sử đây là phần xử lý yêu cầu gửi lại mật khẩu
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];

    // Kiểm tra định dạng email (giả lập)
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $message = "Liên kết đặt lại mật khẩu đã được gửi tới email: $email";
    } else {
        $message = "Email không hợp lệ. Vui lòng thử lại.";
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đặt Lại Mật Khẩu</title>
  <link rel="stylesheet" href="CSS/FP.css">
</head>
<body>
  <div class="fp-container">
    <h1>Đặt Lại Mật Khẩu</h1>

    <?php if (!empty($message)): ?>
      <p><?php echo $message; ?></p>
    <?php endif; ?>

    <div class="back-link">
      🔙 <a href="logIn.html">Quay lại đăng nhập</a>
    </div>
  </div>
</body>
</html>
