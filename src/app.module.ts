import { Module } from '@nestjs/common';
import { InputModule } from './modules/input/input.module';
import { ProductModule } from './modules/product/product.module';

@Module({
  imports: [ProductModule, InputModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
