-- Add saldo_awal column to items table
ALTER TABLE `items`
  ADD COLUMN `saldo_awal` int(11) NOT NULL DEFAULT 0 AFTER `price`;

-- Optionally add input_date if missing (kept idempotent-safe via IF NOT EXISTS in MySQL 8+; for MariaDB, run manually if needed)
-- ALTER TABLE `items` ADD COLUMN `input_date` date NULL AFTER `description`;


