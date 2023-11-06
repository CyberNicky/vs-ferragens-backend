import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { InputController } from './input.controller';
import { InputService } from './input.service';

@Module({
  imports: [],
  controllers: [InputController],
  providers: [PrismaService, InputService],
})
export class InputModule {}
