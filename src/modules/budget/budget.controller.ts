import { Controller, Get, Post, Body, Param } from '@nestjs/common';
import { BudgetService } from './budget.service';
import { CreateBudgetDto } from './dtos/create-budget-dto';
import { Budget } from '@prisma/client';

@Controller('budget')
export class BudgetController {
  constructor(private budgetService: BudgetService) {}

  @Get()
  async getBudgets(@Param('id') id: string): Promise<any> {
    return this.budgetService.budget({ id: +id });
  }

  @Get(':id')
  async getBudgetById(@Param('id') id: string): Promise<any> {
    return this.budgetService.budget({ id: +id });
  }

  @Post('')
  async createBudget(@Body() data: CreateBudgetDto): Promise<Budget> {
    return this.budgetService.createBudget({
      product: { connect: { id: data.productId } },
      budgetFields: {
        createMany: {
          data: data.inputs.map((input) => ({
            inputId: input.id,
            value: input.value,
          })),
        },
      },
    });
  }
}
