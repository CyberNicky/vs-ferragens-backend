import {
  Controller,
  Get,
  Param,
  Post,
  Body,
  Put,
  Delete,
} from '@nestjs/common';
import { ProductService } from './product.service';
import { Product as ProductModel } from '@prisma/client';
import { CreateProductDto } from './dtos/create-product.dto';
import { create } from 'domain';

@Controller()
export class ProductController {
  constructor(private readonly productService: ProductService) {}

  @Get('product')
  async getProducts(): Promise<ProductModel[]> {
    return this.productService.products();
  }

  @Get('product/:id')
  async getProductById(@Param('id') id: string): Promise<ProductModel> {
    return this.productService.product({ id: Number(id) });
  }

  @Post('product')
  async createProduct(@Body() data: CreateProductDto): Promise<ProductModel> {
    return this.productService.createProduct({
      ...data,
      inputs: {
        //connect or create
        connect: [{ name: 'Nome do cliente', type: 'TEXT' }],
      },
    });
  }
}
