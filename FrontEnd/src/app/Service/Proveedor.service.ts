import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';

import { Proveedor,Fill } from '../Models/ProveedorViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';
import { dropDepartamento } from '../Models/DepartamentoViewModel';
import { dropMunicipio } from '../Models/MunicipioViewModel';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }

  urlDrop = BASE_URL + 'API/Departamento/DropDown'

  getDropDownsDepartamentos(){
    return this.http.get<dropDepartamento[]>(this.urlDrop)
  }

  getMunicipios(codigo){
    return this.http.get<dropMunicipio[]>(BASE_URL + 'API/Municipio/Lista/' + codigo )
  }

  url = BASE_URL + 'API/Proveedor/List'

  getProveedor(){
    return this.http.get<Proveedor[]>(this.url)
  }

  EnviarProveedor(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Proveedor/Create/', formData).pipe(
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
