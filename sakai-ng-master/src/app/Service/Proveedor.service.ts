import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';

import { Proveedor } from '../Models/ProveedorViewModel';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Proveedor/List'

  getProveedor(){
    return this.http.get<Proveedor[]>(this.url)
  }
}
