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
import { Input as InputModel } from '@prisma/client';
import { CreateInputDto } from './dtos/create-input.dto';
import { create } from 'domain';

@Controller()
export class InputController {
  constructor(private readonly inputService: InputService) {}

  @Get('input')
  async getInputs(): Promise<InputModel[]> {
    return this.inputService.inputs();
  }

  @Get('input/:id')
  async getInputById(@Param('id') id: string): Promise<InputModel> {
    return this.inputService.input({ id: Number(id) });
  }

  @Post('input')
  async createInput(@Body() data: CreateInputDto): Promise<InputModel> {
    return this.inputService.createInput({
      ...data,
      inputs: {
        : [{ name: 'Nome do cliente', type: 'TEXT' }],
      },
    });
  }
}
