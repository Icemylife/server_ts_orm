-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.17 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных sandbox_db
CREATE DATABASE IF NOT EXISTS `sandbox_db` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sandbox_db`;

-- Дамп структуры для таблица sandbox_db.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `iso` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=986 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы sandbox_db.currencies: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` (`id`, `name`, `iso`) VALUES
	(643, 'Russian Ruble', 'RUB'),
	(840, 'US Dollar', 'USD'),
	(985, 'Zloty', 'PLN');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;

-- Дамп структуры для таблица sandbox_db.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `name` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_products_currencies` (`currency_id`),
  CONSTRAINT `FK_products_currencies` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы sandbox_db.products: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `currency_id`, `price`, `name`, `type`) VALUES
	(1, 840, 20.00, 'product 1', 'stone'),
	(2, 840, 10.00, 'product 2', 'notstone'),
	(3, 643, 50.00, 'product 3', 'stone'),
	(4, 840, 50.00, 'product 4', 'stone'),
	(5, 643, 50.00, 'product 5', 'notstone'),
	(6, 985, 50.00, 'product 6', 'stone'),
	(7, 643, 50.00, 'product 7', 'stone'),
	(8, 840, 50.00, 'product 8', 'notstone'),
	(9, 985, 50.00, 'product 9', 'stone'),
	(10, 643, 50.00, 'product 10', 'notstone'),
	(11, 643, 50.00, 'product 11', 'notstone'),
	(12, 985, 50.00, 'product 12', 'stone'),
	(13, 985, 50.00, 'product 13', 'notstone'),
	(14, 643, 50.00, 'product 14', 'notstone'),
	(15, 840, 50.00, 'product 15', 'stone'),
	(16, 840, 50.00, 'product 16', 'notstone'),
	(17, 840, 50.00, 'product 17', 'stone');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
