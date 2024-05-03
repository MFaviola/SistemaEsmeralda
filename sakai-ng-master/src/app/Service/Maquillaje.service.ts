import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';


import { Maquillaje,Fill } from '../Models/MaquillajeViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Maquillaje/List'

  getMaquillaje(){
    return this.http.get<Maquillaje[]>(this.url)
  }



  EnviarMaquillaje(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Maquillaje/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
  
  
  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${BASE_URL + 'API/Maquillaje/Fill/' + codigo}`);
  }
  EliminarMaquillaje(ID): Observable<any>{
    return this.http.delete<any>(`${BASE_URL + 'API/Maquillaje/Delete/' + ID}`)
  }
  ActualizarMaquillaje(formData){
    return this.http.put(BASE_URL + 'API/Maquillaje/Edit/', formData)
  }
}
