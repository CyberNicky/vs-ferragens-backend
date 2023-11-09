import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { BudgetController } from './budget.controller';
import { BudgetService } from './budget.service';

@Module({
  imports: [],
  controllers: [BudgetController],
  providers: [PrismaService, BudgetService],
})
export class BudgetModule {}
