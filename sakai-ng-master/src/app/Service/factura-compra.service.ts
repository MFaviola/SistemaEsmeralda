import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';
import { FacturaCompraEncabezado } from '../Models/FacturaCompraViewModel';

@Injectable({
  providedIn: 'root'
})
export class FacturaCompraService {

  constructor(private http:HttpClient) { }

  url = BASE_URL + 'API/FacturaCompra/'

  getFacturaCompra(){
    return this.http.get<FacturaCompraEncabezado[]>(this.url)
  }

}
