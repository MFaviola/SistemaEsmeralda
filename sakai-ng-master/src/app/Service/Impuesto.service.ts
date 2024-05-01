import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Impuesto } from '../Models/ImpuestoViewModel';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Impuesto/List'

  getImpuesto(){
    return this.http.get<Impuesto[]>(this.url)
  }
}
