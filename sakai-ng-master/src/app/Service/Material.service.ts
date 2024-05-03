import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { Material,Fill } from '../Models/MaterialViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';




@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }


  url = BASE_URL + 'API/Material/List'

  getMaterial(){
    return this.http.get<Material[]>(this.url)
  }

  EnviarMaterial(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Material/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${BASE_URL + 'API/Material/Fill/' + codigo}`);
  }
  EliminarMaterial(ID): Observable<any>{
    return this.http.delete<any>(`${BASE_URL + 'API/Material/Delete/' + ID}`)
  }
  ActualizarMaterial(formData){
    return this.http.put(BASE_URL + 'API/Material/Edit/', formData)
  }
}
