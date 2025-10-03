-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2025 at 05:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit1`
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
-- Table structure for table `dokters`
--

CREATE TABLE `dokters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idDokter` char(255) NOT NULL,
  `namaDokter` text NOT NULL,
  `tanggalLahir` text NOT NULL,
  `spesialisasi` text NOT NULL,
  `lokasiPraktik` text NOT NULL,
  `jamPraktik` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dokters`
--

INSERT INTO `dokters` (`id`, `idDokter`, `namaDokter`, `tanggalLahir`, `spesialisasi`, `lokasiPraktik`, `jamPraktik`, `created_at`, `updated_at`) VALUES
(1, '01', 'Jambu', '2000-02-28', 'Poli Jantung', 'Premium', '12-12', '2025-08-28 23:43:51', '2025-08-28 23:43:51'),
(2, '02', 'Budi', '1999-09-20', 'Poli Mata', 'Umum', '09-17', '2025-08-28 23:56:41', '2025-08-28 23:56:41'),
(3, '03', 'Jumat', '2003-02-26', 'Poli Saraf', 'Umum', '08-20', '2025-08-29 00:02:59', '2025-08-29 00:02:59'),
(4, '04', 'Oscar', '1999-09-19', 'Poli Paru', 'Premium', '13-20', '2025-08-29 00:05:20', '2025-08-29 00:05:20');

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
-- Table structure for table `kunjungans`
--

CREATE TABLE `kunjungans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pasien_id` bigint(20) UNSIGNED DEFAULT NULL,
  `keluhan` text NOT NULL,
  `requested_date` datetime NOT NULL,
  `assigned_dokter_ref` varchar(255) DEFAULT NULL,
  `status` enum('requested','assigned','cancelled','closed') NOT NULL DEFAULT 'requested',
  `responded_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kunjungans`
--

INSERT INTO `kunjungans` (`id`, `user_id`, `pasien_id`, `keluhan`, `requested_date`, `assigned_dokter_ref`, `status`, `responded_at`, `cancelled_at`, `closed_at`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, 'sakit', '2025-08-29 12:44:00', NULL, 'requested', NULL, NULL, NULL, '2025-08-28 22:44:39', '2025-08-28 22:44:39');

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_01_000000_add_photo_and_role_to_users_table', 1),
(5, '2025_08_08_062955_create_dokters_table', 1),
(6, '2025_08_13_004528_create_personal_access_tokens_table', 1),
(7, '2025_08_22_035648_create_ruangan_table', 1),
(8, '2025_08_22_065508_create_pasiens_table', 1),
(9, '2025_08_22_075100_alter_pasiens_nomor_kamar_nullable', 1),
(10, '2025_08_28_000001_create_kunjungans_table', 1),
(11, '2025_08_28_000002_create_pemeriksaans_table', 1),
(12, '2025_08_28_010000_alter_users_role_enum', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pasiens`
--

CREATE TABLE `pasiens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `NomorRekamMedis` varchar(255) NOT NULL,
  `namaPasien` varchar(255) NOT NULL,
  `tanggalLahir` date NOT NULL,
  `jenisKelamin` enum('L','P') NOT NULL,
  `alamatPasien` varchar(255) NOT NULL,
  `kotaPasien` varchar(255) NOT NULL,
  `usiaPasien` tinyint(3) UNSIGNED NOT NULL,
  `penyakitPasien` varchar(255) NOT NULL,
  `idDokter` char(255) NOT NULL,
  `tanggalMasuk` date NOT NULL,
  `tanggalKeluar` date DEFAULT NULL,
  `nomorKamar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pasiens`
--

INSERT INTO `pasiens` (`id`, `NomorRekamMedis`, `namaPasien`, `tanggalLahir`, `jenisKelamin`, `alamatPasien`, `kotaPasien`, `usiaPasien`, `penyakitPasien`, `idDokter`, `tanggalMasuk`, `tanggalKeluar`, `nomorKamar`, `created_at`, `updated_at`) VALUES
(1, '01', 'Pace', '2007-06-19', 'L', 'Condet', 'Jaktim', 18, 'Poli Mata', '02', '2025-08-28', NULL, '002', '2025-08-28 23:55:48', '2025-08-29 00:23:26'),
(4, '03', 'Iluy', '2010-02-02', 'P', 'Condet', 'Jaktim', 15, 'Poli Jantung', '01', '2025-08-20', NULL, '002', '2025-08-29 00:17:59', '2025-08-29 00:17:59'),
(5, '02', 'Ling', '2007-06-01', 'L', 'RawaBuaya', 'JakBar', 18, 'Poli Saraf', '03', '2025-08-27', NULL, 'oo1', '2025-08-29 00:25:50', '2025-09-02 05:20:57'),
(6, '04', 'Jangs', '2010-06-06', 'L', 'RawaBuaya', 'JakBar', 15, 'Poli Jantung', '01', '2025-08-15', NULL, '002', '2025-08-29 00:29:12', '2025-08-29 00:29:12'),
(7, '05', 'Kungs', '1997-01-28', 'L', 'Condet', 'Jaktim', 28, 'Poli Jantung', '01', '2025-08-21', '2025-08-29', NULL, '2025-08-29 00:31:27', '2025-08-29 00:31:45'),
(8, '06', 'Ita', '2007-02-07', 'P', 'RawaBuaya', 'JakBar', 18, 'Poli Saraf', '03', '2025-08-31', NULL, 'oo1', '2025-09-02 05:20:08', '2025-09-02 05:20:08');

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
-- Table structure for table `pemeriksaans`
--

CREATE TABLE `pemeriksaans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pasien_id` bigint(20) UNSIGNED NOT NULL,
  `dokter_ref` varchar(255) NOT NULL,
  `perlu_dirawat` tinyint(1) NOT NULL DEFAULT 0,
  `ruangan_kode` varchar(255) DEFAULT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `obat` text DEFAULT NULL,
  `dosis` varchar(255) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `status_pemulihan` enum('belum_sembuh','sembuh') NOT NULL DEFAULT 'belum_sembuh',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kodeRuangan` varchar(255) NOT NULL,
  `namaRuangan` varchar(255) NOT NULL,
  `dayaTampung` int(11) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id`, `kodeRuangan`, `namaRuangan`, `dayaTampung`, `lokasi`, `created_at`, `updated_at`) VALUES
