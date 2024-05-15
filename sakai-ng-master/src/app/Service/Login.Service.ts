import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Login, validar } from '../Models/ValidarViewModel';
import { Observable } from 'rxjs';




 @Injectable({
   providedIn: 'root'
 })
 export class ServiceService {
   constructor(private http:HttpClient) { }
  //  url = BASE_URL + 'API/Cargo/List'


  UrlLogin = BASE_URL + 'API/Usuario/Validar/';
  login(loginData: Login): Observable<any> {
      return this.http.get<any>(`${this.UrlLogin}${loginData.usuario},${loginData.contra}`, {});
    }

  Urlmuestra = BASE_URL + 'API/Usuario/';
  enviarcodigo(loginData: validar): Observable<any>{
    return this.http.get<any>(`${this.Urlmuestra}EnviarCodigo${loginData}`);
  }

  //  getLogin(){
  //    return this.http.get<Login[]>(this.url)
   }



















