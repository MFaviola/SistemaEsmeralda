import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';


import { Fill, Sucursal } from '../Models/SucursalViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';
import { dropMunicipio } from '../Models/MunicipioViewModel';
import { dropDepartamento } from '../Models/DepartamentoViewModel';




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
  url = BASE_URL + 'API/Sucursal/List'

  getSucursal(){
    return this.http.get<Sucursal[]>(this.url)
  }

  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${BASE_URL + 'API/Sucursal/Fill/' + codigo}`);
  }
  EnviarSucursal(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Sucursal/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }

  EliminarSucursal(ID): Observable<any>{
    return this.http.delete<any>(`${BASE_URL + 'API/Sucursal/Delete/' + ID}`)
  }
  ActualizarSucursal(formData){
    return this.http.put(BASE_URL + 'API/Sucursal/Edit/', formData)
  }
}
