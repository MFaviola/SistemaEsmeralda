import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Factura,FacturaDetalle,Fill } from '../Models/FacturaViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';
import { dropJoya } from '../Models/JoyaViewModel';
import { Maquillaje, dropMaqui } from '../Models/MaquillajeViewModel';
import { Metodo } from '../Models/MetodoPagoViewModel';
import { Cliente } from '../Models/ClienteViewModel';



@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }
  urlClientes = BASE_URL + 'API/Cliente/List'

  getClientes(){
    return this.http.get<Cliente[]>(this.urlClientes)
  }

  urlAuto = BASE_URL + 'API/Joyas/AutoCompletado'

  getAutoCompletadoJoya(){
    return this.http.get<dropJoya[]>(this.urlAuto)
  }

  urlMetodo = BASE_URL + 'API/MetodoPago/List'

  getMetodo(){
    return this.http.get<Metodo[]>(this.urlMetodo)
  }
  urlAutoMaqui = BASE_URL + 'API/Maquillaje/AutoCompletado'

  getAutoCompletadoMaquillaje(){
    return this.http.get<dropMaqui[]>(this.urlAutoMaqui)
  }
  url = BASE_URL + 'API/Factura/List'

  getFacturas(){
    return this.http.get<Factura[]>(this.url)
  }


  getFacturasDetalle(id){
    return this.http.get<FacturaDetalle[]>(BASE_URL + 'API/Factura/ListaDetalles/' + id)
  }

  getDatosPorCodigo(codigo){
    return this.http.get<Maquillaje[]>(BASE_URL + 'API/Joyas/FiltroCodigo/' + codigo)
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
  EliminarDetalles(ID,Prod_Nombre): Observable<any>{
    return this.http.delete<any>(`${BASE_URL + 'API/Factura/DeleteFactura/' + ID + ',' +  Prod_Nombre}`)
  }
  ActualizarFactura(formData){
    return this.http.put(BASE_URL + 'API/Factura/Edit/', formData)
  }
}
