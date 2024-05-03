import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Rol } from '../Models/RolViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Rol/List'

  getRol(){
    return this.http.get<Rol[]>(this.url)
  }


  EnviarRol(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Rol/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
}
