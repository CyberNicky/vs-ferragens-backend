import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma.service';
import { Budget, BudgetField, Prisma } from '@prisma/client';

@Injectable()
export class BudgetService {
  constructor(private prisma: PrismaService) {}

  async budget(
    budgetWhereUniqueInput: Prisma.BudgetWhereUniqueInput,
  ): Promise<Budget> {
    return this.prisma.budget.findUnique({
      where: budgetWhereUniqueInput,
      include: {
        product: true,
        budgetFields: {
          include: {
            input: true,
          },
        },
      },
    });
  }

  async budgets(): Promise<Budget[]> {
    return this.prisma.budget.findMany();
  }

  async createBudget(data: Prisma.BudgetCreateInput): Promise<Budget> {
    return this.prisma.budget.create({
      data,
      include: {
        product: true,
        budgetFields: true,
      },
    });
  }

  async createBudgetFields(
    data: Prisma.BudgetFieldCreateInput,
  ): Promise<BudgetField> {
    return this.prisma.budgetField.create({ data });
  }
}
