import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { typeOrmConfig } from './configs/typeorm.config';
import { CounterModule } from './modules/counter.module';

@Module({
  imports: [TypeOrmModule.forRoot(typeOrmConfig), CounterModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
