import { IsInt } from 'class-validator';

export class CounterSchema {
  @IsInt()
  count: number;
}
