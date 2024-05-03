import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';


import { Sucursal } from '../Models/SucursalViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Sucursal/List'

  getSucursal(){
    return this.http.get<Sucursal[]>(this.url)
  }

  
  EnviarRol(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Sucursal/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
}
