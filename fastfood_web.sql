
-- Tạo database
DROP DATABASE IF EXISTS fastfood_web;
CREATE DATABASE fastfood_web CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE fastfood_web;

-- Bảng người dùng
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    role ENUM('customer', 'admin') DEFAULT 'customer',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Bảng loại món ăn
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Bảng sản phẩm
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    category_id INT,
    available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Bảng giỏ hàng
CREATE TABLE cart_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Bảng đơn hàng
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    status ENUM('pending', 'paid', 'shipped', 'cancelled') DEFAULT 'pending',
    total_price DECIMAL(10, 2) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Bảng chi tiết đơn hàng
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Bảng thanh toán
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    method VARCHAR(50),
    status ENUM('success', 'failed') DEFAULT 'success',
    paid_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- Dữ liệu mẫu cho users
INSERT INTO users (name, email, password_hash, phone, address, role)
VALUES
  ('Nguyen Van A', 'a@example.com', 'hashedpassword1', '0123456789', '123 ABC Street', 'customer'),
  ('Admin User', 'admin@example.com', 'hashedpassword2', '0987654321', '456 DEF Street', 'admin');

-- Dữ liệu mẫu cho categories
INSERT INTO categories (name)
VALUES
  ('Pizza'),
  ('Burger'),
  ('Drinks'),
  ('Snacks');

-- Dữ liệu mẫu cho products
INSERT INTO products (name, description, price, image_url, category_id, available)
VALUES
  ('Pepperoni Pizza', 'Spicy pepperoni with cheese', 120000, 'images/pepperoni.jpg', 1, TRUE),
  ('Cheeseburger', 'Beef burger with cheese', 80000, 'images/cheeseburger.jpg', 2, TRUE),
  ('Coca Cola', '330ml cold drink', 15000, 'images/cocacola.jpg', 3, TRUE),
  ('French Fries', 'Crispy fries with ketchup', 30000, 'images/fries.jpg', 4, TRUE);

-- Dữ liệu mẫu cho cart_items
INSERT INTO cart_items (user_id, product_id, quantity)
VALUES
  (1, 1, 1),
  (1, 3, 2);

-- Dữ liệu mẫu cho orders
INSERT INTO orders (user_id, status, total_price)
VALUES
  (1, 'paid', 150000);

-- Dữ liệu mẫu cho order_items
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
  (1, 1, 1, 120000),
  (1, 3, 2, 15000);

-- Dữ liệu mẫu cho payments
INSERT INTO payments (order_id, method, status)
VALUES
  (1, 'cash', 'success');
