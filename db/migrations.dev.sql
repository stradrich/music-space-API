CREATE DATABASE music_space_dev;
USE music_space_dev;

-- Create users Table
CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  is_verified BOOLEAN DEFAULT false,
  role ENUM('admin', 'provider', 'customer') DEFAULT 'customer',
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create space_listings Table (size - studio/chamber hall/concert hall, sound proof or no sound proof)
CREATE TABLE space_listings (
  listing_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  price_per_hour DECIMAL(10, 2) NOT NULL,
  address_link VARCHAR(255),
  pictures VARCHAR(255),
  availability VARCHAR(255) NOT NULL,
  description TEXT,
  capacity INT NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE timeslot (
  timeslot_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  timeslot_datetime DATETIME,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  UNIQUE (user_id, timeslot_datetime)
);

-- Create bookings Table
CREATE TABLE bookings (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  listing_id INT NOT NULL,
  status ENUM('pending', 'confirmed', 'cancelled', 'declined') DEFAULT 'pending',
  reminder ENUM('24_hours', '12_hours', '6_hours', '3_hours', '45_minutes'),
  check_in DATETIME,
  check_out DATETIME,
  required_equipments ENUM('YES', 'NO') DEFAULT 'NO',
  other_remarks TEXT,
  purpose ENUM('practice', 'teaching', 'recording', 'rehearsal', 'seminar', 'masterclasses', 'workshop'),
  first_instrument TEXT NOT NULL,
  capacity ENUM('individual', 'less than four', 'band/orchestra'),
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_listing_id` FOREIGN KEY (`listing_id`) REFERENCES `space_listings` (`listing_id`)
);


-- Create payment Table
CREATE TABLE payment (
  payment_id INT PRIMARY KEY AUTO_INCREMENT,
  booking_id INT NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  payment_method VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) 
);


-- Create reviews_rating Table
CREATE TABLE reviews_rating (
  review_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
  review_text TEXT,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

