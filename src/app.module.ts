import { Module } from '@nestjs/common';
import { InputModule } from './modules/input/input.module';
import { ProductModule } from './modules/product/product.module';
import { BudgetModule } from './modules/budget/budget.module';

@Module({
  imports: [ProductModule, InputModule, BudgetModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
