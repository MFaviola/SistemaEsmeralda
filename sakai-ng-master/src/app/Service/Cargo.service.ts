import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Cargo } from '../Models/CargoViewModel';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Cargo/List'

  getCargo(){
    return this.http.get<Cargo[]>(this.url)
  }
}
