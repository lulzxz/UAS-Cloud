-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 22, 2023 at 06:26 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` bigint NOT NULL,
  `judul_website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `atas_nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rekening` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `judul_website`, `logo`, `deskripsi`, `alamat`, `email`, `telepon`, `created_at`, `updated_at`, `atas_nama`, `rekening`) VALUES
(1, 'Ecommerce', 'the_oasis.jpg', 'hehe', 'Jln Situdarma no 6', 'mirsabanwar@gmail.com', '0881023579090', '2023-12-10 13:27:03', '2023-12-13 10:20:24', 'Mirsab Anwar', '1529510742');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `id_member` int NOT NULL,
  `id_barang` int NOT NULL,
  `jumlah` int NOT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int NOT NULL,
  `is_checkout` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `id_member`, `id_barang`, `jumlah`, `size`, `color`, `total`, `is_checkout`, `created_at`, `updated_at`) VALUES
(7, 6, 13, 1, 'S', 'Pink', 189000, 1, '2023-12-19 19:31:12', '2023-12-19 19:31:51');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_kategori` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nama_kategori`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(5, 'FOR HER', 'Best Selling Deals', '17022183404,jpg', '2023-12-10 07:25:40', '2023-12-10 07:25:40'),
(6, 'ACCESORIES', 'New Trends', '17022183539,jpg', '2023-12-10 07:25:53', '2023-12-10 07:25:53'),
(7, 'FOR HIM', 'Exclusive Products', '17022184144,jpg', '2023-12-10 07:26:54', '2023-12-10 07:26:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_member` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `nama_member`, `no_hp`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'mirsab', '0881023579090', 'mirsabanwar@gmail.com', '$2y$12$xURvRr26j1hQBfYdhxbpveI18Bwik4n7WUhfcSRK0dMxa21dTNRvK', '2023-12-04 23:48:40', '2023-12-04 23:48:40'),
(2, 'sapira', '089630025755', 'nainciaa@gmail.com', '$2y$12$.5NnlNkmfMKWJTZqiZXAUOcwOlfA7O8bKIT6iECMJ20/TMACg2Q8q', '2023-12-09 04:56:00', '2023-12-09 04:56:00'),
(3, 'mirsab anwar', '0881023579090', 'mirsabanwar@gmail.com', '$2y$12$vnQrAfxlRQsozLJ5Z/LTCeHKLIJ/eKn3eQX1F9HQ1ZUK3rlcQTkVi', '2023-12-13 10:22:09', '2023-12-13 10:22:09'),
(4, 'mirsab anwar', '0881023579090', 'mirsabanwar@gmail.com', '$2y$12$kb//8lgEsdRB9gYobkW6ue0MIcY9KKUovoLJ7UffIswBf39YRUsZO', '2023-12-13 10:36:48', '2023-12-13 10:36:48'),
(5, 'kray', '087805704545', 'kray@gmail.com', '$2y$12$Rq2X80wefAMpJWqSBgqwx.Abi5qH6dNpA4bVeEsCgyYMpLx/7o0HK', '2023-12-18 22:06:20', '2023-12-18 22:06:20'),
(6, 'sapisapi', '0899999999', 'sapisapi@gmail.com', '$2y$12$FrFoOUoKT7K/pfaEjbxGhO9EYVfoSc1RuH0SBVVL7cDGaYvQoPNZW', '2023-12-19 19:30:33', '2023-12-19 19:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_12_065133_create_categories_table', 1),
(6, '2023_11_14_203024_create_subcategories_table', 1),
(7, '2023_11_16_193904_create_sliders_table', 1),
(8, '2023_11_17_154223_create_products_table', 1),
(9, '2023_11_17_160422_create_members_table', 1),
(10, '2023_11_17_162400_create_testimonis_table', 1),
(11, '2023_11_17_163904_create_reviews_table', 1),
(12, '2023_11_17_164740_create_orders_table', 1),
(13, '2023_11_17_170004_add_status_to_orders_table', 1),
(14, '2023_12_02_124350_modify_order_details_table', 1),
(15, '2023_12_02_132102_create_payments_table', 1),
(16, '2023_12_04_100653_create_about_table', 1),
(17, '2023_12_13_165406_add_rekening_to_about', 1),
(35, '2014_10_12_000000_create_users_table', 1),
(36, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(37, '2019_08_19_000000_create_failed_jobs_table', 1),
(38, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(39, '2023_11_12_065133_create_categories_table', 1),
(40, '2023_11_14_203024_create_subcategories_table', 1),
(41, '2023_11_16_193904_create_sliders_table', 1),
(42, '2023_11_17_154223_create_products_table', 1),
(43, '2023_11_17_160422_create_members_table', 1),
(44, '2023_11_17_162400_create_testimonis_table', 1),
(45, '2023_11_17_163904_create_reviews_table', 1),
(46, '2023_12_13_173356_drop_colomn_in_members', 2),
(47, '2023_12_13_201642_create_cart_table', 3),
(48, '2023_12_17_230902_add_id_member_to_payments', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `id_member` int NOT NULL,
  `invoice` int NOT NULL,
  `grand_total` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_member`, `invoice`, `grand_total`, `created_at`, `updated_at`, `status`) VALUES
(7, 1, 23121852, 1606000, '2023-12-18 12:26:52', '2023-12-18 12:35:10', 'Selesai'),
(8, 1, 23121804, 1860000, '2023-12-18 12:39:04', NULL, 'Baru'),
(9, 6, 23122040, 197000, '2023-12-19 19:31:40', '2023-12-19 19:32:30', 'Selesai'),
(10, 6, 23122051, 197000, '2023-12-19 19:31:51', '2023-12-19 19:32:33', 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `id_order` int NOT NULL,
  `id_produk` int NOT NULL,
  `jumlah` int NOT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `id_order`, `id_produk`, `jumlah`, `size`, `color`, `total`, `created_at`, `updated_at`) VALUES
(12, 9, 13, 1, 'S', 'Pink', 189000, '2023-12-19 19:31:40', NULL),
(13, 10, 13, 1, 'S', 'Pink', 189000, '2023-12-19 19:31:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `id_order` int NOT NULL,
  `jumlah` int NOT NULL,
  `provinsi` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kabupaten` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail_alamat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rekening` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `atas_nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_member` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `id_order`, `jumlah`, `provinsi`, `kabupaten`, `kecamatan`, `detail_alamat`, `no_rekening`, `atas_nama`, `status`, `created_at`, `updated_at`, `id_member`) VALUES
(2, 9, 197000, '9', '22', '', 'Cinunuk', '42394324432', 'Sapi', 'MENUNGGU', '2023-12-19 19:32:20', '2023-12-19 19:32:20', 6);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `id_kategori` int NOT NULL,
  `id_subkategori` int NOT NULL,
  `nama_barang` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int NOT NULL,
  `diskon` int NOT NULL,
  `bahan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ukuran` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `warna` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `id_kategori`, `id_subkategori`, `nama_barang`, `gambar`, `deskripsi`, `harga`, `diskon`, `bahan`, `tags`, `sku`, `ukuran`, `warna`, `created_at`, `updated_at`) VALUES
(12, 7, 11, 'Relaxed Fit T-Shirt', '17029676571,jpg', 'Introducing the “Relaxed Fit T-Shirt”, a unique and stylish choice for men. This t-shirt is made from high-quality polyester, ensuring both comfort and durability. Its vibrant yellow color adds a touch of energy and positivity, making it a standout piece in any wardrobe. The Relaxed Fit T-Shirt is more than just a clothing item, it’s a fashion statement. Embrace the boldness of the Relaxed Fit T-Shirt and let your style speak volumes.', 59000, 0, 'Polyester', 'Top', '20', 'S,M,L,XL,XXL', 'Kuning', '2023-12-10 17:36:37', '2023-12-18 23:34:17'),
(13, 5, 12, 'Knit Sweater', '17029680507,jpg', 'Unveiling the “Knit Sweater”, a perfect blend of comfort and style for women. This sweater is crafted from superior quality knit, ensuring warmth and longevity. Its unique color palette, featuring shades of pink, white, and blue, adds a touch of whimsy and charm, making it a standout piece in any wardrobe. Embrace the vibrancy of the Knit Sweater and let your style shine.', 189000, 0, 'Knit', 'Outwear', '24', 'S,M,L,XL,XXL', 'Pink', '2023-12-10 17:40:52', '2023-12-18 23:40:50'),
(15, 5, 14, 'Silk Shirt', '17029721324,jpg', 'Presenting the “Silk Shirt”, an embodiment of elegance and sophistication for women. This shirt is woven from the finest silk, promising a luxurious feel and longevity. Its pristine white color adds a touch of grace and versatility, making it an essential piece in any wardrobe. Embrace the allure of the Silk Shirt and let your style radiate.', 89000, 0, 'Silk', 'Top', '25', 'S,M,L,XL,XXL', 'Putih', '2023-12-10 17:48:55', '2023-12-19 00:48:52'),
(19, 6, 17, 'Wool-blend Twill Cap', '17029707802,jpg', 'Introducing the “Wool-blend Twill Cap”, a stylish and practical accessory for men. This cap is expertly crafted from a blend of high-quality wool and polyester, ensuring both comfort and durability. Its sleek black color adds a touch of sophistication, making it a versatile addition to any wardrobe. The Wool-Blend Twill Cap is more than just a cap, it’s a fashion statement. Embrace the elegance of the Wool-Blend Twill Cap and let your style speak volumes.', 99000, 0, 'Wool, Polyester', 'Hat', '23', 'ONESIZE', 'Hitam', '2023-12-12 11:26:07', '2023-12-19 00:26:20'),
(20, 5, 8, 'Maxi Dress', '17029714992,jpg', 'Introducing the “Maxi Dress”, an epitome of elegance for women. This dress is beautifully crafted from high-quality polyamide, ensuring both comfort and durability. Its pristine white color adds a touch of sophistication and purity, making it a perfect choice for any elegant occasion. The Maxi Dress is not just a dress, it’s a fashion statement. Experience the charm of the Maxi Dress and make a fashion statement wherever you go.', 3789000, 0, 'Polyamide', 'Dresses', '15', 'S,M,L,XL,XXL', 'Putih', '2023-12-12 11:27:16', '2023-12-19 00:38:19'),
(22, 7, 11, 'Slim Fit Premium Cotton Shirt', '17029710102,jpg', 'Introducing the “Slim Fit Premium Cotton Shirt”, a stylish and comfortable choice for men. This shirt is expertly crafted from premium quality cotton, ensuring both comfort and durability. Its vibrant red color adds a touch of boldness, making it a standout piece in any wardrobe. The Slim Fit Premium Cotton Shirt is more than just a shirt, it’s a fashion statement. Embrace the elegance of the Slim Fit Premium Cotton Shirt and let your style speak volumes.', 2899000, 0, 'Cotton', 'Top', '10', 'S,M,L,XL,XXL', 'Merah', '2023-12-12 11:28:39', '2023-12-19 00:30:10'),
(47, 7, 11, 'Regular Fit T-Shirt', '17029649391,jpg', 'A classic wardrobe staple for men. This T-Shirt is made from premium Cotton Combed 20s, ensuring maximum comfort and longevity. Its crisp white color lends a timeless appeal, making it versatile piece that can be styled in numerous ways. Experience the comfort and simplicity of the Regular Fit T-Shirt, a testament to understated style.', 129000, 0, 'Cotton Combed 20s', 'Top', '20', 'S,M,L,XL,XXL', 'Putih', '2023-12-18 22:03:52', '2023-12-18 22:48:59'),
(50, 7, 10, 'Biker Jacket', '17029652404,jpg', 'This jacket is meticulously crafted from genuine leather, offering durability and a luxurious feel. Its sleek black color adds a touch of sophistication and edge, making it an ideal choice for any outfit. This jacket just not just a piece of clothing, but an investment in style. Stand out in the crowd and make a bold statement with this timeless piece.', 1459999, 0, 'Leather', 'Outwear', '20', 'S,M,L,XL,XXL', 'Hitam', '2023-12-18 22:13:16', '2023-12-18 22:54:00'),
(52, 5, 12, 'Biker Jacket', '17029654107,jpg', 'Introducing the \"Biker Jacket\", a statement piece for women who dare to be different. This jacket is meticulously crafter from genuine leather, offering durability and a luxurious feel. Its sleek black color adds a touch of sophistication and edge, making it an ideal choice for any outfit. Designed for women, this jacket embodies strength, style, and elegance.', 1459999, 0, 'Leather', 'Outwear', '20', 'S,M,L,XL,XXL', 'Hitam', '2023-12-18 22:15:04', '2023-12-18 22:56:50'),
(53, 7, 10, 'Wool Blend Overshirt', '17029656191,jpg', 'A quintessential piece for men who appreciate style and comfort. This overshirt is expertly crafted from premium wool, offering warmth and durability. Its striking blue color adds a touch of class and versatility, making it a perfect addition to any wardrobe. Experience the sophistication of the Wool Blend Overshirt and make a lasting impression wherever you go. This is not just an outwear, it’s a statement of style and elegance. Stand out with this timeless piece that embodies the perfect blend of fashion and functionality.', 299000, 0, 'Wool', 'Outwear', '15', 'S,M,L,XL,XXL', 'Biru', '2023-12-18 22:17:24', '2023-12-18 23:00:19'),
(54, 7, 10, 'Vest Street Cream', '17029662819,jpg', 'Introducing the “Vest Street Cream”, a distinctive piece for men who value style and comfort. This vest is expertly crafted from high-quality wool, ensuring warmth and durability. Its elegant cream color adds a touch of sophistication, making it a versatile addition to any wardrobe. This is not just a vest, it’s a statement of style and elegance. Stand out with this timeless piece that perfectly blends fashion and functionality.', 239000, 10, 'Wool', 'Outwear', '25', 'S,M,L,XL,XXL', 'Cream', '2023-12-18 22:20:43', '2023-12-18 23:11:21'),
(55, 7, 10, 'Overshirt', '17029664166,jpg', 'Introducing the “Overshirt”, a stylish outwear piece for men. Its crisp white color adds a touch of sophistication and versatility, making it a perfect addition to any wardrobe. Experience the elegance of the Overshirt and make a lasting impression wherever you go. This is not just an outwear, it’s a statement of style and elegance. Stand out with this timeless piece that perfectly blends fashion and functionality.', 89000, 10, 'Polyester', 'Outwear', '15', 'S,M,L,XL,XXL', 'Putih', '2023-12-18 22:23:24', '2023-12-18 23:13:36'),
(56, 7, 11, 'Slim Fit Iron-shirt', '17029666289,jpg', 'Introducing the “Slim Fit Easy Iron-Shirt”, a stylish and practical choice for men. Its vibrant blue color adds a touch of sophistication, making it a versatile addition to any wardrobe. Experience the convenience of the Slim Fit Easy Iron-Shirt and make a lasting impression wherever you go. This is not just a shirt, it’s a statement of style and elegance. Stand out with this timeless piece that perfectly blends fashion and functionality.', 59000, 0, 'Cotton', 'Top', '24', 'S,M,L,XL,XXL', 'Biru', '2023-12-18 22:28:34', '2023-12-18 23:17:08'),
(57, 5, 8, 'Voluminous Tulle Dress', '17029645248,jpg', 'Introducing the \"Voluminous Tulle Dress\", a stunning piece for women. This dress is beautifully crafted from high-quality, ensuring both comfort and durability. Its vibrant pink color adds a touch of femininity and elegance. Experience the charm of the Voluminous Tulle Dress and make a fashion statement wherever you go.', 389000, 0, 'Polyester', 'Dresses', '20', 'S,M,L,XL,XXL', 'Pink', '2023-12-18 22:31:08', '2023-12-18 22:42:04'),
(58, 5, 9, 'Double-breasted Jacket', '17029667941,jpg', 'Introducing the “Double-breasted Jacket”, a chic and sophisticated choice for women. This blazer is expertly crafted from high-quality polyester, ensuring both comfort and durability. Its elegant broken white color adds a touch of class, making it a versatile addition to any wardrobe. Experience the elegance of the Double-breasted Jacket and make a lasting impression wherever you go.', 259000, 0, 'Polyester', 'Blazer', '20', 'S,M,L,XL,XXL', 'Broken White', '2023-12-18 22:33:44', '2023-12-18 23:19:54'),
(59, 5, 9, 'Oversized Blazer', '17029669393,jpg', 'Unveiling the “Oversized Blazer”, an epitome of style and comfort for women. This blazer, made from top-notch polyester, promises durability and a comfortable fit. Its unique orange color adds a vibrant touch, making it a standout piece in any wardrobe. The Oversized Blazer is more than just a clothing item, it’s a fashion statement. Embrace the boldness of the Oversized Blazer and let your style speak volumes.', 159000, 0, 'Polyester', 'Blazer', '25', 'S,M,L,XL,XXL', 'Oranye', '2023-12-18 22:35:30', '2023-12-18 23:22:19'),
(60, 5, 14, 'Star Tank Top', '17029725135,jpg', 'Introducing the “Star Tank Top”, a unique and stylish choice for women. This top is expertly crafted from high-quality polyester, ensuring both comfort and durability. Its sleek black color adds a touch of sophistication and versatility, making it a perfect addition to any wardrobe. What sets this top apart is the charming star image that adorns it, adding a touch of whimsy and fun. The Star Tank Top is more than just a top, it’s a fashion statement. Embrace the vibrancy of the Star Tank Top and let your style shine.', 199000, 0, 'Polyester', 'Top', '20', 'S,M,L,XL,XXL', 'Hitam', '2023-12-19 00:55:13', '2023-12-19 00:55:13'),
(61, 6, 15, 'Sunglasses', '17029727657,jpg', 'Introducing the “Black Sunglasses”, a timeless accessory for anyone seeking style and protection. These sunglasses are designed with high-quality lenses that shield your eyes from harmful UV rays, while the sleek black frames add a touch of sophistication to any outfit. The Black Sunglasses are not just an accessory, they’re a fashion statement. Experience the blend of style and functionality with these sunglasses and let your style speak volumes.', 50000, 0, 'Plastic', 'Glasses', '20', 'ONESIZE', 'Hitam', '2023-12-19 00:59:25', '2023-12-19 00:59:25');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `id_member` int NOT NULL,
  `id_produk` int NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_slider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `nama_slider`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Great Fashion 2023', 'New Arrivals Collection', '17022181888,jpg', '2023-12-04 07:40:07', '2023-12-10 07:23:08'),
(2, 'Exclusive Products', 'Get awesome items only in The Oasis Official Store', '17022181987,jpg', '2023-12-04 07:44:42', '2023-12-10 07:23:18'),
(3, 'Enjoy Online Shopping', 'Wear Better, Look Better', '17022182115,jpg', '2023-12-04 07:45:53', '2023-12-10 07:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint UNSIGNED NOT NULL,
  `id_kategori` int NOT NULL,
  `nama_subkategori` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `id_kategori`, `nama_subkategori`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(8, 5, 'DRESSES', 'Dresses for Women', '17022550843,jpg', '2023-12-10 17:35:04', '2023-12-10 17:38:04'),
(9, 5, 'BLAZER', 'Blazer for Women', '17022551261,jpg', '2023-12-10 17:38:46', '2023-12-10 17:38:46'),
(10, 7, 'OUTWEAR', 'Outwear for Men', '17022555007,jpg', '2023-12-10 17:45:00', '2023-12-10 17:45:00'),
(11, 7, 'TOP', 'Top for Men', '17022555362,jpg', '2023-12-10 17:45:36', '2023-12-10 17:45:36'),
(12, 5, 'OUTWEAR', 'Outwear for Women', '17022557812,jpg', '2023-12-10 17:49:41', '2023-12-10 17:49:41'),
(13, 5, 'SHOES', 'Shoes for Women', '17024053606,jpg', '2023-12-12 11:22:40', '2023-12-12 11:22:40'),
(14, 5, 'TOP', 'Top for Women', '17024063063,jpg', '2023-12-12 11:38:26', '2023-12-12 11:38:26'),
(15, 6, 'GLASSES', 'GLASSES FOR WOMEN AND MEN', '17024083686,jpg', '2023-12-12 12:12:48', '2023-12-12 12:12:48'),
(16, 6, 'BELT', 'Belt for Men and Women', '17024087338,jpg', '2023-12-12 12:18:53', '2023-12-12 12:18:53'),
(17, 6, 'HAT', 'Hat for Men and Women', '17024088365,jpg', '2023-12-12 12:20:36', '2023-12-12 12:20:36');

-- --------------------------------------------------------

--
-- Table structure for table `testimonis`
--

CREATE TABLE `testimonis` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_testimoni` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonis`
--

INSERT INTO `testimonis` (`id`, `nama_testimoni`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Mirsab Anwar', 'I’am amazed, I should say thank you so much for your awesome template. Design is so good and neat, every detail has been taken care these team are realy amazing and talented!', '17017072726,jpg', '2023-12-04 09:27:52', '2023-12-04 09:27:52'),
(3, 'Shafira Kurnia Fasya', 'Produknya kece-kece, 10/10 pokoknya', '17024099416,jpg', '2023-12-12 12:39:01', '2023-12-12 12:39:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', '2023-12-04 07:35:50', '$2y$12$bmwWsGb6TrwjmF87sKKTnezSEbP3PkaYh4LgeXaDs7M/8hr9ZK/Oq', NULL, '2023-12-04 07:35:50', '2023-12-04 07:35:50'),
(2, 'sapi', 'sapi@admin.com', '2023-12-09 11:52:06', 'admin', NULL, '2023-12-09 11:52:06', '2023-12-09 11:52:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonis`
--
ALTER TABLE `testimonis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `testimonis`
--
ALTER TABLE `testimonis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
