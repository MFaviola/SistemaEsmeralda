import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Productos,MaquillajeMes, JoyaMes, MaqJoyaMes,totalJo,totalMa,totalanual,totalcate } from '../Models/GraficosViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';
import { Fill } from '../Models/DashboardViewModel';
import { FacturaDetalle } from '../Models/FacturaViewModel';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }

  EnviarCierre(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Caja/CerrarCaja/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
  url = BASE_URL + 'API/Graficos/VentaMes'
  url2 = BASE_URL + 'API/'
  getproducto(){
    return this.http.get<Productos[]>(this.url)
  }

  getValidacion(codigo: string, sucu: string): Observable<Fill[]> {
    return this.http.get<Fill[]>(this.url2 + 'Caja/Validacion/' + codigo + ',' + sucu);
  }
  getFacturasDetalle(id){
    return this.http.get<FacturaDetalle[]>(BASE_URL + 'API/Factura/VentasDelDia/' + id)
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

////////////////FILTRADOS //////////////////


// getventasporcategoria(anio: string): Observable<totalanual> {
//   return this.http.get<totalanual>(`${BASE_URL + 'API/Graficos/Ventatotales' + anio}`);
// }

getventasporcategoria(anio: string): Observable<totalanual[]> {
  const url = `${BASE_URL}API/Graficos/Ventatotales/${anio}`;
  return this.http.get<totalanual[]>(url);
}


getcategoriatotal(anio: string): Observable<totalcate[]> {
  const url = `${BASE_URL}API/Graficos/Ventatotalescatgoria/${anio}`;
  return this.http.get<totalcate[]>(url);
}




getcantidadvendidaanio(fechaInicio: string, fechaFin: string): Observable<totalcate[]> {
  const url = `${BASE_URL}API/Graficos/cantidadMesfiltrado/${fechaInicio}/${fechaFin}`;
  return this.http.get<totalcate[]>(url);
}






getotalmesescategorias(fechainicio: string, fechafin: string): Observable<MaqJoyaMes[]> {
  const url = `${BASE_URL}API/Graficos/totaldMesfiltrado/${fechainicio}/${fechafin}`;
  return this.http.get<MaqJoyaMes[]>(url);
}




top5maquillaje(fechainicio: string, fechafin: string): Observable<MaquillajeMes[]> {
  const url = `${BASE_URL}API/Graficos/top5maquillaje/${fechainicio}/${fechafin}`;
  return this.http.get<MaquillajeMes[]>(url);
}


top5joyas(fechainicio: string, fechafin: string): Observable<MaquillajeMes[]> {
  const url = `${BASE_URL}API/Graficos/top5joyas/${fechainicio}/${fechafin}`;
  return this.http.get<MaquillajeMes[]>(url);
}



}
