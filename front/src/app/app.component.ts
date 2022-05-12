import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';

@Component({
	selector: 'app-root',
	templateUrl: './app.component.html',
	styleUrls: ['./app.component.scss'],
})
export class AppComponent {
	public count = 0;

	constructor(
    private http: HttpClient,
	) {
		this.getCounter();
	}

	public updateCounter(): void {
		this.http.patch('http://thiagocosta.me/api/counter/1', { count: ++this.count }).subscribe(
			(res) => {
				console.info(res);
			},
			(err) => {
				console.error(err);
			},
		);
	}

	public getCounter(): void {
		this.http.get('http://thiagocosta.me/api/counter/1').subscribe(
			(response: any) => {
				console.info(response);
				this.count = response.data.count;
			},
			(err: any) => {
				console.error(err);
			},
		);
	}
}
