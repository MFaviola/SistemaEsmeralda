import { Injectable } from '@angular/core';
import {Categoria} from '../Models/CategoriaViewModel';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Categoria/List'

  getCategoria(){
    return this.http.get<Categoria[]>(this.url)
  }
}
