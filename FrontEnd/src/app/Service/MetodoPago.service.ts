import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';


import { Metodo,Fill } from '../Models/MetodoPagoViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/MetodoPago/List'

  getMetodo(){
    return this.http.get<Metodo[]>(this.url)
  }

  EnviarMetodoPago(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/MetodoPago/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${BASE_URL + 'API/MetodoPago/Fill/' + codigo}`);
  }
  EliminarMetodoPago(ID): Observable<any>{
    return this.http.delete<any>(`${BASE_URL + 'API/MetodoPago/Delete/' + ID}`)
  }
  ActualizarMetodoPago(formData){
    return this.http.put(BASE_URL + 'API/MetodoPago/Edit/', formData)
  }
}
