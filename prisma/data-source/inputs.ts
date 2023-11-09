import {
  CreateInputDto,
  InputType,
} from '../../src/modules/input/dtos/create-input.dto';

export const gateInputs: CreateInputDto[] = [
  {
    name: 'Nome do Cliente',
    type: InputType.TEXT,
  },
  {
    name: 'Largura',
    type: InputType.NUMBER,
  },
  {
    name: 'Altura',
    type: InputType.NUMBER,
  },
  {
    name: 'Cor do Alumínio',
    type: InputType.SELECT,
    options: [1, 2, 3, 4],
  },
  {
    name: 'Tipo de portão',
    type: InputType.SELECT,
    options: [5, 6, 7],
  },
  {
    name: 'Modelo de portão',
    type: InputType.SELECT,
    options: [8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22],
  },
  {
    name: 'Modelo de lambri',
    type: InputType.SELECT,
    options: [23, 24, 25],
  },
  {
    name: 'Cor do vidro',
    type: InputType.SELECT,
    options: [26, 27, 28, 29],
  },
  {
    name: 'Modelo de motor',
    type: InputType.SELECT,
    options: [30, 31, 32],
  },
  {
    name: 'Tipo de janela',
    type: InputType.SELECT,
    options: [5, 7],
  },
  {
    name: 'Modelo de janela',
    type: InputType.SELECT,
    options: [33, 34, 35, 36],
  },
  {
    name: 'Telefone/Whatsapp',
    type: InputType.TEXT,
  },
];
