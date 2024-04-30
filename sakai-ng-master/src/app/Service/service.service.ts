import { Injectable } from '@angular/core';
import {Departamento} from '../Models/DepartamentoViewModel';
import { HttpClient } from '@angular/common/http';





@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = 'https://localhost:44310/API/Departamento/List'

  getDepartamentos(){
    return this.http.get<Departamento[]>(this.url)
  }
}
