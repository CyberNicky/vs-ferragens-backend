export enum InputType {
  TEXT = 'TEXT',
  NUMBER = 'NUMBER',
  SELECT = 'SELECT',
}
export class CreateInputDto {
  name: string;
  type: InputType;
  products?: number[];
  options?: number[];
}