(3, 'oo1', 'Umum', 8, '12 rpl', '2025-08-28 23:40:15', '2025-09-02 05:20:08'),
(4, '002', 'Premium', 0, 'RKB', '2025-08-28 23:40:48', '2025-08-29 00:29:12');

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
('3X6ZEb30W6M9PHz8q6fkFEWNotMBCOlhe2YotlOq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVNLRG1Oc0FMa0Jlc2prbjhpcG1xVnl2cG05RkdiTWZ0TGp4bTNPeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1758673783),
('N3JcXgXcQaxpYFLt1afds436AS35XL6i2QXpiPrF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidG1Cc29udE9kN3IyRjBXTWo2QkNYU0x2eXhJdFA5Y2NWT3AzaWJFZyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3BlbWVyaWtzYWFuL2NyZWF0ZSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756869389),
('tnJEZuMP3I4I5XR1yyQrIzIbN9mlN0WeWeW3539i', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoia0k5TkFMeWNxNmhuY1lEa0JUVGNWQmpyNFNzSHM1UXYydWplaXRONSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wZW1lcmlrc2Fhbi9jcmVhdGUiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2O30=', 1756856727);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `role` enum('admin','operator','dokter','user') NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `photo`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'buds', 'aswk@gmail.com', '1756446797_tyler.jpg', 'operator', NULL, '$2y$12$c5qMVsEu2ZsXSKWGe9L5/./YLjs5eFKHZpa79vD25Y1GecWBlhDwm', NULL, '2025-08-28 21:01:49', '2025-08-28 22:53:17'),
(6, 'cenat', 'fawazcenat@gmail.com', '1756449198_tyler.jpg', 'user', NULL, '$2y$12$.8RQXoZUav0rB7kKxhujL.AZsRo1Pm5sisPXpyS828yaJ.b8O.kW2', 'CUO4PijuLt7ZOXFnTK9ysI8pKqngXcDXHTLP0eW5yOtxvq4QPrfwSby2joRY', '2025-08-28 23:33:18', '2025-08-28 23:34:50');

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
-- Indexes for table `dokters`
--
ALTER TABLE `dokters`
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
-- Indexes for table `kunjungans`
--
ALTER TABLE `kunjungans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kunjungans_user_id_foreign` (`user_id`),
  ADD KEY `kunjungans_pasien_id_foreign` (`pasien_id`),
  ADD KEY `kunjungans_status_requested_date_index` (`status`,`requested_date`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasiens`
--
ALTER TABLE `pasiens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pasiens_nomorrekammedis_unique` (`NomorRekamMedis`),
  ADD KEY `pasiens_penyakitpasien_index` (`penyakitPasien`),
  ADD KEY `pasiens_iddokter_index` (`idDokter`),
  ADD KEY `pasiens_nomorkamar_index` (`nomorKamar`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pemeriksaans`
--
ALTER TABLE `pemeriksaans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemeriksaans_pasien_id_foreign` (`pasien_id`),
  ADD KEY `pemeriksaans_dokter_ref_ruangan_kode_index` (`dokter_ref`,`ruangan_kode`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ruangan_koderuangan_unique` (`kodeRuangan`);

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
-- AUTO_INCREMENT for table `dokters`
--
ALTER TABLE `dokters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `kunjungans`
--
ALTER TABLE `kunjungans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pasiens`
--
ALTER TABLE `pasiens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pemeriksaans`
--
ALTER TABLE `pemeriksaans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kunjungans`
--
ALTER TABLE `kunjungans`
  ADD CONSTRAINT `kunjungans_pasien_id_foreign` FOREIGN KEY (`pasien_id`) REFERENCES `pasiens` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `kunjungans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pemeriksaans`
--
ALTER TABLE `pemeriksaans`
  ADD CONSTRAINT `pemeriksaans_pasien_id_foreign` FOREIGN KEY (`pasien_id`) REFERENCES `pasiens` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
