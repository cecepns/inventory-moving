-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 30 Jul 2025 pada 06.09
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_moving`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) NOT NULL,
  `category` enum('Gudang Kain','Gudang Dus','Gudang Tali') NOT NULL,
  `unit` varchar(20) NOT NULL,
  `min_stock` int(11) NOT NULL DEFAULT 0,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id`, `name`, `code`, `category`, `unit`, `min_stock`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Kain Katun Premium', 'KTN001', 'Gudang Kain', 'meter', 50, 25000.00, 'Kain katun berkualitas tinggi untuk produksi', '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(2, 'Kain Polyester', 'PLY001', 'Gudang Kain', 'meter', 30, 18000.00, 'Kain polyester untuk lining', '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(3, 'Kain Denim', 'DNM001', 'Gudang Kain', 'meter', 25, 35000.00, 'Kain denim untuk produk jeans', '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(4, 'Kain Sutra', 'STR001', 'Gudang Kain', 'meter', 20, 75000.00, 'Kain sutra premium', '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(5, 'Dus Kemasan Kecil', 'DUS001', 'Gudang Dus', 'pcs', 100, 2500.00, 'Dus untuk kemasan produk kecil', '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(6, 'Dus Kemasan Sedang', 'DUS002', 'Gudang Dus', 'pcs', 80, 4000.00, 'Dus untuk kemasan produk sedang', '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(7, 'Dus Kemasan Besar', 'DUS003', 'Gudang Dus', 'pcs', 50, 6500.00, 'Dus untuk kemasan produk besar', '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(8, 'Dus Gift Box', 'GFT001', 'Gudang Dus', 'pcs', 40, 8000.00, 'Dus khusus untuk hadiah', '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(9, 'Tali Nilon 3mm', 'TNL003', 'Gudang Tali', 'roll', 20, 15000.00, 'Tali nilon diameter 3mm', '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(10, 'Tali Nilon 5mm', 'TNL005', 'Gudang Tali', 'roll', 15, 22000.00, 'Tali nilon diameter 5mm', '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(11, 'Tali Rami', 'TRM001', 'Gudang Tali', 'roll', 10, 18000.00, 'Tali rami natural', '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(12, 'Tali Elastis', 'TEL001', 'Gudang Tali', 'roll', 25, 12000.00, 'Tali elastis untuk berbagai keperluan', '2025-07-27 15:38:32', '2025-07-30 03:06:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` enum('in','out') NOT NULL,
  `date` date NOT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `item_id`, `quantity`, `type`, `date`, `supplier`, `recipient`, `notes`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 100, 'in', '2024-01-15', 'PT Tekstil Jaya', NULL, 'Pembelian rutin bulanan', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(2, 1, 80, 'out', '2024-01-20', NULL, 'Produksi A', 'Untuk produksi batch #001', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(3, 1, 150, 'in', '2024-02-10', 'PT Tekstil Jaya', NULL, 'Stok tambahan', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(4, 1, 120, 'out', '2024-02-15', NULL, 'Produksi A', 'Untuk produksi batch #002', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(5, 1, 200, 'in', '2024-03-05', 'PT Tekstil Jaya', NULL, 'Order besar', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(6, 1, 180, 'out', '2024-03-10', NULL, 'Produksi A', 'Untuk produksi batch #003', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(7, 5, 500, 'in', '2024-01-10', 'CV Kemasan Prima', NULL, 'Stock bulanan', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(8, 5, 400, 'out', '2024-01-25', NULL, 'Packing Dept', 'Kemasan produk jadi', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(9, 5, 600, 'in', '2024-02-08', 'CV Kemasan Prima', NULL, 'Tambahan stock', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(10, 5, 500, 'out', '2024-02-20', NULL, 'Packing Dept', 'Kemasan produk jadi', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(11, 5, 400, 'in', '2024-03-01', 'CV Kemasan Prima', NULL, 'Stock rutin', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(12, 5, 350, 'out', '2024-03-15', NULL, 'Packing Dept', 'Kemasan produk jadi', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(13, 4, 50, 'in', '2024-01-01', 'PT Sutra Indah', NULL, 'Stock premium', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(14, 4, 10, 'out', '2024-02-01', NULL, 'Produksi Premium', 'Produk khusus', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(15, 4, 30, 'in', '2024-02-15', 'PT Sutra Indah', NULL, 'Tambahan kecil', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(16, 4, 5, 'out', '2024-03-01', NULL, 'Produksi Premium', 'Order custom', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(17, 8, 100, 'in', '2024-01-05', 'CV Kemasan Prima', NULL, 'Persiapan musim', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(18, 8, 20, 'out', '2024-01-30', NULL, 'Packing Dept', 'Order spesial', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(19, 8, 50, 'in', '2024-02-20', 'CV Kemasan Prima', NULL, 'Stock tambahan', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(20, 8, 15, 'out', '2024-03-05', NULL, 'Packing Dept', 'Gift package', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(21, 11, 20, 'in', '2023-10-01', 'UD Tali Tradisional', NULL, 'Stock lama', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(22, 11, 2, 'out', '2023-11-15', NULL, 'Produksi C', 'Keperluan khusus', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(23, 2, 80, 'in', '2023-09-01', 'PT Fiber Tech', NULL, 'Stock lama', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(24, 2, 5, 'out', '2023-12-01', NULL, 'Produksi B', 'Sisa project', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(25, 3, 60, 'in', '2024-01-12', 'PT Denim Indonesia', NULL, 'Stock bulanan', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(26, 3, 30, 'out', '2024-01-28', NULL, 'Produksi Jeans', 'Produksi rutin', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(27, 3, 80, 'in', '2024-02-18', 'PT Denim Indonesia', NULL, 'Order besar', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(28, 3, 45, 'out', '2024-03-08', NULL, 'Produksi Jeans', 'Batch baru', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(29, 6, 200, 'in', '2024-01-08', 'CV Kemasan Prima', NULL, 'Stock rutin', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(30, 6, 120, 'out', '2024-01-22', NULL, 'Packing Dept', 'Kemasan sedang', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(31, 6, 180, 'in', '2024-02-12', 'CV Kemasan Prima', NULL, 'Restok', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(32, 6, 100, 'out', '2024-02-28', NULL, 'Packing Dept', 'Packing order', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(33, 9, 30, 'in', '2024-01-18', 'PT Tali Sintetis', NULL, 'Stock bulanan', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(34, 9, 15, 'out', '2024-02-05', NULL, 'Produksi Aksesoris', 'Produksi tali', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(35, 9, 25, 'in', '2024-02-25', 'PT Tali Sintetis', NULL, 'Tambahan stock', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32'),
(36, 9, 12, 'out', '2024-03-12', NULL, 'Produksi Aksesoris', 'Order custom', 1, '2025-07-27 15:38:32', '2025-07-27 15:38:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','manager') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2a$12$lmCmIV6gsgoXoBMVRoxVLett2s9iyZcOli8Xu5Kh28JqYyHMB3p26', 'admin', '2025-07-27 15:38:32', '2025-07-27 15:41:52'),
(2, 'manager', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'manager', '2025-07-27 15:38:32', '2025-07-27 15:38:32');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_current_stock`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_current_stock` (
`id` int(11)
,`name` varchar(255)
,`code` varchar(50)
,`category` enum('Gudang Kain','Gudang Dus','Gudang Tali')
,`unit` varchar(20)
,`min_stock` int(11)
,`price` decimal(15,2)
,`total_in` decimal(32,0)
,`total_out` decimal(32,0)
,`current_stock` decimal(33,0)
,`stock_status` varchar(9)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_stock_analysis`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_stock_analysis` (
`id` int(11)
,`name` varchar(255)
,`code` varchar(50)
,`category` enum('Gudang Kain','Gudang Dus','Gudang Tali')
,`unit` varchar(20)
,`total_in` decimal(32,0)
,`total_out` decimal(32,0)
,`current_stock` decimal(33,0)
,`turnover_ratio` decimal(40,4)
,`movement_category` varchar(11)
,`last_out_date` date
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_current_stock`
--
DROP TABLE IF EXISTS `v_current_stock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_current_stock`  AS SELECT `i`.`id` AS `id`, `i`.`name` AS `name`, `i`.`code` AS `code`, `i`.`category` AS `category`, `i`.`unit` AS `unit`, `i`.`min_stock` AS `min_stock`, `i`.`price` AS `price`, coalesce(sum(case when `t`.`type` = 'in' then `t`.`quantity` else 0 end),0) AS `total_in`, coalesce(sum(case when `t`.`type` = 'out' then `t`.`quantity` else 0 end),0) AS `total_out`, coalesce(sum(case when `t`.`type` = 'in' then `t`.`quantity` else 0 end) - sum(case when `t`.`type` = 'out' then `t`.`quantity` else 0 end),0) AS `current_stock`, CASE WHEN coalesce(sum(case when `t`.`type` = 'in' then `t`.`quantity` else 0 end) - sum(case when `t`.`type` = 'out' then `t`.`quantity` else 0 end),0) <= `i`.`min_stock` THEN 'REORDER' WHEN coalesce(sum(case when `t`.`type` = 'in' then `t`.`quantity` else 0 end) - sum(case when `t`.`type` = 'out' then `t`.`quantity` else 0 end),0) <= `i`.`min_stock` * 1.5 THEN 'LOW_STOCK' ELSE 'GOOD' END AS `stock_status` FROM (`items` `i` left join `transactions` `t` on(`i`.`id` = `t`.`item_id`)) GROUP BY `i`.`id`, `i`.`name`, `i`.`code`, `i`.`category`, `i`.`unit`, `i`.`min_stock`, `i`.`price` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_stock_analysis`
--
DROP TABLE IF EXISTS `v_stock_analysis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stock_analysis`  AS SELECT `i`.`id` AS `id`, `i`.`name` AS `name`, `i`.`code` AS `code`, `i`.`category` AS `category`, `i`.`unit` AS `unit`, coalesce(sum(case when `t`.`type` = 'in' then `t`.`quantity` else 0 end),0) AS `total_in`, coalesce(sum(case when `t`.`type` = 'out' then `t`.`quantity` else 0 end),0) AS `total_out`, coalesce(sum(case when `t`.`type` = 'in' then `t`.`quantity` else 0 end) - sum(case when `t`.`type` = 'out' then `t`.`quantity` else 0 end),0) AS `current_stock`, CASE WHEN avg(case when `t`.`type` = 'in' then `t`.`quantity` else NULL end) > 0 THEN coalesce(sum(case when `t`.`type` = 'out' then `t`.`quantity` else 0 end),0) / avg(case when `t`.`type` = 'in' then `t`.`quantity` else NULL end) ELSE 0 END AS `turnover_ratio`, CASE END FROM (`items` `i` left join `transactions` `t` on(`i`.`id` = `t`.`item_id`)) GROUP BY `i`.`id`, `i`.`name`, `i`.`code`, `i`.`category`, `i`.`unit` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `idx_items_category` (`category`),
  ADD KEY `idx_items_code` (`code`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_transactions_item_id` (`item_id`),
  ADD KEY `idx_transactions_type` (`type`),
  ADD KEY `idx_transactions_date` (`date`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
