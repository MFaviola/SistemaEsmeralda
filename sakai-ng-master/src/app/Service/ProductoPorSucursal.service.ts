import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';

import { Proveedor,Fill } from '../Models/ProveedorViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';
import { dropDepartamento } from '../Models/DepartamentoViewModel';
import { dropMunicipio } from '../Models/MunicipioViewModel';
import { dropSucursal } from '../Models/SucursalViewModel';
import { dropJoya, dropJoyaStock } from '../Models/JoyaViewModel';
import { ProductoPorSucursalDetalle } from '../Models/ProductoPorSucursalViewModel';




@Injectable({
  providedIn: 'root'
})
export class ProductoPorSucursalesService {

  constructor(private http:HttpClient) { }



  getAutoCompletadoJoya(id){
    return this.http.get<dropJoyaStock[]>(BASE_URL + 'API/Joyas/AutoCompletadoSucursal/' + id)
  }
  getAutoCompletadoMaquillaje(id){
    return this.http.get<dropJoyaStock[]>(BASE_URL + 'API/Maquillaje/AutoCompletadoSucursal/' + id)
  }

  getFacturasDetalle(id){
    return this.http.get<ProductoPorSucursalDetalle[]>(BASE_URL + 'API/ProductosPorSucursales/ListaDetalles/' + id)
  }

  urlDropSucursales = BASE_URL + 'API/Sucursal/DropDown'

  getDropDownsSucursales(){
    return this.http.get<dropSucursal[]>(this.urlDropSucursales)
  }

  getMunicipios(codigo){
    return this.http.get<dropMunicipio[]>(BASE_URL + 'API/Municipio/Lista/' + codigo )
  }

  url = BASE_URL + 'API/Proveedor/List'

  getProveedor(){
    return this.http.get<Proveedor[]>(this.url)
  }

  EnviarProductos(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/ProductosPorSucursales/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${BASE_URL + 'API/Proveedor/Fill/' + codigo}`);
  }
  EliminarProveedor(ID): Observable<any>{
    return this.http.delete<any>(`${BASE_URL + 'API/Proveedor/Delete/' + ID}`)
  }
  ActualizarProveedor(formData){
    return this.http.put(BASE_URL + 'API/Proveedor/Edit/', formData)
  }
}
