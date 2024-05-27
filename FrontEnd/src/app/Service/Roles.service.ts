import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Rol,Fill } from '../Models/RolViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';
import { Fill2 } from '../Models/DashboardViewModel';
import { FacturaDetalle } from '../Models/FacturaViewModel';


interface Pantalla {
  pant_Descripcion: string;
}

@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }
  url2 = BASE_URL + 'API/'

  getFacturasVentas(id){
    return this.http.get<FacturaDetalle[]>(BASE_URL + 'API/Factura/VentasDelDia/' + id)
  }
  getValidacion(codigo: string, sucu: string): Observable<Fill2[]> {
    return this.http.get<Fill2[]>(this.url2 + 'Caja/Validacion/' + codigo + ',' + sucu);
  }
  EnviarCierre(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Caja/CerrarCaja/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
  EnviarAbierto(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Caja/AbrirCaja/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }

  url = BASE_URL + 'API/Rol/List'

  getRol(){
    return this.http.get<Rol[]>(this.url)
  }


  EnviarRol(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Rol/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
  getPantallasDeRol(idRoll: Number) {
    return this.http.get<Pantalla[]>(`${BASE_URL + 'API/Rol/PantallasRol/' + idRoll}`);
  }
  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${BASE_URL + 'API/Rol/Fill/' + codigo}`);
  }
  getDetalles(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${BASE_URL + 'API/Rol/FillDetalles/' + codigo}`);
  }
  EliminarRol(ID): Observable<any>{
    return this.http.delete<any>(`${BASE_URL + 'API/Rol/Delete/' + ID}`)
  }
  ActualizarRol(formData){
    return this.http.put(BASE_URL + 'API/Rol/Edit/', formData)
  }
}
