import { Injectable } from '@angular/core';
import { Municipio } from '../Models/MunicipioViewModel';
import { dropDepartamento } from '../Models/DepartamentoViewModel';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }

  urlDrop = BASE_URL + 'API/Departamento/DropDown'

  getDropDownsDepartamentos(){
    return this.http.get<dropDepartamento[]>(this.urlDrop)
  }
  url = BASE_URL + 'API/Municipio/List'

  getMunicipios(){
    return this.http.get<Municipio[]>(this.url)
  }

  EnviarMunicipios(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Municipio/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
}
