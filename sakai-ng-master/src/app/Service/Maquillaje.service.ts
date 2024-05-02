import { Injectable } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';


import { Maquillaje } from '../Models/MaquillajeViewModel';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Maquillaje/List'

  getMaquillaje(){
    return this.http.get<Maquillaje[]>(this.url)
  }
}
