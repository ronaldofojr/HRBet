-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para chinesa
CREATE DATABASE IF NOT EXISTS `chinesa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `chinesa`;

-- Copiando estrutura para tabela chinesa.affiliate_histories
CREATE TABLE IF NOT EXISTS `affiliate_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `inviter` int(10) unsigned NOT NULL,
  `commission` decimal(20,2) NOT NULL DEFAULT 0.00,
  `commission_type` varchar(191) DEFAULT NULL,
  `deposited` tinyint(4) DEFAULT 0,
  `deposited_amount` decimal(10,2) DEFAULT 0.00,
  `losses` bigint(20) DEFAULT 0,
  `losses_amount` decimal(10,2) DEFAULT 0.00,
  `commission_paid` decimal(10,2) DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `receita` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `affiliate_histories_user_id_index` (`user_id`) USING BTREE,
  KEY `affiliate_histories_inviter_index` (`inviter`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.affiliate_histories: 0 rows
/*!40000 ALTER TABLE `affiliate_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate_histories` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.affiliate_withdraws
CREATE TABLE IF NOT EXISTS `affiliate_withdraws` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `pix_key` varchar(191) DEFAULT NULL,
  `pix_type` varchar(191) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `bank_info` text DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `affiliate_withdraws_user_id_foreign` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.affiliate_withdraws: 0 rows
/*!40000 ALTER TABLE `affiliate_withdraws` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate_withdraws` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.banners
CREATE TABLE IF NOT EXISTS `banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link` varchar(191) DEFAULT NULL,
  `image` varchar(191) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'home',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.banners: 5 rows
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT IGNORE INTO `banners` (`id`, `link`, `image`, `type`, `description`, `created_at`, `updated_at`) VALUES
	(17, '#', '01J1D4EBRJG46BVR33TA43YB61.webp', 'home', '...', '2024-04-07 16:29:27', '2024-06-27 15:18:52'),
	(18, '#', '01J1D4ESJ2F50MM159PJDVCRXM.webp', 'home', '....', '2024-04-07 16:30:46', '2024-06-27 15:19:07'),
	(15, '#', '01J1D4C0S5W27FQ9N4V3YXFTHQ.png', 'carousel', NULL, '2024-04-06 01:58:25', '2024-06-27 15:17:36'),
	(8, '#', '01J1D4BDQYTZW7GQYY9FGE6EFD.png', 'carousel', NULL, '2024-01-13 18:41:09', '2024-06-27 15:17:16'),
	(16, '#', '01J1D4DECNQNW8E8TETGZSPF9H.webp', 'home', '...', '2024-04-06 02:03:23', '2024-06-27 15:18:22');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.baus
CREATE TABLE IF NOT EXISTS `baus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `bau_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `caminho` varchar(255) DEFAULT NULL,
  `dataS` timestamp NULL DEFAULT NULL,
  `aberto_em` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela chinesa.baus: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela chinesa.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `casino_categories_slug_unique` (`slug`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.categories: 7 rows
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT IGNORE INTO `categories` (`id`, `name`, `description`, `image`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Popular', 'Popular', 'popular_on.png', 'popular', '2023-11-13 14:59:07', '2024-04-30 18:13:46'),
	(17, 'Slots', 'Slots', 'slots_on.png', 'slots', '2023-12-24 12:06:46', '2024-04-30 18:13:57'),
	(18, 'Pescaria', 'Pescaria', 'fish_on.png', 'pescaria', '2023-12-24 12:10:01', '2024-04-30 18:14:17'),
	(19, 'Blockchain', 'Blockchain', 'blockchain_on.png', 'blockchain', '2023-12-24 12:12:36', '2024-04-30 18:14:37'),
	(22, 'Cartas', 'Cartas', 'cartas_on.png', 'cartas', '2024-04-16 11:26:47', '2024-04-30 18:15:22'),
	(20, 'Favoritos', 'Favoritos', 'favorito_on.png', 'favoritos', '2023-12-24 12:19:42', '2024-04-30 18:14:49'),
	(21, 'Recentes', 'Recentes', 'recente_on.png', 'recentes', '2023-12-24 20:03:48', '2024-04-30 18:15:05');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.category_game
CREATE TABLE IF NOT EXISTS `category_game` (
  `category_id` bigint(20) unsigned NOT NULL,
  `game_id` bigint(20) unsigned NOT NULL,
  KEY `category_games_category_id_foreign` (`category_id`) USING BTREE,
  KEY `category_games_game_id_foreign` (`game_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- Copiando dados para a tabela chinesa.category_game: 0 rows
/*!40000 ALTER TABLE `category_game` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_game` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.currencies: 113 rows
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT IGNORE INTO `currencies` (`id`, `name`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
	(1, 'Leke', 'ALL', 'Lek', '2023-11-07 18:01:38', NULL),
	(2, 'Dollars', 'USD', '$', '2023-11-07 18:01:38', NULL),
	(3, 'Afghanis', 'AFN', '؋', '2023-11-07 18:01:38', NULL),
	(4, 'Pesos', 'ARS', '$', '2023-11-07 18:01:38', NULL),
	(5, 'Guilders', 'AWG', 'ƒ', '2023-11-07 18:01:38', NULL),
	(6, 'Dollars', 'AUD', '$', '2023-11-07 18:01:38', NULL),
	(7, 'New Manats', 'AZN', 'ман', '2023-11-07 18:01:38', NULL),
	(8, 'Dollars', 'BSD', '$', '2023-11-07 18:01:38', NULL),
	(9, 'Dollars', 'BBD', '$', '2023-11-07 18:01:38', NULL),
	(10, 'Rubles', 'BYR', 'p.', '2023-11-07 18:01:38', NULL),
	(11, 'Euro', 'EUR', '€', '2023-11-07 18:01:38', NULL),
	(12, 'Dollars', 'BZD', 'BZ$', '2023-11-07 18:01:38', NULL),
	(13, 'Dollars', 'BMD', '$', '2023-11-07 18:01:38', NULL),
	(14, 'Bolivianos', 'BOB', '$b', '2023-11-07 18:01:38', NULL),
	(15, 'Convertible Marka', 'BAM', 'KM', '2023-11-07 18:01:38', NULL),
	(16, 'Pula', 'BWP', 'P', '2023-11-07 18:01:38', NULL),
	(17, 'Leva', 'BGN', 'лв', '2023-11-07 18:01:38', NULL),
	(18, 'Reais', 'BRL', 'R$', '2023-11-07 18:01:38', NULL),
	(19, 'Pounds', 'GBP', '£', '2023-11-07 18:01:38', NULL),
	(20, 'Dollars', 'BND', '$', '2023-11-07 18:01:38', NULL),
	(21, 'Riels', 'KHR', '៛', '2023-11-07 18:01:38', NULL),
	(22, 'Dollars', 'CAD', '$', '2023-11-07 18:01:38', NULL),
	(23, 'Dollars', 'KYD', '$', '2023-11-07 18:01:38', NULL),
	(24, 'Pesos', 'CLP', '$', '2023-11-07 18:01:38', NULL),
	(25, 'Yuan Renminbi', 'CNY', '¥', '2023-11-07 18:01:38', NULL),
	(26, 'Pesos', 'COP', '$', '2023-11-07 18:01:38', NULL),
	(27, 'Colón', 'CRC', '₡', '2023-11-07 18:01:38', NULL),
	(28, 'Kuna', 'HRK', 'kn', '2023-11-07 18:01:38', NULL),
	(29, 'Pesos', 'CUP', '₱', '2023-11-07 18:01:38', NULL),
	(30, 'Koruny', 'CZK', 'Kč', '2023-11-07 18:01:38', NULL),
	(31, 'Kroner', 'DKK', 'kr', '2023-11-07 18:01:38', NULL),
	(32, 'Pesos', 'DOP', 'RD$', '2023-11-07 18:01:38', NULL),
	(33, 'Dollars', 'XCD', '$', '2023-11-07 18:01:38', NULL),
	(34, 'Pounds', 'EGP', '£', '2023-11-07 18:01:38', NULL),
	(35, 'Colones', 'SVC', '$', '2023-11-07 18:01:38', NULL),
	(36, 'Pounds', 'FKP', '£', '2023-11-07 18:01:38', NULL),
	(37, 'Dollars', 'FJD', '$', '2023-11-07 18:01:38', NULL),
	(38, 'Cedis', 'GHC', '¢', '2023-11-07 18:01:38', NULL),
	(39, 'Pounds', 'GIP', '£', '2023-11-07 18:01:38', NULL),
	(40, 'Quetzales', 'GTQ', 'Q', '2023-11-07 18:01:38', NULL),
	(41, 'Pounds', 'GGP', '£', '2023-11-07 18:01:38', NULL),
	(42, 'Dollars', 'GYD', '$', '2023-11-07 18:01:38', NULL),
	(43, 'Lempiras', 'HNL', 'L', '2023-11-07 18:01:38', NULL),
	(44, 'Dollars', 'HKD', '$', '2023-11-07 18:01:38', NULL),
	(45, 'Forint', 'HUF', 'Ft', '2023-11-07 18:01:38', NULL),
	(46, 'Kronur', 'ISK', 'kr', '2023-11-07 18:01:38', NULL),
	(47, 'Rupees', 'INR', 'Rp', '2023-11-07 18:01:38', NULL),
	(48, 'Rupiahs', 'IDR', 'Rp', '2023-11-07 18:01:38', NULL),
	(49, 'Rials', 'IRR', '﷼', '2023-11-07 18:01:38', NULL),
	(50, 'Pounds', 'IMP', '£', '2023-11-07 18:01:38', NULL),
	(51, 'New Shekels', 'ILS', '₪', '2023-11-07 18:01:38', NULL),
	(52, 'Dollars', 'JMD', 'J$', '2023-11-07 18:01:38', NULL),
	(53, 'Yen', 'JPY', '¥', '2023-11-07 18:01:38', NULL),
	(54, 'Pounds', 'JEP', '£', '2023-11-07 18:01:38', NULL),
	(55, 'Tenge', 'KZT', 'лв', '2023-11-07 18:01:38', NULL),
	(56, 'Won', 'KPW', '₩', '2023-11-07 18:01:38', NULL),
	(57, 'Won', 'KRW', '₩', '2023-11-07 18:01:38', NULL),
	(58, 'Soms', 'KGS', 'лв', '2023-11-07 18:01:38', NULL),
	(59, 'Kips', 'LAK', '₭', '2023-11-07 18:01:38', NULL),
	(60, 'Lati', 'LVL', 'Ls', '2023-11-07 18:01:38', NULL),
	(61, 'Pounds', 'LBP', '£', '2023-11-07 18:01:38', NULL),
	(62, 'Dollars', 'LRD', '$', '2023-11-07 18:01:38', NULL),
	(63, 'Switzerland Francs', 'CHF', 'CHF', '2023-11-07 18:01:38', NULL),
	(64, 'Litai', 'LTL', 'Lt', '2023-11-07 18:01:38', NULL),
	(65, 'Denars', 'MKD', 'ден', '2023-11-07 18:01:38', NULL),
	(66, 'Ringgits', 'MYR', 'RM', '2023-11-07 18:01:38', NULL),
	(67, 'Rupees', 'MUR', '₨', '2023-11-07 18:01:38', NULL),
	(68, 'Pesos', 'MXN', '$', '2023-11-07 18:01:38', NULL),
	(69, 'Tugriks', 'MNT', '₮', '2023-11-07 18:01:38', NULL),
	(70, 'Meticais', 'MZN', 'MT', '2023-11-07 18:01:38', NULL),
	(71, 'Dollars', 'NAD', '$', '2023-11-07 18:01:38', NULL),
	(72, 'Rupees', 'NPR', '₨', '2023-11-07 18:01:38', NULL),
	(73, 'Guilders', 'ANG', 'ƒ', '2023-11-07 18:01:38', NULL),
	(74, 'Dollars', 'NZD', '$', '2023-11-07 18:01:38', NULL),
	(75, 'Cordobas', 'NIO', 'C$', '2023-11-07 18:01:38', NULL),
	(76, 'Nairas', 'NGN', '₦', '2023-11-07 18:01:38', NULL),
	(77, 'Krone', 'NOK', 'kr', '2023-11-07 18:01:38', NULL),
	(78, 'Rials', 'OMR', '﷼', '2023-11-07 18:01:38', NULL),
	(79, 'Rupees', 'PKR', '₨', '2023-11-07 18:01:38', NULL),
	(80, 'Balboa', 'PAB', 'B/.', '2023-11-07 18:01:38', NULL),
	(81, 'Guarani', 'PYG', 'Gs', '2023-11-07 18:01:38', NULL),
	(82, 'Nuevos Soles', 'PEN', 'S/.', '2023-11-07 18:01:38', NULL),
	(83, 'Pesos', 'PHP', 'Php', '2023-11-07 18:01:38', NULL),
	(84, 'Zlotych', 'PLN', 'zł', '2023-11-07 18:01:38', NULL),
	(85, 'Rials', 'QAR', '﷼', '2023-11-07 18:01:38', NULL),
	(86, 'New Lei', 'RON', 'lei', '2023-11-07 18:01:38', NULL),
	(87, 'Rubles', 'RUB', 'руб', '2023-11-07 18:01:38', NULL),
	(88, 'Pounds', 'SHP', '£', '2023-11-07 18:01:38', NULL),
	(89, 'Riyals', 'SAR', '﷼', '2023-11-07 18:01:38', NULL),
	(90, 'Dinars', 'RSD', 'Дин.', '2023-11-07 18:01:38', NULL),
	(91, 'Rupees', 'SCR', '₨', '2023-11-07 18:01:38', NULL),
	(92, 'Dollars', 'SGD', '$', '2023-11-07 18:01:38', NULL),
	(93, 'Dollars', 'SBD', '$', '2023-11-07 18:01:38', NULL),
	(94, 'Shillings', 'SOS', 'S', '2023-11-07 18:01:38', NULL),
	(95, 'Rand', 'ZAR', 'R', '2023-11-07 18:01:38', NULL),
	(96, 'Rupees', 'LKR', '₨', '2023-11-07 18:01:38', NULL),
	(97, 'Kronor', 'SEK', 'kr', '2023-11-07 18:01:38', NULL),
	(98, 'Dollars', 'SRD', '$', '2023-11-07 18:01:38', NULL),
	(99, 'Pounds', 'SYP', '£', '2023-11-07 18:01:38', NULL),
	(100, 'New Dollars', 'TWD', 'NT$', '2023-11-07 18:01:38', NULL),
	(101, 'Baht', 'THB', '฿', '2023-11-07 18:01:38', NULL),
	(102, 'Dollars', 'TTD', 'TT$', '2023-11-07 18:01:38', NULL),
	(103, 'Lira', 'TRY', '₺', '2023-11-07 18:01:38', NULL),
	(104, 'Liras', 'TRL', '£', '2023-11-07 18:01:38', NULL),
	(105, 'Dollars', 'TVD', '$', '2023-11-07 18:01:38', NULL),
	(106, 'Hryvnia', 'UAH', '₴', '2023-11-07 18:01:38', NULL),
	(107, 'Pesos', 'UYU', '$U', '2023-11-07 18:01:38', NULL),
	(108, 'Sums', 'UZS', 'лв', '2023-11-07 18:01:38', NULL),
	(109, 'Bolivares Fuertes', 'VEF', 'Bs', '2023-11-07 18:01:38', NULL),
	(110, 'Dong', 'VND', '₫', '2023-11-07 18:01:38', NULL),
	(111, 'Rials', 'YER', '﷼', '2023-11-07 18:01:38', NULL),
	(112, 'Zimbabwe Dollars', 'ZWD', 'Z$', '2023-11-07 18:01:38', NULL),
	(113, 'Rupees', 'INR', '₹', '2023-11-07 18:01:38', NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.currency_alloweds
CREATE TABLE IF NOT EXISTS `currency_alloweds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `currency_alloweds_currency_id_foreign` (`currency_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- Copiando dados para a tabela chinesa.currency_alloweds: 0 rows
/*!40000 ALTER TABLE `currency_alloweds` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_alloweds` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.custom_layouts
CREATE TABLE IF NOT EXISTS `custom_layouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `font_family_default` varchar(191) DEFAULT NULL,
  `primary_color` varchar(20) NOT NULL DEFAULT '#0073D2',
  `primary_opacity_color` varchar(20) DEFAULT NULL,
  `secundary_color` varchar(20) NOT NULL DEFAULT '#084375',
  `gray_dark_color` varchar(20) NOT NULL DEFAULT '#3b3b3b',
  `gray_light_color` varchar(20) NOT NULL DEFAULT '#c9c9c9',
  `gray_medium_color` varchar(20) NOT NULL DEFAULT '#676767',
  `gray_over_color` varchar(20) NOT NULL DEFAULT '#1A1C20',
  `title_color` varchar(20) NOT NULL DEFAULT '#ffffff',
  `text_color` varchar(20) NOT NULL DEFAULT '#98A7B5',
  `sub_text_color` varchar(20) NOT NULL DEFAULT '#656E78',
  `placeholder_color` varchar(20) NOT NULL DEFAULT '#4D565E',
  `background_color` varchar(20) NOT NULL DEFAULT '#24262B',
  `background_base` varchar(20) DEFAULT '#ECEFF1',
  `background_base_dark` varchar(20) DEFAULT '#24262B',
  `carousel_banners` varchar(20) DEFAULT '#1E2024',
  `carousel_banners_dark` varchar(20) DEFAULT '#1E2024',
  `sidebar_color` varchar(20) DEFAULT NULL,
  `sidebar_color_dark` varchar(20) DEFAULT NULL,
  `navtop_color` varchar(20) DEFAULT NULL,
  `navtop_color_dark` varchar(20) DEFAULT NULL,
  `side_menu` varchar(20) DEFAULT NULL,
  `side_menu_dark` varchar(20) DEFAULT NULL,
  `input_primary` varchar(20) DEFAULT NULL,
  `input_primary_dark` varchar(20) DEFAULT NULL,
  `footer_color` varchar(20) DEFAULT NULL,
  `footer_color_dark` varchar(20) DEFAULT NULL,
  `card_color` varchar(20) DEFAULT NULL,
  `card_color_dark` varchar(20) DEFAULT NULL,
  `border_radius` varchar(20) NOT NULL DEFAULT '.25rem',
  `custom_css` text DEFAULT NULL,
  `custom_js` text DEFAULT NULL,
  `custom_header` longtext DEFAULT NULL,
  `custom_body` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `instagram` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `telegram` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `whastapp` varchar(191) DEFAULT NULL,
  `youtube` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.custom_layouts: 1 rows
/*!40000 ALTER TABLE `custom_layouts` DISABLE KEYS */;
INSERT IGNORE INTO `custom_layouts` (`id`, `font_family_default`, `primary_color`, `primary_opacity_color`, `secundary_color`, `gray_dark_color`, `gray_light_color`, `gray_medium_color`, `gray_over_color`, `title_color`, `text_color`, `sub_text_color`, `placeholder_color`, `background_color`, `background_base`, `background_base_dark`, `carousel_banners`, `carousel_banners_dark`, `sidebar_color`, `sidebar_color_dark`, `navtop_color`, `navtop_color_dark`, `side_menu`, `side_menu_dark`, `input_primary`, `input_primary_dark`, `footer_color`, `footer_color_dark`, `card_color`, `card_color_dark`, `border_radius`, `custom_css`, `custom_js`, `custom_header`, `custom_body`, `created_at`, `updated_at`, `instagram`, `facebook`, `telegram`, `twitter`, `whastapp`, `youtube`) VALUES
	(1, '\'Roboto Condensed\', sans-serif', '#30b878', '#157d4c', '#82e0b4', '#3b3b3b', '#efefef', '#d4d4d4', '#191A1E', '#ffffff', '#98A7B5', '#656E78', '#4D565E', '#30b878', '#30b878', '#30b878', '#dbdbdb', '#93727200', '#0f1923', '#30b878', '#ffffff0e', '#0f1923', '#dbdbdb', '#0f1923', '#ffffff', '#ffffff', '#919191', '#0f1923', '#ababab', '#1E2024', '.25rem', '\n', '<div class="w-full relative">\n    <div class="text-[var(--theme-text-color)] font-bold my-[20px] text-[22px] w-full min-h-[24px] text-center leading-[1.3]">\n        <span class="w-full -mb-[2.58824px] pb-[-2.58824px] text-[22px] inline-block leading-[0] overflow-hidden">\n            <span class="text-[14.9067px] sm:text-[22px] inline-block w-full">\n                <span class="leading-[1.2] [overflow:initial] text-center overflow-ellipsis align-middle" style="-webkit-line-clamp: 5;">\n                    🎁 Venha se Divertir no maior site do Brasil\n                </span>\n            </span>\n        </span>\n    </div>\n    <div class="text-[var(--theme-text-color)] pb-[20px] sm:pb-0 sm:h-[405px] text-[14px] leading-[1.56] text-left w-full">\n        <div class="w-full h-full px-[30px]">\n            <div class="sm:h-full overflow-x-hidden overflow-y-scroll [scrollbar-width:none]">\n                <div class="my-scrollbar-content">\n                    <div class="D4IXpi08hh8lVGgzIBUz">\n                        <div>\n                            <p class="mb-0">\n                                ✈️Clique no canal:\n                                <a href="https://t.me/ROX_BR" target="_blank" rel="noopener">\n                                    <span style="color: #ffeb00;">Telegram</span>\n                                </a>\n                                <br>📲Baixe o site oficial do APP:\n                                <a href="https://t.me/ROX_BR" target="_blank" rel="noopener">\n                                    <span style="color: #ffeb00;">Daanrox​​.com</span>\n                                </a>\n                                <br>❤️Convide amigos e ganhe\n                                <span style="color: #ffeb00;">10 mil</span>\n                                reais por dia não é sonho❤️\n                                <br>🎁Bônus de primeiro depósito para novos usuários\n                                <span style="color: #ffeb00;">10%</span>\n                                <br>🎁 Bônus convite:\n                                <span style="color: #ffeb00;">R$ 10</span>\n                                por pessoa\n                                <br>🎁 Convide amigos, compartilhe e ganhe dinheiro! Comissão\n                                <span style="color: #ffeb00;"> até 2%</span>\n                                <br>🎁 Recompensas e privilégios de associação VIP de até\n                                <span style="color: #ffeb00;">R$ 777.777</span>\n                                <br>👉 Passos: Visitar → Eventos/Promoções → Recomendar amigos → Receber/Receber\n                            </p>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</div>\n', '', '<a href="https://t.me/ROX_BR" target="_blank" class="float1" id="float1">\n  <img class="icon" src="https://wordpress-731680-3807664.cloudwaysapps.com/wp-content/uploads/2024/04/ActiveImg7532580654847733-1.gif"/>\n</a>\n<button class="close-btn" onclick="hideFloat1()"><i class="fa-regular fa-circle-xmark"></i></button>\n\n<style>\n  :root {\n    --icon-color: #fff;\n    --icon-hover: #fff;\n    --background-color: #0060ff;\n    --background-hover: #0044b3;\n  }\n\n  .icon {\n    width: 110px;\n    height: 110px;\n    transform: scale(0.6) translate(15%, 28%);\n  }\n\n  .float1 {\n    position: fixed;\n    cursor: pointer;\n    width: 110px;\n    height: 110px;\n    bottom: 140px;\n    right: 0px;\n    transition: 1s;\n    z-index: 9000;\n  }\n\n  .close-btn {\n    position: fixed;\n    bottom: 200px; /* Ajuste conforme necessário */\n    right: 10px; /* Ajuste conforme necessário */\n    width: 20px;\n    height: 20px;\n   background-color: var(--ci-primary-color);\n    color: var(--ci-secundary-color);\n    border: none;\n    border-radius: 50%;\n    cursor: pointer;\n    z-index: 9001; /* Um nível acima da float2 */\n  }\n\n  .close-btn:hover {\n    background-color: var(--background-hover);\n  }\n\n  @keyframes pulse {\n    0% {\n      -webkit-box-shadow: 0 0 0 0 rgba(0, 96, 255, 1);\n    }\n\n    70% {\n      -webkit-box-shadow: 0 0 0 20px rgba(0, 96, 255, 0);\n    }\n\n    100% {\n      -webkit-box-shadow: 0 0 0 0 rgba(0, 96, 255, 0);\n    }\n  }\n\n\n</style>\n\n<script>\n  function hideFloat1() {\n    document.getElementById(\'float1\').style.display = \'none\';\n    document.querySelector(\'.close-btn\').style.display = \'none\';\n  }\n</script>\n\n<a href="/home/agents" class="float2" id="float2">\n  <img class="icon" src="/storage/rox/rox_gif_post.gif"/>\n</a>\n<button class="close-btn2" onclick="hideFloat2()"><i class="fa-regular fa-circle-xmark"></i></button>\n\n<style>\n  :root {\n    --icon-color: #fff;\n    --icon-hover: #fff;\n    --background-color: #0060ff;\n    --background-hover: #0044b3;\n  }\n\n \n  .float2 {\n    position: fixed;\n    cursor: pointer;\n    width: 110px;\n    height: 110px;\n    bottom: 230px;\n    right: 5px;\n    transition: 1s;\n    z-index: 9000;\n  }\n\n  .close-btn2 {\n    position: fixed;\n    bottom: 280px; /* Ajuste conforme necessário */\n    right: 10px; /* Ajuste conforme necessário */\n    width: 20px;\n    height: 20px;\n    background-color: var(--ci-primary-color);\n    color: var(--ci-secundary-color);\n    border: none;\n    border-radius: 50%;\n    cursor: pointer;\n    z-index: 9001; /* Um nível acima da float2 */\n  }\n\n  .close-btn2:hover {\n    background-color: var(--background-hover);\n  }\n\n\n\n\n</style>\n\n<script>\n  function hideFloat2() {\n    document.getElementById(\'float2\').style.display = \'none\';\n    document.querySelector(\'.close-btn2\').style.display = \'none\';\n  }\n</script>', '2024-01-01 14:36:03', '2024-06-27 22:42:03', 'https://instagram.com/daanrox', 'https://facebook.com/rinobet', 'https://t.me/ROX_BR', 'https://twitter.com/', 'https://api.whatsapp.com/', 'https://www.youtube.com/');
/*!40000 ALTER TABLE `custom_layouts` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.debug
CREATE TABLE IF NOT EXISTS `debug` (
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.debug: 25 rows
/*!40000 ALTER TABLE `debug` DISABLE KEYS */;
INSERT IGNORE INTO `debug` (`text`) VALUES
	('"PlaceBet: 914806915"'),
	('"PlaceBet: 914806915"'),
	('"AwardWinnings: 914806915"'),
	('"PlaceBet: 914806916"'),
	('"AwardWinnings: 914806916"'),
	('"PlaceBet: 914806916"'),
	('"PlaceBet: 914806917"'),
	('"PlaceBet: 914806918"'),
	('"AwardWinnings: 914806918"'),
	('"PlaceBet: 914806918"'),
	('"PlaceBet: 914806919"'),
	('"AwardWinnings: 914806919"'),
	('"AwardWinnings: 914806919"'),
	('"PlaceBet: 914806920"'),
	('"PlaceBet: 914806921"'),
	('"AwardWinnings: 914806921"'),
	('"PlaceBet: 535367"'),
	('"PlaceBet: 154646"'),
	('"PlaceBet: 914806922"'),
	('"PlaceBet: 914806923"'),
	('"PlaceBet: 914806924"'),
	('"AwardWinnings: 914806924"'),
	('{"idTransaction":"875dcfac-f963-4a70-90ef-ad3c357d3f7b","typeTransaction":"PIX_CASHOUT","statusTransaction":"PAID_OUT","value":150,"destinationName":"Julia Ayumi Imada De Lima","destinationTaxId":"***.373.478-**","destinationBank":"PICPAY"}'),
	('{"idTransaction":"1979e952-67cb-4924-a463-b79e2716804b","typeTransaction":"PIX_CASHOUT","statusTransaction":"PAID_OUT","value":177,"destinationName":"Anne Ferreira","destinationTaxId":"***.916.418-**","destinationBank":"NUBANK"}'),
	('{"idTransaction":"ec707f26-d5b9-4d0b-85cf-56a4d518144b","typeTransaction":"PIX_CASHOUT","statusTransaction":"PAID_OUT","value":181,"destinationName":"Anne Ferreira","destinationTaxId":"***.916.418-**","destinationBank":"NUBANK"}');
/*!40000 ALTER TABLE `debug` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.deposits
CREATE TABLE IF NOT EXISTS `deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` varchar(191) NOT NULL,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `currency` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `deposits_user_id_foreign` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.deposits: 0 rows
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.digito_pay_payments
CREATE TABLE IF NOT EXISTS `digito_pay_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `withdrawal_id` int(10) unsigned NOT NULL,
  `pix_key` varchar(191) NOT NULL,
  `pix_type` varchar(191) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `observation` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `digito_pay_payments_user_id_index` (`user_id`) USING BTREE,
  KEY `digito_pay_payments_withdrawal_id_index` (`withdrawal_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.digito_pay_payments: 0 rows
/*!40000 ALTER TABLE `digito_pay_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `digito_pay_payments` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.failed_jobs: 0 rows
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.games
CREATE TABLE IF NOT EXISTS `games` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `provider_id` int(10) unsigned NOT NULL,
  `game_server_url` varchar(191) DEFAULT NULL,
  `game_id` varchar(191) NOT NULL,
  `game_name` varchar(191) NOT NULL,
  `game_code` varchar(191) NOT NULL,
  `game_type` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `cover` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `technology` varchar(191) DEFAULT NULL,
  `has_lobby` tinyint(4) NOT NULL DEFAULT 0,
  `is_mobile` tinyint(4) NOT NULL DEFAULT 0,
  `has_freespins` tinyint(4) NOT NULL DEFAULT 0,
  `has_tables` tinyint(4) NOT NULL DEFAULT 0,
  `only_demo` tinyint(4) DEFAULT 0,
  `rtp` bigint(20) NOT NULL COMMENT 'Controle de RTP em porcentagem',
  `distribution` varchar(191) NOT NULL COMMENT 'O nome do provedor',
  `views` bigint(20) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) DEFAULT 0,
  `show_home` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `games_provider_id_index` (`provider_id`) USING BTREE,
  KEY `games_game_code_index` (`game_code`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.games: 10 rows
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT IGNORE INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
	(1, 164, NULL, '48', 'Double Fortune', '48', 'slot', NULL, '01J1D491Q29HGFV5C1PTRMBNF2.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'fivers', 100, 0, 1, '2024-06-26 18:15:16', '2024-06-27 15:16:01'),
	(2, 164, NULL, '42', 'Ganesha Gold', '42', 'slot', NULL, '01J1D48FYP54MWCEA99PMKA5KG.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'fivers', 267, 1, 1, '2024-06-26 18:21:11', '2024-06-27 15:15:40'),
	(3, 164, NULL, '63', 'Dragon Tiger Luck', '63', 'slot', NULL, '01J1D47X4J6E99V1S9GJS2FWF7.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'fivers', 5, 0, 1, '2024-06-26 18:22:54', '2024-06-27 15:15:21'),
	(4, 164, NULL, '40', 'Jungle Delight', '40', 'slot', NULL, '01J1D4719PT2EZBDQZYMF1EQ31.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'fivers', 10, 0, 1, '2024-06-26 18:23:42', '2024-06-27 15:14:55'),
	(5, 164, NULL, '69', 'Bikini Paradise', '69', 'slot', NULL, '01J1D46FHEPTSGDH71Z5Z6KZA7.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'fivers', 158, 0, 1, '2024-06-26 18:25:02', '2024-06-27 15:14:34'),
	(6, 164, NULL, '68', 'Fortune Mouse', '68', 'slot', NULL, '01J1D45Y482BBXBM7RYBAG4TEG.avif', '1', NULL, 0, 0, 0, 0, 0, 90, 'fivers', 258, 0, 1, '2024-06-26 18:26:01', '2024-06-27 15:14:18'),
	(7, 164, NULL, '98', 'Fortune OX', '98', 'slot', NULL, '01J1D456G9KWD75JW8WW5SCJCS.avif', '1', NULL, 0, 0, 0, 0, 0, 90, 'fivers', 0, 0, 1, '2024-06-26 18:26:32', '2024-06-27 15:13:58'),
	(8, 164, NULL, '1543462', 'Fortune Rabbit', '1543462', 'slot', NULL, '01J1D44M2DZ70NXGXAJG4VA84F.avif', '1', NULL, 0, 0, 0, 0, 0, 90, 'fivers', 200, 0, 1, '2024-06-26 18:27:22', '2024-06-27 15:13:33'),
	(9, 164, NULL, '1695365', 'Fortune Dragon', '1695365', 'slot', NULL, '01J1D440FJPF57J40W92DWGKDE.avif', '1', NULL, 0, 0, 0, 0, 0, 90, 'fivers', 261, 0, 1, '2024-06-26 18:28:11', '2024-06-27 15:13:13'),
	(10, 164, NULL, '126', 'Fortune Tiger', '126', 'slot, fish', NULL, '01J1D43AFWYG2PWS9ZZ58HK01J.avif', '1', NULL, 0, 0, 0, 0, 0, 90, 'fivers', 99999999, 0, 1, '2024-06-26 18:28:53', '2024-06-27 15:12:58');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.games_keys
CREATE TABLE IF NOT EXISTS `games_keys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_url` varchar(191) DEFAULT NULL,
  `merchant_id` varchar(191) DEFAULT NULL,
  `merchant_key` varchar(191) DEFAULT NULL,
  `agent_code` varchar(255) DEFAULT NULL,
  `agent_token` varchar(255) DEFAULT NULL,
  `agent_secret_key` varchar(255) DEFAULT NULL,
  `api_endpoint` varchar(255) DEFAULT NULL,
  `salsa_base_uri` varchar(255) DEFAULT NULL,
  `salsa_pn` varchar(255) DEFAULT NULL,
  `salsa_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vibra_site_id` varchar(191) DEFAULT NULL,
  `vibra_game_mode` varchar(191) DEFAULT NULL,
  `worldslot_agent_code` varchar(191) DEFAULT NULL,
  `worldslot_agent_token` varchar(191) DEFAULT NULL,
  `worldslot_agent_secret_key` varchar(191) DEFAULT NULL,
  `worldslot_api_endpoint` varchar(191) NOT NULL DEFAULT 'https://api.worldslotgame.com/api/v2/',
  `games2_agent_code` varchar(191) DEFAULT NULL,
  `games2_agent_token` varchar(191) DEFAULT NULL,
  `games2_agent_secret_key` varchar(191) DEFAULT NULL,
  `games2_api_endpoint` varchar(191) NOT NULL DEFAULT 'api.games2api.xyz',
  `evergame_agent_code` varchar(191) DEFAULT NULL,
  `evergame_agent_token` varchar(191) DEFAULT NULL,
  `evergame_api_endpoint` varchar(191) DEFAULT NULL,
  `venix_agent_code` varchar(191) DEFAULT NULL,
  `venix_agent_token` varchar(191) DEFAULT NULL,
  `venix_agent_secret` varchar(191) DEFAULT NULL,
  `play_gaming_hall` varchar(191) DEFAULT NULL,
  `play_gaming_key` varchar(191) DEFAULT NULL,
  `play_gaming_login` varchar(191) DEFAULT NULL,
  `pig_agent_code` varchar(191) DEFAULT NULL,
  `pig_agent_token` varchar(191) DEFAULT NULL,
  `pig_agent_secret` varchar(191) DEFAULT NULL,
  `imperium_games_hall` varchar(191) DEFAULT NULL,
  `imperium_games_key` varchar(191) DEFAULT NULL,
  `imperium_games_login` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.games_keys: 1 rows
/*!40000 ALTER TABLE `games_keys` DISABLE KEYS */;
INSERT IGNORE INTO `games_keys` (`id`, `merchant_url`, `merchant_id`, `merchant_key`, `agent_code`, `agent_token`, `agent_secret_key`, `api_endpoint`, `salsa_base_uri`, `salsa_pn`, `salsa_key`, `created_at`, `updated_at`, `vibra_site_id`, `vibra_game_mode`, `worldslot_agent_code`, `worldslot_agent_token`, `worldslot_agent_secret_key`, `worldslot_api_endpoint`, `games2_agent_code`, `games2_agent_token`, `games2_agent_secret_key`, `games2_api_endpoint`, `evergame_agent_code`, `evergame_agent_token`, `evergame_api_endpoint`, `venix_agent_code`, `venix_agent_token`, `venix_agent_secret`, `play_gaming_hall`, `play_gaming_key`, `play_gaming_login`, `pig_agent_code`, `pig_agent_token`, `pig_agent_secret`, `imperium_games_hall`, `imperium_games_key`, `imperium_games_login`) VALUES
	(1, 'https://gis.slotegrator.com/api/index.php/v1', NULL, NULL, NULL, NULL, NULL, 'https://api.fiverscool.com', NULL, NULL, NULL, '2023-11-30 18:03:08', '2024-06-26 17:37:42', NULL, NULL, '2as', '0ad6540a2b2a812d74c036e35c3c18e9', '16600838288af7d55a8be1ec86f13e1e', 'https://api.worldslotgame.com/api/v2/', NULL, NULL, NULL, 'https://api.games2api.xyz', 'daanrox', '3262366c767a74743162783875797874', 'https://api.evergame.org/api/casinoapi', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `games_keys` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.game_favorites
CREATE TABLE IF NOT EXISTS `game_favorites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `game_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `game_favorites_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  KEY `game_favorites_game_id_foreign` (`game_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- Copiando dados para a tabela chinesa.game_favorites: 0 rows
/*!40000 ALTER TABLE `game_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_favorites` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.game_likes
CREATE TABLE IF NOT EXISTS `game_likes` (
  `user_id` bigint(20) unsigned NOT NULL,
  `game_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `game_likes_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  KEY `game_likes_game_id_foreign` (`game_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- Copiando dados para a tabela chinesa.game_likes: 0 rows
/*!40000 ALTER TABLE `game_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_likes` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.game_reviews
CREATE TABLE IF NOT EXISTS `game_reviews` (
  `user_id` bigint(20) unsigned NOT NULL,
  `game_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `game_reviews_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  KEY `game_reviews_game_id_foreign` (`game_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.game_reviews: 0 rows
/*!40000 ALTER TABLE `game_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_reviews` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.gateways
CREATE TABLE IF NOT EXISTS `gateways` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `suitpay_uri` varchar(191) DEFAULT NULL,
  `suitpay_cliente_id` varchar(191) DEFAULT NULL,
  `suitpay_cliente_secret` varchar(191) DEFAULT NULL,
  `stripe_production` tinyint(4) DEFAULT 0,
  `stripe_public_key` varchar(255) DEFAULT NULL,
  `stripe_secret_key` varchar(255) DEFAULT NULL,
  `stripe_webhook_key` varchar(255) DEFAULT NULL,
  `bspay_uri` varchar(255) DEFAULT NULL,
  `bspay_cliente_id` varchar(255) DEFAULT NULL,
  `bspay_cliente_secret` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `public_key` varchar(191) DEFAULT NULL,
  `private_key` varchar(191) DEFAULT NULL,
  `mp_client_id` varchar(191) DEFAULT NULL,
  `mp_client_secret` varchar(191) DEFAULT NULL,
  `mp_public_key` varchar(191) DEFAULT NULL,
  `mp_access_token` varchar(191) DEFAULT NULL,
  `digitopay_uri` varchar(191) DEFAULT NULL,
  `digitopay_cliente_id` varchar(191) DEFAULT NULL,
  `digitopay_cliente_secret` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.gateways: 1 rows
/*!40000 ALTER TABLE `gateways` DISABLE KEYS */;
INSERT IGNORE INTO `gateways` (`id`, `suitpay_uri`, `suitpay_cliente_id`, `suitpay_cliente_secret`, `stripe_production`, `stripe_public_key`, `stripe_secret_key`, `stripe_webhook_key`, `bspay_uri`, `bspay_cliente_id`, `bspay_cliente_secret`, `created_at`, `updated_at`, `public_key`, `private_key`, `mp_client_id`, `mp_client_secret`, `mp_public_key`, `mp_access_token`, `digitopay_uri`, `digitopay_cliente_id`, `digitopay_cliente_secret`) VALUES
	(1, 'https://ws.suitpay.app/api/v1/', 'daanrox_1702319994406', '3906cd85a2869407d60d69ff04506f9cfd5d4fe5bc329fa4ea56bea141b999867131d9bdb61448e78a1be53282d21d6f', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-30 21:05:51', '2024-06-26 20:01:12', NULL, NULL, NULL, NULL, NULL, NULL, 'https://api.digitopayoficial.com.br/', '2426d9ee-b917-44f7-9767-8c4d034815b5', 'b1258e59-e97c-4cb1-b71d-7e40a9d03c1d');
/*!40000 ALTER TABLE `gateways` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.ggds_spin_config
CREATE TABLE IF NOT EXISTS `ggds_spin_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `prizes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela chinesa.ggds_spin_config: ~1 rows (aproximadamente)
INSERT IGNORE INTO `ggds_spin_config` (`id`, `prizes`, `created_at`, `updated_at`) VALUES
	(1, '[{"currency":"BRL","value":5},{"currency":"BRL","value":0},{"currency":"BRL","value":1},{"currency":"BRL","value":0},{"currency":"BRL","value":2},{"currency":"BRL","value":5},{"currency":"BRL","value":0},{"currency":"BRL","value":5},{"currency":"BRL","value":1},{"currency":"BRL","value":0},{"currency":"BRL","value":3},{"currency":"BRL","value":0},{"currency":"BRL","value":1},{"currency":"BRL","value":5},{"currency":"BRL","value":0},{"currency":"BRL","value":10}]', '2024-01-11 20:52:59', '2024-04-13 11:07:31');

-- Copiando estrutura para tabela chinesa.ggds_spin_runs
CREATE TABLE IF NOT EXISTS `ggds_spin_runs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `nonce` varchar(255) NOT NULL,
  `possibilities` text NOT NULL,
  `prize` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela chinesa.ggds_spin_runs: ~2 rows (aproximadamente)
INSERT IGNORE INTO `ggds_spin_runs` (`id`, `key`, `nonce`, `possibilities`, `prize`, `created_at`, `updated_at`) VALUES
	(1, '526db7d417473d56275f7dffa72c0c3382aa76df7adcfe7216951fca7dc5e810', '11bea414-f850-460a-91d2-a9703e47ca2e', '[{"currency":"BRL","value":5},{"currency":"BRL","value":10},{"currency":"BRL","value":25},{"currency":"BRL","value":30},{"currency":"BRL","value":40},{"currency":"BRL","value":50},{"currency":"BRL","value":90},{"currency":"BRL","value":100},{"currency":"BRL","value":140},{"currency":"BRL","value":15},{"currency":"BRL","value":30},{"currency":"BRL","value":500},{"currency":"BRL","value":1000},{"currency":"BRL","value":1500},{"currency":"BRL","value":2000},{"currency":"BRL","value":2500}]', '{"currency":"BRL","value":15}', '2024-06-10 21:48:09', '2024-06-10 21:48:09'),
	(2, '2c35774a073f9e945a91b9b12b5147639cca66234af69b34b0d6656595372c96', '2b712589-b2ad-40af-82c3-ea01fec5f308', '[{"currency":"BRL","value":5},{"currency":"BRL","value":10},{"currency":"BRL","value":25},{"currency":"BRL","value":30},{"currency":"BRL","value":40},{"currency":"BRL","value":50},{"currency":"BRL","value":90},{"currency":"BRL","value":100},{"currency":"BRL","value":140},{"currency":"BRL","value":15},{"currency":"BRL","value":30},{"currency":"BRL","value":500},{"currency":"BRL","value":1000},{"currency":"BRL","value":1500},{"currency":"BRL","value":2000},{"currency":"BRL","value":2500}]', '{"currency":"BRL","value":5}', '2024-06-10 21:48:20', '2024-06-10 21:48:20');

-- Copiando estrutura para tabela chinesa.ggr_games
CREATE TABLE IF NOT EXISTS `ggr_games` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(191) NOT NULL,
  `game` varchar(191) NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_win` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(50) DEFAULT NULL,
  `aggregator` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ggr_games_fivers_user_id_index` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.ggr_games: 0 rows
/*!40000 ALTER TABLE `ggr_games` DISABLE KEYS */;
/*!40000 ALTER TABLE `ggr_games` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.ggr_games_world_slots
CREATE TABLE IF NOT EXISTS `ggr_games_world_slots` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(191) NOT NULL,
  `game` varchar(191) NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_win` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(50) NOT NULL DEFAULT 'BRL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ggr_games_world_slots_user_id_index` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.ggr_games_world_slots: 0 rows
/*!40000 ALTER TABLE `ggr_games_world_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `ggr_games_world_slots` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.likes
CREATE TABLE IF NOT EXISTS `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `liked_user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `likes_user_id_foreign` (`user_id`) USING BTREE,
  KEY `likes_liked_user_id_foreign` (`liked_user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- Copiando dados para a tabela chinesa.likes: 0 rows
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.migrations: 94 rows
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
	(2, '2014_10_12_000000_create_users_table', 1),
	(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(15, '2023_10_30_034921_create_settings_table', 6),
	(7, '2023_11_03_205251_create_sport_categories_table', 1),
	(8, '2023_11_03_205252_create_sports_table', 1),
	(10, '2023_11_04_001342_create_sport_events_table', 2),
	(11, '2023_11_04_213841_add_fields_to_users_table', 3),
	(12, '2023_11_07_202919_create_currencies_table', 4),
	(13, '2023_11_07_210310_create_wallets_table', 5),
	(16, '2023_11_07_214236_create_withdrawals_table', 7),
	(17, '2023_11_07_214240_create_deposits_table', 7),
	(18, '2023_11_07_214244_create_orders_table', 7),
	(19, '2023_11_07_214708_create_suit_pay_payments_table', 7),
	(20, '2023_11_07_215204_create_notifications_table', 8),
	(21, '2023_11_07_202919_create_currency_alloweds_table', 9),
	(22, '2023_11_11_205824_create_casino_categories_table', 9),
	(23, '2023_11_11_205834_create_casino_providers_table', 9),
	(24, '2023_11_11_205938_create_casino_games_slotgrators_table', 9),
	(25, '2023_11_11_210018_create_casino_games_kscinuses_table', 9),
	(26, '2023_11_12_225424_create_transactions_table', 10),
	(27, '2023_11_12_225431_create_affiliate_histories_table', 10),
	(28, '2023_11_12_234643_add_field_to_wallet_table', 11),
	(29, '2023_11_14_203632_create_likes_table', 12),
	(30, '2023_09_27_214903_create_wallet_changes_table', 13),
	(31, '2023_11_16_155140_create_permission_tables', 14),
	(32, '2023_11_17_012533_add_language_to_users_table', 15),
	(33, '2023_11_22_171616_create_football_leagues_table', 16),
	(34, '2023_11_22_175530_create_football_venues_table', 17),
	(35, '2023_11_22_175547_create_football_teams_table', 17),
	(36, '2023_11_23_143637_create_football_events_table', 18),
	(38, '2023_11_29_134520_create_sport_bets_table', 19),
	(39, '2023_11_29_135451_create_sport_bets_odds_table', 19),
	(40, '2023_11_30_195548_create_gateways_table', 20),
	(41, '2023_11_30_195557_create_games_keys_table', 20),
	(42, '2023_11_30_195609_create_setting_mails_table', 20),
	(43, '2023_10_08_111755_add_fields_to_game_exclusives_table', 20),
	(44, '2023_10_07_183921_create_game_exclusives_table', 21),
	(45, '2023_10_11_144956_create_system_wallets_table', 22),
	(46, '2023_12_18_172721_create_banners_table', 23),
	(47, '2023_12_20_135908_create_casino_games_salsas_table', 24),
	(48, '2023_12_23_224032_create_fivers_providers_table', 25),
	(49, '2023_12_23_224105_create_fivers_games_table', 25),
	(50, '2023_12_31_121453_create_custom_layouts_table', 26),
	(51, '2024_01_01_193712_create_g_g_r_games_fivers_table', 27),
	(52, '2024_01_14_155144_create_missions_table', 28),
	(53, '2024_01_14_155150_create_mission_users_table', 28),
	(54, '2024_01_19_120728_create_ka_gamings_table', 29),
	(55, '2024_01_19_170650_create_categories_table', 30),
	(56, '2024_01_19_170657_create_providers_table', 30),
	(57, '2024_01_19_170658_create_games_table', 31),
	(58, '2023_10_07_183920_create_categories_table', 32),
	(59, '2023_10_07_183921_create_providers_table', 33),
	(60, '2023_10_07_183922_create_games_table', 34),
	(61, '2024_01_20_144529_create_category_games_table', 35),
	(62, '2024_01_20_182155_add_vibra_to_games_keys_table', 36),
	(63, '2024_01_21_173742_create_game_favorites_table', 37),
	(64, '2024_01_21_173752_create_game_likes_table', 37),
	(65, '2024_01_21_173803_create_game_reviews_table', 37),
	(66, '2024_01_11_231932_create_vibra_casino_games_table', 38),
	(69, '2024_01_28_194456_add_vip_to_wallet_table', 40),
	(68, '2024_01_28_194645_create_vips_table', 39),
	(70, '2024_01_28_231843_create_vip_users_table', 41),
	(71, '2024_01_29_102939_add_paid_to_limits_table', 41),
	(72, '2024_01_10_001705_create_sub_affiliates_table', 42),
	(73, '2024_01_30_120547_create_affiliate_withdraws_table', 43),
	(74, '2024_02_09_233936_add_worldslot_to_games_keys_table', 44),
	(75, '2024_02_10_191215_add_disable_spin_to_settings_table', 45),
	(76, '2024_02_17_210822_add_games2_to_games_keys_table', 46),
	(78, '2024_02_20_004853_add_sub_to_settings_table', 47),
	(79, '2024_02_24_121146_add_header_to_custom_layouts_table', 48),
	(80, '2024_02_26_144235_create_ggr_games_world_slots_table', 49),
	(81, '2024_03_01_172613_add_evergame_to_games_keys_table', 50),
	(82, '2024_03_03_201700_add_venixkey_to_games_keys_table', 51),
	(83, '2024_03_08_201557_add_play_gaming_to_games_keys_table', 52),
	(84, '2024_03_21_154342_add_headerbody_to_custom_layouts_table', 53),
	(85, '2024_03_21_154342_add_headerbody_to_custom_layouts_table', 54),
	(86, '2024_03_21_223739_add_sharkpay_to_gateways_table', 55),
	(87, '2024_03_21_230017_add_reference_to_transactions_table', 56),
	(88, '2024_03_24_125025_add_rollver_protection_to_settings_table', 57),
	(89, '2024_03_24_134101_add_accept_bonus_to_transactions_table', 58),
	(90, '2024_03_24_172243_add_receita_to_affiliate_histories_table', 59),
	(91, '2024_03_26_161932_add_baseline_column_to_settings_table', 60),
	(92, '2024_03_26_234226_add_playigaming_column_to_games_key_table', 61),
	(93, '2024_03_25_231103_add_mercado_pago_column_to_gateways_table', 62),
	(94, '2024_03_30_215051_add_social_to_custom_layouts_table', 63),
	(98, '2024_03_30_225900_create_digito_pay_payments_table', 66),
	(96, '2024_03_30_225929_add_digitopay_to_gateways_table', 64),
	(97, '2024_03_31_124211_add_digitopay_to_settings_table', 65),
	(99, '2024_04_02_140932_add_default_gateway_to_settings_table', 67),
	(100, '2024_03_08_201557_add_imperium_games_to_games_keys_table', 68),
	(101, '2024_04_12_201402_add_hash_to_transactions_table', 69);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.missions
CREATE TABLE IF NOT EXISTS `missions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `challenge_name` varchar(191) NOT NULL,
  `challenge_description` text NOT NULL,
  `challenge_rules` text NOT NULL,
  `challenge_type` varchar(20) NOT NULL DEFAULT 'game',
  `challenge_link` varchar(191) DEFAULT NULL,
  `challenge_start_date` datetime NOT NULL,
  `challenge_end_date` datetime NOT NULL,
  `challenge_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `challenge_total` bigint(20) NOT NULL DEFAULT 1,
  `challenge_currency` varchar(5) NOT NULL,
  `challenge_provider` varchar(50) DEFAULT NULL,
  `challenge_gameid` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.missions: 0 rows
/*!40000 ALTER TABLE `missions` DISABLE KEYS */;
/*!40000 ALTER TABLE `missions` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.mission_users
CREATE TABLE IF NOT EXISTS `mission_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `mission_id` int(10) unsigned NOT NULL,
  `rounds` bigint(20) DEFAULT 0,
  `rewards` decimal(10,2) DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mission_users_user_id_index` (`user_id`) USING BTREE,
  KEY `mission_users_mission_id_index` (`mission_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- Copiando dados para a tabela chinesa.mission_users: 0 rows
/*!40000 ALTER TABLE `mission_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mission_users` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela chinesa.model_has_permissions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela chinesa.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela chinesa.model_has_roles: ~1 rows (aproximadamente)
INSERT IGNORE INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1);

-- Copiando estrutura para tabela chinesa.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.notifications: 0 rows
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `session_id` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `game` varchar(191) NOT NULL,
  `game_uuid` varchar(191) NOT NULL,
  `type` varchar(50) NOT NULL,
  `type_money` varchar(50) NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `providers` varchar(191) NOT NULL,
  `refunded` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `round_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `orders_user_id_foreign` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.orders: 0 rows
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.password_reset_tokens: 0 rows
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela chinesa.permissions: ~40 rows (aproximadamente)
INSERT IGNORE INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'games-exclusive-edit', 'web', '2023-10-12 16:23:45', '2023-10-12 18:12:28'),
	(2, 'games-exclusive-view', 'web', '2023-10-12 16:23:56', '2023-10-12 18:11:25'),
	(3, 'games-exclusive-create', 'web', '2023-10-12 16:25:06', '2023-10-12 18:11:10'),
	(4, 'admin-view', 'web', '2023-10-12 17:56:35', '2023-10-12 17:56:35'),
	(5, 'admin-create', 'web', '2023-10-12 18:56:02', '2023-10-12 18:56:02'),
	(6, 'admin-edit', 'web', '2023-10-12 18:56:27', '2023-10-12 18:56:27'),
	(7, 'admin-delete', 'web', '2023-10-12 18:56:55', '2023-10-12 18:56:55'),
	(8, 'category-view', 'web', '2023-10-12 19:01:31', '2023-10-12 19:01:31'),
	(9, 'category-create', 'web', '2023-10-12 19:01:46', '2023-10-12 19:01:46'),
	(10, 'category-edit', 'web', '2023-10-12 19:01:59', '2023-10-12 19:01:59'),
	(11, 'category-delete', 'web', '2023-10-12 19:02:09', '2023-10-12 19:02:09'),
	(12, 'game-view', 'web', '2023-10-12 19:02:27', '2023-10-12 19:02:27'),
	(13, 'game-create', 'web', '2023-10-12 19:02:36', '2023-10-12 19:02:36'),
	(14, 'game-edit', 'web', '2023-10-12 19:02:44', '2023-10-12 19:02:44'),
	(15, 'game-delete', 'web', '2023-10-12 19:02:54', '2023-10-12 19:02:54'),
	(16, 'wallet-view', 'web', '2023-10-12 19:05:49', '2023-10-12 19:05:49'),
	(17, 'wallet-create', 'web', '2023-10-12 19:06:01', '2023-10-12 19:06:01'),
	(18, 'wallet-edit', 'web', '2023-10-12 19:06:11', '2023-10-12 19:06:11'),
	(19, 'wallet-delete', 'web', '2023-10-12 19:06:18', '2023-10-12 19:06:18'),
	(20, 'deposit-view', 'web', '2023-10-12 19:06:44', '2023-10-12 19:06:44'),
	(21, 'deposit-create', 'web', '2023-10-12 19:06:56', '2023-10-12 19:06:56'),
	(22, 'deposit-edit', 'web', '2023-10-12 19:07:05', '2023-10-12 19:07:05'),
	(23, 'deposit-update', 'web', '2023-10-12 19:08:00', '2023-10-12 19:08:00'),
	(24, 'deposit-delete', 'web', '2023-10-12 19:08:11', '2023-10-12 19:08:11'),
	(25, 'withdrawal-view', 'web', '2023-10-12 19:09:31', '2023-10-12 19:09:31'),
	(26, 'withdrawal-create', 'web', '2023-10-12 19:09:40', '2023-10-12 19:09:40'),
	(27, 'withdrawal-edit', 'web', '2023-10-12 19:09:51', '2023-10-12 19:09:51'),
	(28, 'withdrawal-update', 'web', '2023-10-12 19:10:00', '2023-10-12 19:10:00'),
	(29, 'withdrawal-delete', 'web', '2023-10-12 19:10:09', '2023-10-12 19:10:09'),
	(30, 'order-view', 'web', '2023-10-12 19:12:36', '2023-10-12 19:12:36'),
	(31, 'order-create', 'web', '2023-10-12 19:12:47', '2023-10-12 19:12:47'),
	(32, 'order-edit', 'web', '2023-10-12 19:12:56', '2023-10-12 19:12:56'),
	(33, 'order-update', 'web', '2023-10-12 19:13:06', '2023-10-12 19:13:06'),
	(34, 'order-delete', 'web', '2023-10-12 19:13:19', '2023-10-12 19:13:19'),
	(35, 'admin-menu-view', 'web', '2023-10-12 20:26:06', '2023-10-12 20:26:06'),
	(36, 'setting-view', 'web', '2023-10-12 21:25:46', '2023-10-12 21:25:46'),
	(37, 'setting-create', 'web', '2023-10-12 21:25:57', '2023-10-12 21:25:57'),
	(38, 'setting-edit', 'web', '2023-10-12 21:26:06', '2023-10-12 21:26:06'),
	(39, 'setting-update', 'web', '2023-10-12 21:26:19', '2023-10-12 21:26:19'),
	(40, 'setting-delete', 'web', '2023-10-12 21:26:33', '2023-10-12 21:26:33');

-- Copiando estrutura para tabela chinesa.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.personal_access_tokens: 0 rows
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.providers
CREATE TABLE IF NOT EXISTS `providers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cover` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `rtp` bigint(20) DEFAULT 90,
  `views` bigint(20) DEFAULT 1,
  `distribution` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.providers: 36 rows
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT IGNORE INTO `providers` (`id`, `cover`, `code`, `name`, `status`, `rtp`, `views`, `distribution`, `created_at`, `updated_at`) VALUES
	(162, NULL, 'MICROCASINO_GOLD', 'Micro Casino', 1, 90, 1, 'worldslot', '2024-04-27 11:29:22', '2024-04-27 11:29:22'),
	(161, NULL, 'EZUGI_GOLD', 'Ezugi Casino', 1, 90, 1, 'worldslot', '2024-04-27 11:29:22', '2024-04-27 11:29:22'),
	(160, NULL, 'DREAM_GOLD', 'Dream Casino', 1, 90, 1, 'worldslot', '2024-04-27 11:29:22', '2024-04-27 11:29:22'),
	(159, NULL, 'BIGGAMING_GOLD', 'Big Casino', 1, 90, 1, 'worldslot', '2024-04-27 11:29:22', '2024-04-27 11:29:22'),
	(158, NULL, 'EVOLUTION_GOLD', 'Evolution Casino', 1, 90, 1, 'worldslot', '2024-04-27 11:29:22', '2024-04-27 11:29:22'),
	(157, NULL, 'GMW', 'GMW', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(156, NULL, 'REDTIGER', 'RedTiger', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(155, NULL, 'MICROGAMING', 'MicroGaming', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(154, NULL, 'PGSOFT', 'PGSoft', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(153, NULL, 'GENESIS', 'Genesis', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(152, NULL, 'DREAMTECH', 'Dreamtech', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(151, NULL, 'TOPTREND', 'Toptrend', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(150, NULL, 'EVOPLAY', 'Evoplay', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(149, NULL, 'CQ9', 'CQ9', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(148, NULL, 'PLAYSON', 'Playson', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(147, NULL, 'BOOONGO', 'Booongo', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(146, NULL, 'HABANERO', 'Habanero', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(145, NULL, 'REELKINGDOM', 'ReelKingdom', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(144, NULL, 'PRAGMATIC', 'PragmaticPlay', 1, 90, 1, 'worldslot', '2024-04-27 11:29:19', '2024-04-27 11:29:19'),
	(163, NULL, 'PRAGMATIC', 'Megaways', 1, 90, 1, 'worldslot', '2024-04-27 17:05:36', '2024-04-27 17:06:08'),
	(164, NULL, 'PGSOFT', 'PGSoft Games', 1, 90, 1, 'evergame', '2024-05-09 16:28:22', '2024-05-13 13:54:02'),
	(165, NULL, 'Ever_Mini', 'Jogos Crash', 1, 90, 1, 'evergame', '2024-05-13 19:09:03', '2024-05-13 19:09:03'),
	(166, NULL, 'Evolution_Casino', 'Evolution Games', 1, 90, 1, 'evergame', '2024-06-10 15:59:29', '2024-06-10 16:03:25'),
	(167, NULL, 'Dream_Casino', 'Dream', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51'),
	(168, NULL, 'Ezugi_Casino', 'Ezugi', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51'),
	(169, NULL, 'Micro_Casino', 'Micro', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51'),
	(170, NULL, 'Live_Sport', 'Live', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51'),
	(171, NULL, 'Booongo_Slot', 'Booongo', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51'),
	(172, NULL, 'CQ9_Slot', 'CQ9', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51'),
	(173, NULL, 'DreamTech_Slot', 'DreamTech', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51'),
	(174, NULL, 'Playson_Slot', 'Playson', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51'),
	(175, NULL, 'ReelKingDom_Slot', 'ReelKingDom', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51'),
	(176, NULL, 'TopTrend_Slot', 'TopTrend', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51'),
	(177, NULL, 'Habanero_Slot', 'Habanero', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51'),
	(178, NULL, 'PGSoft_Slot', 'PGSoft', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51'),
	(179, NULL, 'Pragmatic_Slot', 'Pragmatic', 1, 80, 1, 'evergame', '2024-06-26 17:53:51', '2024-06-26 17:53:51');
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela chinesa.roles: ~2 rows (aproximadamente)
INSERT IGNORE INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'web', '2023-10-12 16:20:41', '2023-10-12 16:20:41'),
	(2, 'afiliado', 'web', '2023-10-12 16:21:08', '2023-10-12 16:21:08');

-- Copiando estrutura para tabela chinesa.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela chinesa.role_has_permissions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela chinesa.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `software_name` varchar(255) DEFAULT NULL,
  `software_description` varchar(255) DEFAULT NULL,
  `software_favicon` varchar(255) DEFAULT NULL,
  `software_logo_white` varchar(255) DEFAULT NULL,
  `software_logo_black` varchar(255) DEFAULT NULL,
  `software_background` varchar(255) DEFAULT NULL,
  `currency_code` varchar(191) NOT NULL DEFAULT 'BRL',
  `decimal_format` varchar(20) NOT NULL DEFAULT 'dot',
  `currency_position` varchar(20) NOT NULL DEFAULT 'left',
  `revshare_percentage` bigint(20) DEFAULT 20,
  `ngr_percent` bigint(20) DEFAULT 20,
  `soccer_percentage` bigint(20) DEFAULT 30,
  `prefix` varchar(191) NOT NULL DEFAULT 'R$',
  `storage` varchar(191) NOT NULL DEFAULT 'local',
  `initial_bonus` bigint(20) DEFAULT 0,
  `min_deposit` int(11) DEFAULT NULL,
  `max_deposit` int(11) DEFAULT NULL,
  `min_withdrawal` int(11) DEFAULT NULL,
  `max_withdrawal` int(11) DEFAULT NULL,
  `rollover` bigint(20) DEFAULT 10,
  `rollover_deposit` bigint(20) DEFAULT 1,
  `suitpay_is_enable` tinyint(4) DEFAULT 1,
  `stripe_is_enable` tinyint(4) DEFAULT 1,
  `bspay_is_enable` tinyint(4) DEFAULT 0,
  `sharkpay_is_enable` tinyint(4) DEFAULT 1,
  `turn_on_football` tinyint(4) DEFAULT 1,
  `revshare_reverse` tinyint(1) DEFAULT 1,
  `bonus_vip` bigint(20) DEFAULT 100,
  `activate_vip_bonus` tinyint(1) DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT NULL,
  `maintenance_mode` tinyint(4) DEFAULT 0,
  `withdrawal_limit` bigint(20) DEFAULT NULL,
  `withdrawal_period` varchar(30) DEFAULT NULL,
  `disable_spin` tinyint(1) NOT NULL DEFAULT 0,
  `perc_sub_lv1` bigint(20) NOT NULL DEFAULT 4,
  `perc_sub_lv2` bigint(20) NOT NULL DEFAULT 2,
  `perc_sub_lv3` bigint(20) NOT NULL DEFAULT 3,
  `disable_rollover` tinyint(4) DEFAULT 0,
  `rollover_protection` bigint(20) NOT NULL DEFAULT 1,
  `cpa_baseline` decimal(10,2) DEFAULT NULL,
  `cpa_value` decimal(10,2) DEFAULT NULL,
  `cpa_percentage_baseline` decimal(10,2) DEFAULT NULL,
  `cpa_percentage` varchar(255) DEFAULT NULL,
  `mercadopago_is_enable` tinyint(4) DEFAULT 0,
  `digitopay_is_enable` tinyint(4) NOT NULL DEFAULT 0,
  `default_gateway` varchar(191) NOT NULL DEFAULT 'digitopay',
  `trunk_baseline` decimal(20,2) NOT NULL DEFAULT 20.00,
  `trunk_aposta` decimal(20,2) NOT NULL DEFAULT 20.00,
  `trunk_valor` decimal(20,2) NOT NULL DEFAULT 20.00,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.settings: 1 rows
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT IGNORE INTO `settings` (`id`, `software_name`, `software_description`, `software_favicon`, `software_logo_white`, `software_logo_black`, `software_background`, `currency_code`, `decimal_format`, `currency_position`, `revshare_percentage`, `ngr_percent`, `soccer_percentage`, `prefix`, `storage`, `initial_bonus`, `min_deposit`, `max_deposit`, `min_withdrawal`, `max_withdrawal`, `rollover`, `rollover_deposit`, `suitpay_is_enable`, `stripe_is_enable`, `bspay_is_enable`, `sharkpay_is_enable`, `turn_on_football`, `revshare_reverse`, `bonus_vip`, `activate_vip_bonus`, `updated_at`, `maintenance_mode`, `withdrawal_limit`, `withdrawal_period`, `disable_spin`, `perc_sub_lv1`, `perc_sub_lv2`, `perc_sub_lv3`, `disable_rollover`, `rollover_protection`, `cpa_baseline`, `cpa_value`, `cpa_percentage_baseline`, `cpa_percentage`, `mercadopago_is_enable`, `digitopay_is_enable`, `default_gateway`, `trunk_baseline`, `trunk_aposta`, `trunk_valor`) VALUES
	(1, 'SpacePIX', 'Os melhores jogos de cassino e slots com PIX automático.', 'uploads/T7SvmQ06jV9w2HjjfCNDxye30V02U5KsvsudJtRW.png', 'uploads/YjQpMzIa2VnjA1MhQJrowvCXcCtHmhWq2nQ9RizD.png', 'uploads/4E3Ixf2kCB19oApJ1tU7JaUAG19a0dhjPNTuMbSQ.png', '[]', 'BRL', 'dot', 'left', 0, 0, 30, 'R$', 'local', 25, 1, 10000, 20, 2000, 10, 1, 0, 0, 1, 0, 0, 1, 1, 0, '2024-06-26 20:59:04', 0, 100, 'daily', 1, 10, 0, 0, 0, 5, 20.00, 15.00, 30.00, '50', 0, 1, 'digitopay', 50.00, 30.00, 50.00);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.setting_mails
CREATE TABLE IF NOT EXISTS `setting_mails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `software_smtp_type` varchar(30) DEFAULT NULL,
  `software_smtp_mail_host` varchar(100) DEFAULT NULL,
  `software_smtp_mail_port` varchar(30) DEFAULT NULL,
  `software_smtp_mail_username` varchar(191) DEFAULT NULL,
  `software_smtp_mail_password` varchar(100) DEFAULT NULL,
  `software_smtp_mail_encryption` varchar(30) DEFAULT NULL,
  `software_smtp_mail_from_address` varchar(191) DEFAULT NULL,
  `software_smtp_mail_from_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.setting_mails: 0 rows
/*!40000 ALTER TABLE `setting_mails` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_mails` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.sub_affiliates
CREATE TABLE IF NOT EXISTS `sub_affiliates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sub_affiliates_affiliate_id_index` (`affiliate_id`) USING BTREE,
  KEY `sub_affiliates_user_id_index` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- Copiando dados para a tabela chinesa.sub_affiliates: 0 rows
/*!40000 ALTER TABLE `sub_affiliates` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_affiliates` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.suit_pay_payments
CREATE TABLE IF NOT EXISTS `suit_pay_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `withdrawal_id` bigint(20) unsigned NOT NULL,
  `pix_key` varchar(191) DEFAULT NULL,
  `pix_type` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `observation` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `suit_pay_payments_user_id_foreign` (`user_id`) USING BTREE,
  KEY `suit_pay_payments_withdrawal_id_foreign` (`withdrawal_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.suit_pay_payments: 0 rows
/*!40000 ALTER TABLE `suit_pay_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `suit_pay_payments` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.system_wallets
CREATE TABLE IF NOT EXISTS `system_wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` char(32) NOT NULL,
  `balance` decimal(27,12) NOT NULL DEFAULT 0.000000000000,
  `balance_min` decimal(27,12) NOT NULL DEFAULT 10000.100000000000,
  `pay_upto_percentage` decimal(4,2) NOT NULL DEFAULT 45.00,
  `mode` enum('balance_min','percentage') NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- Copiando dados para a tabela chinesa.system_wallets: 1 rows
/*!40000 ALTER TABLE `system_wallets` DISABLE KEYS */;
INSERT IGNORE INTO `system_wallets` (`id`, `label`, `balance`, `balance_min`, `pay_upto_percentage`, `mode`, `created_at`, `updated_at`) VALUES
	(1, 'system', 261.800000000000, 10000.100000000000, 45.00, 'percentage', '2023-10-11 16:11:15', '2023-10-16 18:42:00');
/*!40000 ALTER TABLE `system_wallets` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(100) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(20) NOT NULL DEFAULT 'usd',
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `accept_bonus` tinyint(1) NOT NULL DEFAULT 1,
  `hash` varchar(191) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `transactions_user_id_index` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.transactions: 0 rows
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `oauth_id` varchar(191) DEFAULT NULL,
  `oauth_type` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `logged_in` tinyint(4) NOT NULL DEFAULT 0,
  `banned` tinyint(4) NOT NULL DEFAULT 0,
  `inviter` int(11) DEFAULT NULL,
  `inviter_code` varchar(25) DEFAULT NULL,
  `affiliate_revenue_share` bigint(20) NOT NULL DEFAULT 2,
  `affiliate_revenue_share_fake` bigint(20) DEFAULT NULL,
  `affiliate_cpa` decimal(20,2) NOT NULL DEFAULT 10.00,
  `affiliate_percentage_cpa` decimal(10,2) DEFAULT NULL,
  `affiliate_percentage_baseline` varchar(255) DEFAULT NULL,
  `affiliate_baseline` decimal(20,2) NOT NULL DEFAULT 40.00,
  `is_demo_agent` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `language` varchar(191) NOT NULL DEFAULT 'pt_BR',
  `role_id` int(11) DEFAULT 3,
  `affiliate_bau_baseline` decimal(20,2) NOT NULL DEFAULT 20.00,
  `affiliate_bau_value` decimal(20,2) NOT NULL DEFAULT 20.00,
  `affiliate_bau_aposta` decimal(20,2) NOT NULL DEFAULT 20.00,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.users: ~1 rows (aproximadamente)
INSERT IGNORE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `oauth_id`, `oauth_type`, `avatar`, `last_name`, `cpf`, `phone`, `logged_in`, `banned`, `inviter`, `inviter_code`, `affiliate_revenue_share`, `affiliate_revenue_share_fake`, `affiliate_cpa`, `affiliate_percentage_cpa`, `affiliate_percentage_baseline`, `affiliate_baseline`, `is_demo_agent`, `status`, `language`, `role_id`, `affiliate_bau_baseline`, `affiliate_bau_value`, `affiliate_bau_aposta`) VALUES
	(1, 'Admin', '31992812273@gmail.com', NULL, '$2y$10$lWdiLbw4XGNy8mR2DLnSVuKUOeKK1Bf4HtQu6nnCqT8hBXvS15dMy', 'qVMR0ydCLreiMxIxpfXMHlvYeKaJXdfTBIGJm6tO7FBa1IvpGsgatauQPTHU', '2023-11-07 22:15:13', '2024-04-30 18:50:50', NULL, NULL, 'uploads/8lx3OeL0c6GX18GMIhbgf2Kj4JVew0NRmnTUYYSb.png', NULL, NULL, NULL, 0, 0, NULL, 'IL9O93HOCY', 20, NULL, 10.00, NULL, NULL, 40.00, 0, 'active', 'pt_BR', 1, 20.00, 20.00, 20.00);

-- Copiando estrutura para tabela chinesa.vips
CREATE TABLE IF NOT EXISTS `vips` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bet_symbol` varchar(255) NOT NULL,
  `bet_level` bigint(20) NOT NULL DEFAULT 1,
  `bet_required` bigint(20) DEFAULT NULL,
  `bet_period` varchar(191) DEFAULT NULL,
  `bet_bonus` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.vips: 0 rows
/*!40000 ALTER TABLE `vips` DISABLE KEYS */;
/*!40000 ALTER TABLE `vips` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.vip_users
CREATE TABLE IF NOT EXISTS `vip_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `vip_id` int(10) unsigned NOT NULL,
  `level` bigint(20) NOT NULL,
  `points` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `vip_users_user_id_index` (`user_id`) USING BTREE,
  KEY `vip_users_vip_id_index` (`vip_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- Copiando dados para a tabela chinesa.vip_users: 0 rows
/*!40000 ALTER TABLE `vip_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `vip_users` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.wallets
CREATE TABLE IF NOT EXISTS `wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `currency` varchar(20) NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_bonus_rollover` decimal(10,2) DEFAULT 0.00,
  `balance_deposit_rollover` decimal(10,2) DEFAULT 0.00,
  `balance_withdrawal` decimal(10,2) DEFAULT 0.00,
  `balance_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_cryptocurrency` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `balance_demo` decimal(20,8) DEFAULT 1000.00000000,
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT 0.00,
  `hide_balance` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_won` bigint(20) NOT NULL DEFAULT 0,
  `total_lose` bigint(20) NOT NULL DEFAULT 0,
  `last_won` bigint(20) NOT NULL DEFAULT 0,
  `last_lose` bigint(20) NOT NULL DEFAULT 0,
  `vip_level` bigint(20) DEFAULT 0,
  `vip_points` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `wallets_user_id_index` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.wallets: 1 rows
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT IGNORE INTO `wallets` (`id`, `user_id`, `currency`, `symbol`, `balance`, `balance_bonus_rollover`, `balance_deposit_rollover`, `balance_withdrawal`, `balance_bonus`, `balance_cryptocurrency`, `balance_demo`, `refer_rewards`, `hide_balance`, `active`, `created_at`, `updated_at`, `total_bet`, `total_won`, `total_lose`, `last_won`, `last_lose`, `vip_level`, `vip_points`) VALUES
	(1, 1, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 5900.00, 0, 1, '2023-11-07 22:15:13', '2024-06-26 15:15:59', 0.00, 0, 0, 0, 0, 1, 10000);
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.wallet_changes
CREATE TABLE IF NOT EXISTS `wallet_changes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(100) DEFAULT NULL,
  `change` varchar(50) DEFAULT NULL,
  `value_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_total` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_roi` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_entry` decimal(20,2) NOT NULL DEFAULT 0.00,
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT 0.00,
  `game` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `wallet_changes_user_id_foreign` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.wallet_changes: 0 rows
/*!40000 ALTER TABLE `wallet_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_changes` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.websockets_statistics_entries
CREATE TABLE IF NOT EXISTS `websockets_statistics_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(191) NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.websockets_statistics_entries: 0 rows
/*!40000 ALTER TABLE `websockets_statistics_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `websockets_statistics_entries` ENABLE KEYS */;

-- Copiando estrutura para tabela chinesa.withdrawals
CREATE TABLE IF NOT EXISTS `withdrawals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` varchar(191) DEFAULT NULL,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `pix_key` varchar(191) DEFAULT NULL,
  `pix_type` varchar(191) DEFAULT NULL,
  `bank_info` text DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `withdrawals_user_id_foreign` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela chinesa.withdrawals: 0 rows
/*!40000 ALTER TABLE `withdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdrawals` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
