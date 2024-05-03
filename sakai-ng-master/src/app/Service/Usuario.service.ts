import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Usuario } from '../Models/UsuarioVIewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Usuario/List'

  getUsuario(){
    return this.http.get<Usuario[]>(this.url)
  }

  EnviarUsuario(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Usuario/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
}
