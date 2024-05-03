import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';

import { Joya } from '../Models/JoyaViewModel';
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
}
