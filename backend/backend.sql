-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2024 at 05:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Demo User', 'demo@demo.com', NULL, '$2y$12$oJoyptuzCO1KZnlK0roeQeTNkIZiNdEnPC433Dh60Pktsa1WqDiT2', NULL, '2024-12-04 06:31:34', '2024-12-04 06:31:34'),
(2, 'test1', 'testone@gmail.com', NULL, '$2y$12$AS90av1YxpqSapBLP835Puv/F0fL9TeRBfC6nUok0dUaQVJDVKObe', NULL, '2024-12-05 08:30:52', '2024-12-05 08:30:52'),
(3, 'test2', 'testtwo@gmail.com', NULL, '$2y$12$AddYenfjCQgsbsmrxoycpOnbaxZzP92c00CBtrD9czYWFRAgxiWNe', NULL, '2024-12-05 08:32:33', '2024-12-05 08:32:33'),
(4, 'sanduni', 'sanduni@gmail.com', NULL, '$2y$12$RlQ/AHKF95esyRTqVrdCguNnjdPxJ8C4pDeKB/s48ck80GDIzVcC6', NULL, '2024-12-05 09:53:42', '2024-12-05 09:53:42'),
(5, 'nimendra', 'nim@gmail.com', NULL, '$2y$12$.StALfb9lIiS2THnlXGrA.q5EwD0/p3u7TnrHFs9uFh1se6SDANqC', NULL, '2024-12-05 09:57:45', '2024-12-05 09:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `customer_password_reset_tokens`
--

CREATE TABLE `customer_password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_sessions`
--

CREATE TABLE `customer_sessions` (
  `id` varchar(255) NOT NULL,
  `cus_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `cus_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `location` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `description`, `date`, `time`, `location`, `image`, `created_at`, `updated_at`) VALUES
(8, 'Event_01', 'Welcome to Event test one', '2024-12-06', '14:50:00', 'Padukka', 'event_images/gtmkiOJhRhhjubS0Vh9OpKYMM1Whb0xkZVEqD25d.jpg', '2024-12-04 03:51:05', '2024-12-04 06:21:35'),
(18, 'Event_02', 'Welcome To Event 02', '2024-12-06', '08:24:00', 'Panadura', 'event_images/C8pzgtRbiXUSZBpn8XRPOaWYqf35woGcrR9SaJYz.jpg', '2024-12-05 08:23:49', '2024-12-05 08:23:49'),
(19, 'Event_03', 'Welcome to Event 03', '2024-12-09', '11:28:00', 'Padukka, LKA', 'event_images/3n6CUHmFGUhnJsNamDanhhxwuDV2EksGIk3l6Z4i.jpg', '2024-12-05 08:24:26', '2024-12-05 08:24:26'),
(20, 'Event_04', 'Welcome To Event 04', '2024-12-15', '08:25:00', 'Malabe SLIIT', 'event_images/wUnCdjZ3W7oMoMk8oNnm0u51u6J2yjiAmujT0C6R.jpg', '2024-12-05 08:25:00', '2024-12-05 08:25:10'),
(21, 'Event_05', 'Welcome To Event 05', '2024-12-08', '08:26:00', 'Godagama', 'event_images/RfHHN7G1DksOIfXc8N5cbcnwnQibLQ6VAttxhb2g.jpg', '2024-12-05 08:25:43', '2024-12-05 08:25:43'),
(22, 'Event_06', 'Welcome To Event 06', '2024-12-14', '08:27:00', 'Godagama', 'event_images/jkc34MPVV3d9HeFdkr9F3wY3GoUCtsEDaJMxBaVg.jpg', '2024-12-05 08:26:13', '2024-12-05 08:26:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '0001_01_01_000000_create_users_table', 1),
(9, '0001_01_01_000001_create_cache_table', 1),
(10, '0001_01_01_000002_create_jobs_table', 1),
(11, '2024_12_01_174937_add_two_factor_columns_to_users_table', 1),
(12, '2024_12_01_175023_create_personal_access_tokens_table', 1),
(13, '2024_12_01_210700_create_customers_table', 1),
(14, '2024_12_02_224657_create_events_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Customer', 1, 'auth_token', '4053a85091c0a0681113339f0b3dec39262e3dbb71c23c83c5d2b9aec734b0c8', '[\"*\"]', NULL, NULL, '2024-12-04 06:31:35', '2024-12-04 06:31:35'),
(2, 'App\\Models\\Customer', 1, 'CustomerApp', 'fae7287cb24b9692ce805c332b41ed3ab87d00bc3e3473a4e1a23f22929f2a28', '[\"*\"]', NULL, NULL, '2024-12-04 16:41:49', '2024-12-04 16:41:49'),
(3, 'App\\Models\\Customer', 1, 'CustomerApp', '83422fad473e13ff8f4b6601183c34b5d293232b5b274b163a7836d63c5fffe3', '[\"*\"]', NULL, NULL, '2024-12-04 16:45:00', '2024-12-04 16:45:00'),
(4, 'App\\Models\\Customer', 1, 'CustomerApp', '3fa5918ccf58cf8ceab5cfc96a6ae709539e472ca85c8690aa3c0e567b234f3c', '[\"*\"]', NULL, NULL, '2024-12-04 16:48:06', '2024-12-04 16:48:06'),
(5, 'App\\Models\\Customer', 1, 'CustomerApp', '2477e4e68a06c43467d6f1c2f2f65a772a8f03e9239b0aff2d098909d6b18c46', '[\"*\"]', NULL, NULL, '2024-12-04 16:49:27', '2024-12-04 16:49:27'),
(6, 'App\\Models\\Customer', 1, 'CustomerApp', 'e12ad42ac950cd8eea704f73626ab0362cece69a7b8d98a605da013f854231de', '[\"*\"]', NULL, NULL, '2024-12-04 16:50:32', '2024-12-04 16:50:32'),
(7, 'App\\Models\\Customer', 1, 'CustomerApp', 'af004a20891ecd75f056fe93b0336a0aa28a4a85c3bca610b07997ddd7b29559', '[\"*\"]', NULL, NULL, '2024-12-04 16:52:56', '2024-12-04 16:52:56'),
(8, 'App\\Models\\Customer', 1, 'CustomerApp', '65c522c198d678257bc7289e5786d164fee92b38058312dc738914feec796dd5', '[\"*\"]', NULL, NULL, '2024-12-05 01:58:17', '2024-12-05 01:58:17'),
(9, 'App\\Models\\Customer', 1, 'CustomerApp', 'f5c04182404cac2f03464a9540292e2d44c090e3649aa3d919b2d864183682ee', '[\"*\"]', NULL, NULL, '2024-12-05 02:09:23', '2024-12-05 02:09:23'),
(10, 'App\\Models\\Customer', 1, 'CustomerApp', 'b5c231d89ce2e9e1c21fa88b55e92ab80a8b7654598b2e0080a915faaca7fb40', '[\"*\"]', NULL, NULL, '2024-12-05 02:12:02', '2024-12-05 02:12:02'),
(11, 'App\\Models\\Customer', 1, 'CustomerApp', '3fa42867fe54d0dfa46634ec9571beb743449bbeb9216c65a79cb5aa4974d70a', '[\"*\"]', NULL, NULL, '2024-12-05 02:12:53', '2024-12-05 02:12:53'),
(12, 'App\\Models\\Customer', 1, 'CustomerApp', 'e8d03f27a9128ba26ca7a3a3db09da1558a14f58d927b7f87160f7acd32e5234', '[\"*\"]', NULL, NULL, '2024-12-05 02:27:17', '2024-12-05 02:27:17'),
(13, 'App\\Models\\Customer', 1, 'CustomerApp', 'a1bc554bc93a45dbeaa60ef615afc5b6873108be85809e37b933cf16e8ff9223', '[\"*\"]', NULL, NULL, '2024-12-05 02:27:54', '2024-12-05 02:27:54'),
(14, 'App\\Models\\Customer', 1, 'CustomerApp', '173e9cbdd57d39548d892cf12074772a4a5dc5183c753101c52bb5d169a2241a', '[\"*\"]', NULL, NULL, '2024-12-05 02:28:20', '2024-12-05 02:28:20'),
(15, 'App\\Models\\Customer', 1, 'CustomerApp', '73c937453fb2b754f290e82dccd5f2251f2483c1cee085b1ca0273b65f40a440', '[\"*\"]', NULL, NULL, '2024-12-05 02:33:06', '2024-12-05 02:33:06'),
(16, 'App\\Models\\Customer', 1, 'CustomerApp', '6b861cffec3a037ab75be458ca4a46acbe49cff8f8177f74a1e9546fabeba372', '[\"*\"]', NULL, NULL, '2024-12-05 02:35:27', '2024-12-05 02:35:27'),
(17, 'App\\Models\\Customer', 1, 'CustomerApp', '2f2f31e615e3c5acbc121b30b5d9f1f2b6c2f047887dcead4dd0093656b442b1', '[\"*\"]', NULL, NULL, '2024-12-05 02:38:00', '2024-12-05 02:38:00'),
(18, 'App\\Models\\Customer', 1, 'CustomerApp', '00ad798eb9e45d75253f0c886fe3a120ac54836c50dfe38fd9470a25509ebb92', '[\"*\"]', NULL, NULL, '2024-12-05 02:39:39', '2024-12-05 02:39:39'),
(19, 'App\\Models\\Customer', 1, 'CustomerApp', '8f1a1476f2ae1277674a05bae3020b85ce52d400f1073b6179fb1c8bae2051ad', '[\"*\"]', NULL, NULL, '2024-12-05 02:46:04', '2024-12-05 02:46:04'),
(20, 'App\\Models\\Customer', 1, 'CustomerApp', '8a4d8b4c2b928f919031d8f97bb99cfd3f7a1b38e4b9d8357364c4156e0075a3', '[\"*\"]', NULL, NULL, '2024-12-05 02:53:54', '2024-12-05 02:53:54'),
(21, 'App\\Models\\Customer', 1, 'CustomerApp', '40310a5a329aa785504d6b4ba460236f6785a51c2b46ddb4c1836d4aea8a4d88', '[\"*\"]', NULL, NULL, '2024-12-05 03:00:19', '2024-12-05 03:00:19'),
(22, 'App\\Models\\Customer', 1, 'CustomerApp', '10117201a6287cdcc49f9172f1bd1cf5995894ff684bb5f353a708df65ada7e6', '[\"*\"]', NULL, NULL, '2024-12-05 03:03:12', '2024-12-05 03:03:12'),
(23, 'App\\Models\\Customer', 1, 'CustomerApp', '2db1da59c7f4eca2d71bddc87ea282648340c02cba719d7bb602c11811f178a1', '[\"*\"]', NULL, NULL, '2024-12-05 03:49:54', '2024-12-05 03:49:54'),
(24, 'App\\Models\\Customer', 1, 'CustomerApp', 'b767eaf4eca1b2a9fc083d174c36a2c85332a44ad9625ed4e0812e34d6410fe5', '[\"*\"]', NULL, NULL, '2024-12-05 03:50:20', '2024-12-05 03:50:20'),
(25, 'App\\Models\\Customer', 1, 'CustomerApp', 'e2773fa65c528f152e5ece622c68ae09888e368dd68f005d6fb6f9df4ea21911', '[\"*\"]', NULL, NULL, '2024-12-05 03:52:15', '2024-12-05 03:52:15'),
(26, 'App\\Models\\Customer', 1, 'CustomerApp', 'e54262a916468e164f68194825d31b0986a5ff76242bd34fb5ad484da720af06', '[\"*\"]', NULL, NULL, '2024-12-05 03:54:29', '2024-12-05 03:54:29'),
(27, 'App\\Models\\Customer', 1, 'CustomerApp', 'c8e7c6ce834d37345bb638d5c23d36154fc77078759769127415e897d7bc0d12', '[\"*\"]', NULL, NULL, '2024-12-05 03:57:24', '2024-12-05 03:57:24'),
(28, 'App\\Models\\Customer', 1, 'CustomerApp', 'c0759af557f0f1a72a08cf77a857c124cc616528e1aa604c60a15a921a3f6462', '[\"*\"]', NULL, NULL, '2024-12-05 04:00:41', '2024-12-05 04:00:41'),
(29, 'App\\Models\\Customer', 1, 'CustomerApp', 'af8bb9140fcffb41333ab6d9fbe59a9cbae0896c1e0874cef05b213dca7c5b4b', '[\"*\"]', NULL, NULL, '2024-12-05 04:13:58', '2024-12-05 04:13:58'),
(30, 'App\\Models\\Customer', 1, 'CustomerApp', '14a0d1ba37bd5d2716114a9de55d2caf9e63fe55a43109d9b67bb89acb5cfd14', '[\"*\"]', NULL, NULL, '2024-12-05 04:15:10', '2024-12-05 04:15:10'),
(31, 'App\\Models\\Customer', 1, 'CustomerApp', 'e856a1e4030a155e4b92241545031c8cc41912a3c80a924447191ffa905562a5', '[\"*\"]', NULL, NULL, '2024-12-05 04:16:53', '2024-12-05 04:16:53'),
(32, 'App\\Models\\Customer', 1, 'CustomerApp', '02c24f92b340dd35d7ef6b8eb4101e59a9839651721504f9ae13840aef1b5dc2', '[\"*\"]', NULL, NULL, '2024-12-05 04:18:40', '2024-12-05 04:18:40'),
(33, 'App\\Models\\Customer', 1, 'CustomerApp', '930937fe324c0902d5c6db130a8a3d725e471cb8f6bc7d286adaa829bf8f76ef', '[\"*\"]', NULL, NULL, '2024-12-05 04:21:21', '2024-12-05 04:21:21'),
(34, 'App\\Models\\Customer', 1, 'CustomerApp', '6f30eb99c6f0125266fabcafa8973ebd66953e6ce69a4516098e032bc62c3382', '[\"*\"]', NULL, NULL, '2024-12-05 04:21:59', '2024-12-05 04:21:59'),
(35, 'App\\Models\\Customer', 1, 'CustomerApp', '0880f864c04ae3274d24beb60cd49dcfb149516e8e9976335c1e0021b2fc7797', '[\"*\"]', NULL, NULL, '2024-12-05 04:22:45', '2024-12-05 04:22:45'),
(36, 'App\\Models\\Customer', 1, 'CustomerApp', '04ca580f2970269893136cd4a1b0eee8d8907afbde7a7417b00f798e515badd7', '[\"*\"]', NULL, NULL, '2024-12-05 04:25:55', '2024-12-05 04:25:55'),
(37, 'App\\Models\\Customer', 1, 'CustomerApp', '155c220813c0f36fe67c239f314b6c9838cac389e2a3190854551f4b074d6ea4', '[\"*\"]', NULL, NULL, '2024-12-05 04:27:12', '2024-12-05 04:27:12'),
(38, 'App\\Models\\Customer', 1, 'CustomerApp', 'bbdcc0f07dab7393a9ddcef58bdd217e63317c71d32e3cb622ce8c3cecc58125', '[\"*\"]', NULL, NULL, '2024-12-05 04:28:23', '2024-12-05 04:28:23'),
(39, 'App\\Models\\Customer', 1, 'CustomerApp', '2e727835ed9502bf9e2bf5e0d2e1e61cac6caf66f475e5de7cbf9107c730b492', '[\"*\"]', NULL, NULL, '2024-12-05 04:30:31', '2024-12-05 04:30:31'),
(40, 'App\\Models\\Customer', 1, 'CustomerApp', '4f99f1b27276b07639f10dc834803eeb3a88aeefa9ffcb697744a738624773a8', '[\"*\"]', NULL, NULL, '2024-12-05 08:10:45', '2024-12-05 08:10:45'),
(41, 'App\\Models\\Customer', 2, 'auth_token', '0272aca000c72353fbfebd11c3a1e270c2852c387dbafd2c24291a4b4fc56eac', '[\"*\"]', NULL, NULL, '2024-12-05 08:30:53', '2024-12-05 08:30:53'),
(42, 'App\\Models\\Customer', 3, 'auth_token', '4466de69fa19361590655e59150b1f4747fa219d89f8c2fdab45f47f9267d2e4', '[\"*\"]', NULL, NULL, '2024-12-05 08:32:33', '2024-12-05 08:32:33'),
(43, 'App\\Models\\Customer', 2, 'CustomerApp', '397230571020aeafb56f8218f936e94f10c607a8d8427ff09f1db9262fc606ab', '[\"*\"]', NULL, NULL, '2024-12-05 08:44:58', '2024-12-05 08:44:58'),
(44, 'App\\Models\\Customer', 1, 'CustomerApp', 'fd0c4420cd927c7a7fc372399bdfad29e1fd5afc59735bfe47ff0fc7de2c77be', '[\"*\"]', NULL, NULL, '2024-12-05 09:19:20', '2024-12-05 09:19:20'),
(45, 'App\\Models\\Customer', 4, 'auth_token', '0cc8ebfe9e169bc7b093e36b175c88da50aa6f0cec3d521c39c32e41d63c79b1', '[\"*\"]', NULL, NULL, '2024-12-05 09:53:42', '2024-12-05 09:53:42'),
(46, 'App\\Models\\Customer', 5, 'auth_token', '5126272b13bc9bb21497659f2fdd4329a928e60b012f22669513c831d1f5749b', '[\"*\"]', NULL, NULL, '2024-12-05 09:57:45', '2024-12-05 09:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('BBMJXfYK7JVWiZRGTPRraloBKxnW7uhZi988DNPl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1NsbEJaM0M3NkZUMFZNQzJVZ3FsSE1YQjNHNVZUeE1LcVpKRHJPZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1733387724),
('i4lx0XJeN7auMmvuFr1NO6HKk1xoSEuxtNRnVZe3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM210dXJVc1BvVGdNU0ZlT2tRZ1pLRkJheVRaRWhwN29PRksxM2RQNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1733412165),
('rYcYSgttUmSP92HHGTYke3saAOZla2z8EQgY5t6z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUZEQVh1YjRXUDZtak9nS2FvZ2lhQ3oyS3lIRmJsSkJPNEpOcUxBSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1733350020),
('S24mnjgXEFXDuqNSBw2kYEuWIYJ2auMcIBozPwtG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUVVEQ215RENuNmh3MFk5SjFIQUFYVXpmZzY0SkRFNEVReGdVWUtrVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733346242);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'yasindu', 'yasindu@gmail.com', NULL, '$2y$12$l7dojnHS/mVpoTeR58XJk.qxpncIgFXTRdWyvmYpmvisYKlp2QoDK', NULL, NULL, NULL, 'ORM0RCslUWrS4N10cUn4P6fFXQo5Z8lpL7QAoOGbwsvByP84eOEGTyLGeWSk', NULL, NULL, '2024-12-04 02:42:49', '2024-12-04 02:42:49'),
(2, 'amal', 'amal@gmail.com', NULL, '$2y$12$rWGZp7O4n7QwIEXRE5Vywu0OalxajDiAUtRybXHJM7eJ5B28iFGam', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 08:50:28', '2024-12-04 08:50:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `customer_password_reset_tokens`
--
ALTER TABLE `customer_password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `customer_sessions`
--
ALTER TABLE `customer_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_sessions_cus_id_index` (`cus_id`),
  ADD KEY `customer_sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
