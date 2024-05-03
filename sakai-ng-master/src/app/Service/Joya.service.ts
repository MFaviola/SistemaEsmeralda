import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';

import { Joya,Fill } from '../Models/JoyaViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Joyas/List'

  getJoya(){
    return this.http.get<Joya[]>(this.url)
  }



  EnviarJoyas(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Joyas/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }

  
  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${BASE_URL + 'API/Joyas/Fill/' + codigo}`);
  }
  EliminarJoyas(ID): Observable<any>{
    return this.http.delete<any>(`${BASE_URL + 'API/Joyas/Delete/' + ID}`)
  }
  ActualizarJoyas(formData){
    return this.http.put(BASE_URL + 'API/Joyas/Edit/', formData)
  }
}
