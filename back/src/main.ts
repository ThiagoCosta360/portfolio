import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

const port = 2000;


async function bootstrap() {
	const app = await NestFactory.create(AppModule, { cors: true });
	app.enableCors();
	app.useGlobalPipes(new ValidationPipe());
	try {
		await app.listen(port);
		console.log(`listening on ${port}`);
	} catch (err) {
		console.error(err);
	}
}
bootstrap();
