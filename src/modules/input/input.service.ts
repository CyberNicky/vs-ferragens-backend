import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma.service';
import { Input, InputOption, Prisma, Product } from '@prisma/client';

@Injectable()
export class InputService {
  constructor(private prisma: PrismaService) {}

  async input(
    inputWhereUniqueInput: Prisma.InputWhereUniqueInput,
  ): Promise<any | null> {
    const input = await this.prisma.input.findUnique({
      where: inputWhereUniqueInput,
    });
    const products = await this.products(inputWhereUniqueInput.id);
    const options = await this.options(inputWhereUniqueInput.id);
    return { ...input, products, options };
  }

  async products(inputId: number): Promise<Product[]> {
    return this.prisma.product.findMany({
      where: { inputs: { some: { id: inputId } } },
    });
  }

  async options(inputId: number): Promise<InputOption[]> {
    return this.prisma.inputOption.findMany({
      where: { inputs: { some: { id: inputId } } },
    });
  }

  async inputs(): Promise<Input[]> {
    return this.prisma.input.findMany();
  }

  async createInput(data: Prisma.InputCreateInput): Promise<Input> {
    return this.prisma.input.create({
      data,
    });
  }

  async updateInput(params: {
    where: Prisma.InputWhereUniqueInput;
    data: Prisma.InputUpdateInput;
  }): Promise<Input> {
    const { where, data } = params;
    return this.prisma.input.update({
      data,
      where,
    });
  }

  async deleteInput(where: Prisma.InputWhereUniqueInput): Promise<Input> {
    return this.prisma.input.delete({
      where,
    });
  }
}
