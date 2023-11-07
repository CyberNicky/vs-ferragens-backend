import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma.service';
import { Product, Prisma, Input } from '@prisma/client';

@Injectable()
export class ProductService {
  constructor(private prisma: PrismaService) {}

  async product(
    productWhereUniqueInput: Prisma.ProductWhereUniqueInput,
  ): Promise<any | null> {
    const product = await this.prisma.product.findUnique({
      where: productWhereUniqueInput,
    });

    const inputs = await this.inputs(productWhereUniqueInput.id);

    return { ...product, inputs };
  }

  async products(): Promise<Product[]> {
    return this.prisma.product.findMany();
  }

  async inputs(productId: number): Promise<Input[]> {
    return this.prisma.input.findMany({
      where: { products: { some: { id: productId } } },
    });
  }

  async createProduct(data: Prisma.ProductCreateInput): Promise<Product> {
    return this.prisma.product.create({
      data,
    });
  }

  async updateProduct(params: {
    where: Prisma.ProductWhereUniqueInput;
    data: Prisma.ProductUpdateInput;
  }): Promise<Product> {
    const { where, data } = params;
    return this.prisma.product.update({
      data,
      where,
    });
  }

  async deleteProduct(where: Prisma.ProductWhereUniqueInput): Promise<Product> {
    return this.prisma.product.delete({
      where,
    });
  }
}
