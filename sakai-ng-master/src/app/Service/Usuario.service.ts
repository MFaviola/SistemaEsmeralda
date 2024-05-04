import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Usuario,Fill  } from '../Models/UsuarioVIewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';
import { dropEmpleado } from '../Models/EmpleadoViewModel';
import { dropRol } from '../Models/RolViewModel';





@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }

  urlDrop = BASE_URL + 'API/Empleado/DropDown'

  getDropDownEmpleado(){
    return this.http.get<dropEmpleado[]>(this.urlDrop)
  }

  urlDropRol = BASE_URL + 'API/Rol/DropDown'

  getDropDownRol(){
    return this.http.get<dropRol[]>(this.urlDropRol)
  }



  url = BASE_URL + 'API/Usuario/List'

  getUsuario(){
    return this.http.get<Usuario[]>(this.url)
  }

  EnviarUsuario(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Usuario/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }

  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${BASE_URL + 'API/Usuario/Fill/' + codigo}`);
  }
  EliminarUsuario(ID): Observable<any>{
    return this.http.delete<any>(`${BASE_URL + 'API/Usuario/Delete/' + ID}`)
  }
  ActualizarUsuario(formData){
    return this.http.put(BASE_URL + 'API/Usuario/Edit/', formData)
  }
}
