import { Injectable } from '@angular/core';
import { Municipio } from '../Models/MunicipioViewModel';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Municipio/List'

  getMunicipios(){
    return this.http.get<Municipio[]>(this.url)
  }
}
