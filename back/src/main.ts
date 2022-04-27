import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

const port = process.env.BACK_INTERAL_PORT || 2000;

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { cors: true });
  app.enableCors();
  await app.listen(port);
}
bootstrap();
