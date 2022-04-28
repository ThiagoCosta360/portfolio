import { TypeOrmModuleOptions } from '@nestjs/typeorm';

export const typeOrmConfig: TypeOrmModuleOptions = {
  type: 'postgres',
  host: 'postgres',
  port: 5432,
  username: 'dev',
  password: 'dev123',
  database: 'db',
  entities: ['dist/**/*.entity.{js,ts}'],
  synchronize: true,
};
