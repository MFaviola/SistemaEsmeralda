import { Injectable } from '@angular/core';
import {Departamento} from '../Models/DepartamentoViewModel';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Departamento/List'

  getDepartamentos(){
    return this.http.get<Departamento[]>(this.url)
  }
}
