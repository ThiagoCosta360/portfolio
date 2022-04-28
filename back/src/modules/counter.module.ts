import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CounterController } from 'src/controllers/counter.controller';
import { CounterModel } from 'src/models/couter.model';

@Module({
  imports: [TypeOrmModule.forFeature([CounterModel])],
  controllers: [CounterController],
})
export class CounterModule {}
