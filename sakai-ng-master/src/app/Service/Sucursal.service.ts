import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';


import { Sucursal } from '../Models/SucursalViewModel';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Sucursal/List'

  getSucursal(){
    return this.http.get<Sucursal[]>(this.url)
  }
}
