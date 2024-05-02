import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Factura } from '../Models/FacturaViewModel';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Factura/List'

  getFacturas(){
    return this.http.get<Factura[]>(this.url)
  }
}
