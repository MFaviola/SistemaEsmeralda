import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';

import { Proveedor } from '../Models/ProveedorViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Proveedor/List'

  getProveedor(){
    return this.http.get<Proveedor[]>(this.url)
  }

  EnviarProveedor(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Proveedor/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
}
