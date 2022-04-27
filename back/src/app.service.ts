import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    const res = JSON.parse(JSON.stringify({ res: 'Hello World!' }));
    return res;
  }
}
