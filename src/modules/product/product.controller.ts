import { Controller, Get, Param, Post, Body } from '@nestjs/common';
import { ProductService } from './product.service';
import { Product as ProductModel, InputType } from '@prisma/client';
import { CreateProductDto } from './dtos/create-product.dto';

@Controller()
export class ProductController {
  constructor(private readonly productService: ProductService) {}

  @Get('product')
  async getProducts(): Promise<ProductModel[]> {
    return this.productService.products();
  }

  @Get('product/:id')
  async getProductById(@Param('id') id: string): Promise<any> {
    return this.productService.product({ id: +id });
  }

  @Post('product')
  async createProduct(@Body() data: CreateProductDto): Promise<ProductModel> {
    const inputs = data.inputs?.length > 0 ? data.inputs : [1];

    const inputType: InputType = 'TEXT';

    return this.productService.createProduct({
      ...data,
      inputs: {
        connectOrCreate: inputs.map((id) => ({
          where: { id },
          create: { name: 'Nome do cliente', type: inputType },
        })),
      },
    });
  }
}
