import { TypeOrmModuleOptions } from '@nestjs/typeorm';

export const typeOrmConfig: TypeOrmModuleOptions = {
	type: 'postgres',
	url: process.env.DATABASE_URL,
	entities: ['models/*.model.{js,ts}'],
	extra: {
		ssl: process.env.MODE == 'prod',
		rejectUnauthorized: false
	},
	synchronize: process.env.MODE == 'dev'
};
