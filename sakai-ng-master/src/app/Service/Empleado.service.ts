import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';

import { Empleado } from '../Models/EmpleadoViewModel';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {
  constructor(private http:HttpClient) { }
  url = BASE_URL + 'API/Empleado/List'

  getEmpleados(){
    return this.http.get<Empleado[]>(this.url)
  }
}