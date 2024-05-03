import { Injectable } from '@angular/core';
import {Categoria} from '../Models/CategoriaViewModel';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Categoria/List'

  getCategoria(){
    return this.http.get<Categoria[]>(this.url)
  }



  EnviarCategoria(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Categoria/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
}

