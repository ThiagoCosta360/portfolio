import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';

@Component({
	selector: 'app-root',
	templateUrl: './app.component.html',
	styleUrls: ['./app.component.scss'],
})
export class AppComponent {
	constructor(
    private http: HttpClient,
	) { }

	public update(): void {
		this.http.get('http://localhost:64/api/').subscribe(
			(response: any) => {
				console.info(response);
			},
			(err: any) => {
				console.error(err);
			},
		);
	}
}
