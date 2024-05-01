import { Injectable } from '@angular/core';
import {Estado} from '../Models/EstadoCivilViewModel';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/EstadoCivil/List'

  getEstadosCivil(){
    return this.http.get<Estado[]>(this.url)
  }
}
