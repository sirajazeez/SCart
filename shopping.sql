-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for shopping
CREATE DATABASE IF NOT EXISTS `shopping` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `shopping`;

-- Dumping structure for table shopping.carts
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `created_date` date DEFAULT curdate(),
  `updated_date` date DEFAULT curdate(),
  `status` tinyint(2) DEFAULT 0 COMMENT '0-cart,1-checkout,2-paid,3-complete,4-Abondened',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=latin1;

-- Dumping data for table shopping.carts: ~2 rows (approximately)
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` (`id`, `user_id`, `product_id`, `product_price`, `product_quantity`, `created_date`, `updated_date`, `status`) VALUES
	(196, 1, 1, 13000, 1, '2021-07-01', '2021-07-01', 0),
	(198, 36, 1, 13000, 6, '2021-07-01', '2021-07-01', 0);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;

-- Dumping structure for table shopping.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT curdate(),
  `updated_date` date DEFAULT curdate(),
  `status` tinyint(4) DEFAULT 0 COMMENT '0-active,1-deactive',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table shopping.category: ~6 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `category_name`, `created_date`, `updated_date`, `status`) VALUES
	(1, 'electronics', '2021-01-01', '2021-01-01', 0),
	(2, 'Home Appliances', '2021-01-01', '2021-01-01', 0),
	(3, 'Furniture', '2021-01-01', '2021-01-01', 0),
	(4, 'Fashion', '2021-01-01', '2021-01-01', 0),
	(7, 'Food', '2021-06-18', '2021-06-18', 0),
	(13, 'Window', '2021-06-30', '2021-06-30', 0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for procedure shopping.get_maximum_price
DELIMITER //
CREATE PROCEDURE `get_maximum_price`(OUT highestprice INT)
BEGIN  
    SELECT MAX(product_price) INTO highestprice FROM products;     
END//
DELIMITER ;

-- Dumping structure for procedure shopping.get_us
DELIMITER //
CREATE PROCEDURE `get_us`(IN var1 INT)
BEGIN  
    SELECT * FROM users LIMIT var1;     
END//
DELIMITER ;

-- Dumping structure for procedure shopping.get_users
DELIMITER //
CREATE PROCEDURE `get_users`()
BEGIN  
    SELECT * FROM users;  
    SELECT COUNT(*) AS Total_User FROM users;    
END//
DELIMITER ;

-- Dumping structure for procedure shopping.get_users_count
DELIMITER //
CREATE PROCEDURE `get_users_count`(IN var1 INT)
BEGIN
	SELECT COUNT(*) FROM users LIMIT var1;
END//
DELIMITER ;

-- Dumping structure for procedure shopping.get_user_count
DELIMITER //
CREATE PROCEDURE `get_user_count`(IN var1 INT)
BEGIN
	SELECT COUNT(*) FROM users LIMIT var1;
END//
DELIMITER ;

-- Dumping structure for table shopping.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `created_at` date DEFAULT curdate(),
  `updated_at` date DEFAULT curdate(),
  `status` tinyint(2) DEFAULT 0 COMMENT '0-ordered,1-dispatched,3-shipped,4-outfordelivery,5-delivered,6-return request, 7-return request accepted,8-awiting collection,9-item collected,10-awaiting refund,11-refund issued',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

-- Dumping data for table shopping.orders: ~3 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `user_id`, `product_id`, `product_quantity`, `product_price`, `created_at`, `updated_at`, `status`) VALUES
	(69, 1, 1, 1, 13000, '2021-07-02', '2021-07-02', 0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for view shopping.prod
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `prod` (
	`id` INT(11) NOT NULL,
	`product_name` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for table shopping.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory_id` int(11) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_images` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT curdate(),
  `updated_date` date DEFAULT curdate(),
  `status` tinyint(2) DEFAULT 0 COMMENT '0-active,1-deactive',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_products_subcategory` (`subcategory_id`),
  CONSTRAINT `FK_products_subcategory` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table shopping.products: ~8 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `subcategory_id`, `product_name`, `product_description`, `product_price`, `product_quantity`, `product_images`, `created_date`, `updated_date`, `status`) VALUES
	(1, 1, 'Samsung', 'Good Product', 13000, 10, NULL, NULL, NULL, NULL),
	(2, 2, 'HP', 'Nice Product', 589, 102, NULL, NULL, NULL, NULL),
	(3, 1, 'MI', 'Good Product', 18000, 41, NULL, NULL, NULL, NULL),
	(4, 5, 'Samsung', 'Good', 5000, 12, NULL, NULL, NULL, NULL),
	(5, 8, 'Yui', 'Nice', 8000, 5, NULL, NULL, NULL, NULL),
	(6, 10, 'LP', 'Best shirts', 1200, 85, NULL, NULL, NULL, NULL),
	(7, 11, 'Wood Land', 'Perfect shoe for men', 3156, 254, NULL, NULL, NULL, NULL),
	(8, 1, 'Redmi', 'Good', 25000, 4, '', '2021-06-21', '2021-06-21', 0),
	(9, 1, 'Huwai', 'Best Mobile', 58000, 2, NULL, '2021-07-01', '2021-07-01', 0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table shopping.subcategory
CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT curdate(),
  `updated_date` date DEFAULT curdate(),
  `status` tinyint(2) DEFAULT 0 COMMENT '0-active,1-deactive',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_subcategory_category` (`category_id`),
  CONSTRAINT `FK_subcategory_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table shopping.subcategory: ~14 rows (approximately)
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` (`id`, `category_id`, `name`, `created_date`, `updated_date`, `status`) VALUES
	(1, 1, 'Mobile', '2021-01-01', '2021-01-01', 0),
	(2, 1, 'Laptop', '2021-01-01', '2021-01-01', 0),
	(3, 1, 'Earphone', '2021-01-01', '2021-01-01', 0),
	(4, 1, 'Powerbank', '2021-01-01', '2021-01-01', 0),
	(5, 2, 'Mixers', '2021-01-01', '2021-01-01', 0),
	(6, 2, 'Toasters', '2021-01-01', '2021-01-01', 0),
	(7, 3, 'Table', '2021-01-01', '2021-01-01', 0),
	(8, 3, 'Sofa', '2021-01-01', '2021-01-01', 0),
	(9, 3, 'Chair', '2021-01-01', '2021-01-01', 0),
	(10, 4, 'Shirts', '2021-01-01', '2021-01-01', 0),
	(11, 4, 'Shoe', '2021-01-01', '2021-01-01', 0),
	(12, 4, 'Purse', '2021-06-21', '2021-06-21', 0);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;

-- Dumping structure for table shopping.transaction
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `order_type` varchar(50) DEFAULT NULL,
  `order_mode` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL COMMENT '0-new,1-cancelled,2-failed,3-pending,4-rejected,5-declined',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_transaction_orders` (`order_id`),
  CONSTRAINT `FK_transaction_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table shopping.transaction: ~0 rows (approximately)
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;

-- Dumping structure for table shopping.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_mobile` varchar(255) NOT NULL,
  `user_address` text NOT NULL,
  `user_pin` int(11) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT curdate(),
  `updated_date` datetime NOT NULL DEFAULT curdate(),
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `user_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-user,1-admin',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Dumping data for table shopping.users: ~5 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `user_name`, `user_email`, `user_mobile`, `user_address`, `user_pin`, `user_password`, `created_date`, `updated_date`, `status`, `user_type`) VALUES
	(1, 'siraj', 'siruned906@gmail.com', '9496260648', 'Bachalil House', 670630, '1234', '2021-12-12 00:00:00', '2021-12-12 00:00:00', 0, 0),
	(9, 'Jerin', 'craffitty@gmail.com', '9898989898', 'Mandalam', 670631, '1234', '2021-06-17 00:00:00', '2021-06-17 00:00:00', 0, 0),
	(10, 'admin', 'admin@gmail.com', '9865326598', 'Admin', 626262, '12345', '2021-06-18 16:58:27', '2021-06-18 16:58:28', 0, 1),
	(31, 'Dhanesh', 'dhanesh@gmail.com', '8798596635', 'Dhan', 685254, '1234', '2021-06-24 00:00:00', '2021-06-24 00:00:00', 0, 0),
	(32, 'John', 'john@gmail.com', '123456789', 'Hjiuuuinh', 88923, '1234', '2021-06-24 00:00:00', '2021-06-24 00:00:00', 0, 0),
	(36, 'Mark', 'mark@gmail.com', '9496896587', 'Marks Home', 998659, '123456', '2021-07-01 00:00:00', '2021-07-01 00:00:00', 0, 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for view shopping.prod
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `prod`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `prod` AS SELECT id,product_name FROM products WHERE subcategory_id = 1 ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
