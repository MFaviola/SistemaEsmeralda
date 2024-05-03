import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Cliente } from '../Models/ClienteViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {
  constructor(private http:HttpClient) { }
  url = BASE_URL + 'API/Cliente/List'

  getClientes(){
    return this.http.get<Cliente[]>(this.url)
  }


  
  EnviarCliente(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Cliente/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }

}