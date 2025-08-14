-- Add input_date column to items table
ALTER TABLE `items` ADD COLUMN `input_date` DATE NULL AFTER `description`;

-- Update existing records to use created_at date as input_date
UPDATE `items` SET `input_date` = DATE(`created_at`) WHERE `input_date` IS NULL;
