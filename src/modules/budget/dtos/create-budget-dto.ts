export class CreateBudgetDto {
  productId: number;
  inputs: {
    id: number;
    value: string;
  }[];
}
