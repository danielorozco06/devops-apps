import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import swal from 'sweetalert2';

@Injectable({
	providedIn: 'root'
})
export class UserService {
	base = 'devop-LoadB-4188S1IT247C-2cc64f579fd67f08.elb.us-east-1.amazonaws.com' //or localhost
	url = 'http://' + this.base + ':3000/user';

	constructor(private http: HttpClient) { }

	addUser(user) {
		return this.http.post(this.url + '/add', user);
	}

	getUser() {
		return this.http.get(this.url);
	}

	editUser(id) {
		return this.http.get(this.url + '/edit/' + id);
	}

	updateUser(id, user) {
		return this.http.post(this.url + '/update/' + id, user);
	}

	deleteUser(id) {
		return this.http.get(this.url + '/delete/' + id);
	}

	alert(mssg, status) {
		swal.fire(mssg, "", status);
	}
}
