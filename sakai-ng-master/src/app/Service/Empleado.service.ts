import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';

import { Empleado,Fill } from '../Models/EmpleadoViewModel';
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

    
  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${BASE_URL + 'API/Empleado/Fill/' + codigo}`);
  }
  EliminarEmpleado(ID): Observable<any>{
    return this.http.delete<any>(`${BASE_URL + 'API/Empleado/Delete/' + ID}`)
  }
  ActualizarEmpleado(formData){
    return this.http.put(BASE_URL + 'API/Empleado/Edit/', formData)
  }

}