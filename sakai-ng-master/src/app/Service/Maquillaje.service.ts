import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';


import { Maquillaje } from '../Models/MaquillajeViewModel';
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
}
