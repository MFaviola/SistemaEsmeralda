import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Impuesto } from '../Models/ImpuestoViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';



@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Impuesto/List'

  getImpuesto(){
    return this.http.get<Impuesto[]>(this.url)
  }
  EnviarImpuesto(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Impuesto/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }

}
