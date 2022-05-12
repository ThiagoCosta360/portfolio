import {
	Body,
	Controller,
	Get,
	Param,
	ParseIntPipe,
	Patch,
	Post,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CounterModel } from 'src/models/couter.model';
import { CounterSchema } from 'src/schemas/counter.schema';
import { Repository } from 'typeorm';

@Controller('/counter')
export class CounterController {
	constructor(
		@InjectRepository(CounterModel) private model: Repository<CounterModel>,
	) { }

	@Post()
	public async create(@Body() body: CounterSchema): Promise<any> {
		const res = await this.model.save(body);
		return { data: res };
	}

	@Get()
	public async getAll(): Promise<{ data: CounterModel[] }> {
		const res = await this.model.find();
		return { data: res };
	}

	@Get(':id')
	public async getById(
		@Param('id', ParseIntPipe) id: number,
	): Promise<{ data: CounterModel }> {
		const res = await this.model.findOne({ where: { id } });
		return { data: res };
	}

	@Patch(':id')
	public async update(
		@Param('id', ParseIntPipe) id: number,
		@Body() body: CounterSchema,
	): Promise<{ data: CounterModel }> {
		await this.model.update({ id }, body);
		return { data: await this.model.findOne({ where: { id } }) };
	}
}
