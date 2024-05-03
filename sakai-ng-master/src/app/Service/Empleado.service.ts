import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';

import { Empleado } from '../Models/EmpleadoViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {
  constructor(private http:HttpClient) { }
  url = BASE_URL + 'API/Empleado/List'

  getEmpleados(){
    return this.http.get<Empleado[]>(this.url)
  }



  EnviarEmpleado(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Empleado/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }

}