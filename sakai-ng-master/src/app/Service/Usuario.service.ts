import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';

import { Usuario } from '../Models/UsuarioVIewModel';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Usuario/List'

  getUsuario(){
    return this.http.get<Usuario[]>(this.url)
  }
}
