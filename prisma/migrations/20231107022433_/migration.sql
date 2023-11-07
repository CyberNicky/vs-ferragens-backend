/*
  Warnings:

  - A unique constraint covering the columns `[id]` on the table `Input` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `InputOption` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Input_id_key` ON `Input`(`id`);

-- CreateIndex
CREATE UNIQUE INDEX `InputOption_id_key` ON `InputOption`(`id`);
