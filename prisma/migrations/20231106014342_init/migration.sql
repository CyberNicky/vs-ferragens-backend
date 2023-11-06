/*
  Warnings:

  - You are about to drop the `InputOnProducts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `InputOptionOnInput` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `InputOnProducts` DROP FOREIGN KEY `InputOnProducts_inputId_fkey`;

-- DropForeignKey
ALTER TABLE `InputOnProducts` DROP FOREIGN KEY `InputOnProducts_productId_fkey`;

-- DropForeignKey
ALTER TABLE `InputOptionOnInput` DROP FOREIGN KEY `InputOptionOnInput_inputId_fkey`;

-- DropForeignKey
ALTER TABLE `InputOptionOnInput` DROP FOREIGN KEY `InputOptionOnInput_inputOptionId_fkey`;

-- DropTable
DROP TABLE `InputOnProducts`;

-- DropTable
DROP TABLE `InputOptionOnInput`;
