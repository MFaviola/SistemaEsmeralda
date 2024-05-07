import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Productos,MaquillajeMes, JoyaMes, MaqJoyaMes,totalJo,totalMa,totalanual,totalcate } from '../Models/GraficosViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Graficos/VentaMes'

  getproducto(){
    return this.http.get<Productos[]>(this.url)
  }

  
  urlE = BASE_URL + 'API/Graficos/MaquillajeMes'

  getMaquillajemes(){
    return this.http.get<MaquillajeMes[]>(this.urlE)
  }


  urlj = BASE_URL + 'API/Graficos/JoyaMes'

  getJoyas(){
    return this.http.get<JoyaMes[]>(this.urlj)
  }


  urlmj = BASE_URL + 'API/Graficos/ProductoMes'

  getMaquioJoya(){
    return this.http.get<MaqJoyaMes[]>(this.urlmj)
  }









  urlmjt = BASE_URL + 'API/Graficos/JoyatotalMes'

  gettj(){
    return this.http.get<totalJo[]>(this.urlmjt)
  }


  urlmt = BASE_URL + 'API/Graficos/MaquillajetotalMes'

  gettm(){
    return this.http.get<totalMa[]>(this.urlmt)
  }



  urltt = BASE_URL + 'API/Graficos/Ventatotales'

  getto(){
    return this.http.get<totalanual[]>(this.urltt)
  }



  urltc = BASE_URL + 'API/Graficos/Ventatotalescatgoria'

  gettc(){
    return this.http.get<totalcate[]>(this.urltc)
  }


}
