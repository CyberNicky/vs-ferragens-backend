import {
  Controller,
  Get,
  Param,
  Post,
  Body,
  Put,
  Delete,
} from '@nestjs/common';
import { InputService } from './input.service';
import { Input as InputModel, InputType } from '@prisma/client';
import { CreateInputDto } from './dtos/create-input.dto';

@Controller()
export class InputController {
  constructor(private readonly inputService: InputService) {}

  @Get('input')
  async getInputs(): Promise<InputModel[]> {
    return this.inputService.inputs();
  }

  @Get('input/:id')
  async getInputById(@Param('id') id: string): Promise<any> {
    return this.inputService.input({ id: +id });
  }

  @Post('input')
  async createInput(@Body() data: CreateInputDto): Promise<InputModel> {
    const options = data.options?.length > 0 ? data.options : [1];

    const inputType: InputType = 'TEXT';

    return this.inputService.createInput({
      ...data,

      options: {
        connectOrCreate: options.map((id) => ({
          where: { id },
          create: { name: 'Branco' },
        })),
      },
      products: {
        connect: data.products?.map((id) => ({ id })) || [],
      },
    });
  }
}
