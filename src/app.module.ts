import { Module } from '@nestjs/common';
import { ProductModule } from './modules/product/product.module';
import { PrismaService } from './prisma.service';

@Module({
  imports: [ProductModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
