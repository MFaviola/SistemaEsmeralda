import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Factura,Fill } from '../Models/FacturaViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';



@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Factura/List'

  getFacturas(){
    return this.http.get<Factura[]>(this.url)
  }


  EnviarFactura(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Factura/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${BASE_URL + 'API/Factura/Fill/' + codigo}`);
  }
  EliminarFactura(ID): Observable<any>{
    return this.http.delete<any>(`${BASE_URL + 'API/Factura/Delete/' + ID}`)
  }
  ActualizarFactura(formData){
    return this.http.put(BASE_URL + 'API/Factura/Edit/', formData)
  }
}
