import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BASE_URL } from './ulrsettings';
import { CajaDetalle, EmpleadoRe, Factura,FacturaDetalle,Fill, ReportePorTipo, Stock } from '../Models/FacturaViewModel';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';
import { dropJoya, dropJoyaStock } from '../Models/JoyaViewModel';
import { Maquillaje, dropMaqui } from '../Models/MaquillajeViewModel';
import { Metodo } from '../Models/MetodoPagoViewModel';
import { Cliente } from '../Models/ClienteViewModel';
import { Empleado, dropEmpleado } from '../Models/EmpleadoViewModel';
import { Fill2 } from '../Models/DashboardViewModel';
import { dropSucursal } from '../Models/SucursalViewModel';



@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }
  urlClientes = BASE_URL + 'API/Cliente/List'
  url2 = BASE_URL + 'API/'
  EnviarCierre(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Caja/CerrarCaja/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }

  EnviarAbierto(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Caja/AbrirCaja/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }

  getValidacion(codigo: string, sucu: string): Observable<Fill2[]> {
    return this.http.get<Fill2[]>(this.url2 + 'Caja/Validacion/' + codigo + ',' + sucu);
  }



  getClientes(){
    return this.http.get<Cliente[]>(this.urlClientes)
  }

  urlAuto = BASE_URL + 'API/Joyas/AutoCompletado'



 
  urlAutoEmpleado = BASE_URL + 'API/Empleado/List'

  getAutoCompletadoEmpleadoLista(){
    return this.http.get<Empleado[]>(this.urlAutoEmpleado)
  }

  urlMetodo = BASE_URL + 'API/MetodoPago/List'

  getMetodo(){
    return this.http.get<Metodo[]>(this.urlMetodo)
  }


  getAutoCompletadoJoya(id){
    return this.http.get<dropJoyaStock[]>(BASE_URL + 'API/Joyas/AutoCompletadoSucursal/' + id)
  }
  getAutoCompletadoMaquillaje(id){
    return this.http.get<dropJoyaStock[]>(BASE_URL + 'API/Maquillaje/AutoCompletadoSucursal/' + id)
  }

 
  getAutoCompletadoListaMaquillaje(id){
    return this.http.get<dropJoyaStock[]>(BASE_URL + 'API/Maquillaje/FiltroCodigoSucursal/' + id)
  }

  urlAutoLista = BASE_URL + 'API/Joyas/FiltroCodigo'

  getAutoCompletadoJoyaLista(id){
    return this.http.get<dropJoyaStock[]>(BASE_URL + 'API/Joyas/FiltroCodigoSucursal/' + id)
  }


  urlAutoMaqui = BASE_URL + 'API/Maquillaje/AutoCompletado'

 
  url = BASE_URL + 'API/Factura/List'

  getFacturas(){
    return this.http.get<Factura[]>(this.url)
  }


  getFacturasDetalle(id){
    return this.http.get<FacturaDetalle[]>(BASE_URL + 'API/Factura/ListaDetalles/' + id)
  }

  getControlStock(id,sucu){
    return this.http.get<Stock[]>(BASE_URL + 'API/Factura/ReportePorStock/' + id + ',' + sucu)
  }

  getReporteTipoPago(id){
    return this.http.get<ReportePorTipo[]>(BASE_URL + 'API/Factura/ReporteTipoPago/' + id)
  }
  urlDropSucursales = BASE_URL + 'API/Sucursal/DropDown'

  getDropDownsSucursales(){
    return this.http.get<dropSucursal[]>(this.urlDropSucursales)
  }

  GetReportePorEmpleado(empleado){
    return this.http.get<EmpleadoRe[]>(BASE_URL + 'API/Factura/ReportePorEmpleado/' + empleado)
  }

  GetReportePorMes(año,mes){
    return this.http.get<FacturaDetalle[]>(BASE_URL + 'API/Factura/ReportePorMes/' + año +',' + mes)
  }

  GetReporteTop10(fechaInicio,fechaFinal){
    return this.http.get<FacturaDetalle[]>(BASE_URL + 'API/Factura/ReporteTop10/' + fechaInicio +',' + fechaFinal)
  }

  GetReporteVentasAnual(año){
    return this.http.get<FacturaDetalle[]>(BASE_URL + 'API/Factura/ReporteVentasAnual/' + año )
  }

  GetReporteVentasMayoristas(año,mes){
    return this.http.get<FacturaDetalle[]>(BASE_URL + 'API/Factura/ReporteVentasMayoristas/' + año +',' + mes )
  }

  GetReporteCaja(Fecha,Sucu){
    return this.http.get<CajaDetalle[]>(BASE_URL + 'API/Caja/ReporteCaja/' + Fecha +',' + Sucu )
  }
  EnviarFactura(formData: any): Observable<any> {
    return this.http.post<any>(BASE_URL + 'API/Factura/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${BASE_URL + 'API/Factura/Fill/' + codigo}`);
  }

  ConfirmarFactura(id: any,pago,cambio): Observable<any> {
    return this.http.put<any>(`${BASE_URL}API/Factura/ConfirmarFactura/${id},${pago},${cambio}`, {});
  }
  EliminarDetalles(ID,Prod_Nombre,Dif): Observable<any>{
    return this.http.put<any>(`${BASE_URL + 'API/Factura/DeleteFactura/' + ID + ',' +  Prod_Nombre  + ',' +  Dif}`, {})
  }
  ActualizarFactura(formData){
    return this.http.put(BASE_URL + 'API/Factura/Edit/', formData)
  }
}
