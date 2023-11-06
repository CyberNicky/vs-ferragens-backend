import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma.service';
import { Input, Prisma } from '@prisma/client';

@Injectable()
export class InputService {
  constructor(private prisma: PrismaService) {}

  async input(
    inputWhereUniqueInput: Prisma.InputWhereUniqueInput,
  ): Promise<Input | null> {
    return this.prisma.input.findUnique({
      where: inputWhereUniqueInput,
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
