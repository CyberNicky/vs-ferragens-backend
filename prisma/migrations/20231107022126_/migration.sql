/*
  Warnings:

  - A unique constraint covering the columns `[id]` on the table `Product` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX `Product_name_key` ON `Product`;

-- CreateIndex
CREATE UNIQUE INDEX `Product_id_key` ON `Product`(`id`);
