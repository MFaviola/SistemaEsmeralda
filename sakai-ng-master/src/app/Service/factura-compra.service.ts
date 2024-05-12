import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';
import { FacturaCompraEncabezado, FacturaCompraDetalle } from '../Models/FacturaCompraViewModel';
import { dropJoya } from '../Models/JoyaViewModel';
import { Maquillaje, dropMaqui } from '../Models/MaquillajeViewModel';
import { Metodo } from '../Models/MetodoPagoViewModel';
import { dropProveedor } from '../Models/ProveedorViewModel';
@Injectable({
  providedIn: 'root'
})
export class FacturaCompraService {

  constructor(private http:HttpClient) { }

  url = BASE_URL + 'API/FacturaCompra/'

  
  urlAuto = BASE_URL + 'API/Joyas/AutoCompletado'
  getAutoCompletadoJoya(){
    return this.http.get<dropJoya[]>(this.urlAuto)
  }

  urlCProvee = BASE_URL + 'API/Proveedor/List'
  getAutoCompletadoProveedor(){
    return this.http.get<dropProveedor[]>(this.urlCProvee)
  }


  urlMetodo = BASE_URL + 'API/MetodoPago/List'
  getMetodo(){
    return this.http.get<Metodo[]>(this.urlMetodo)
  }


  urlAutoMaqui = BASE_URL + 'API/Maquillaje/Autocompletado'
  getAutoCompletadoMaquillaje(){
    return this.http.get<dropMaqui[]>(this.urlAutoMaqui)
  }


  getFacturaCompra(){
    return this.http.get<FacturaCompraEncabezado[]>(`${this.url}listado`);
  }

  getDatosPorCodigo(codigo){
    return this.http.get<Maquillaje[]>(BASE_URL + 'API/Joyas/FiltroCodigo/' + codigo)
  }

  insertarFacturaCom(facturaEnca: FacturaCompraEncabezado ): Observable<any>{
    return this.http.post<any>(`${this.url}Crear`,facturaEnca);
  }

  editarFacturaEnca(facturaencaupdate: FacturaCompraEncabezado):Observable<any>{
    return this.http.put<any>(`${this.url}Editar`,facturaencaupdate);
  }

  eliminarFactura(id) : Observable<any>{
    return this.http.delete<any>(`${this.url}Eliminar/${id}`);
  }

  fillenca(id) : Observable<any>{
    return this.http.get<any>(`${this.url}Buscar/${id}`);
  }

  insertarFacturaDeta(facturaDeta: FacturaCompraEncabezado ): Observable<any>{
    return this.http.post<any>(`${this.url}CrearDetalle`,facturaDeta);
  }
}
