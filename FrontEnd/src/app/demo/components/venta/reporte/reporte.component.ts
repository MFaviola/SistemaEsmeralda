import { Component, OnInit } from '@angular/core';
import { YService } from '../Impresion/impresion.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { BASE_URL } from 'src/app/Service/ulrsettings';

@Component({
  templateUrl: './reporte.component.html',
  providers: [YService]
})

export class reporteComponent implements OnInit  {
  pdfSrc: SafeResourceUrl | null = null;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
 
  constructor(private yService: YService, private sanitizer: DomSanitizer) { }

  ngOnInit(): void {
    
  }

  Reporte1(){
    const cliente = "Eduardo Varela"
    const DNI = "0511200500732"
    const Municipi = "Villanueva"
    const Depa = "Cortes"
    const Numero = "99482910"
    const Fecha = "2024-12-12"
    const Factura = "1"
    const Metodo = "Tarjeta Credito"
    const Impuesto = "15%"
    const Subtotal = "900"
    const Total = "1200"
    const encabezado =["Id", "Cliente", "Empleado"]
    const cuerpo=["1", "Eduardo", "Jezer"]
    const titulo= "fdsfdsfdsfdsfdsfds";
    const img = "assets/demo/images/galleria/Esmeraldas.png"
    const blob = this.yService.Reporte1PDF(cuerpo,img,cliente,DNI,Municipi,Depa,Numero,Fecha,Factura,Impuesto,Metodo,Subtotal,Total);
    const url = URL.createObjectURL(blob);
    this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
    this.Reporte_1 = true
    this.Reporte_2 = false
  }

  Reporte2(){

    const cuerpo = [
      ['1', 'Diamante', '12', 'No'],
      ['2', 'Joya', '8', 'Sí']
    ];

    const img = "assets/demo/images/galleria/Esmeraldas.png"
    this.Reporte_1 = false
    this.Reporte_2 = true
  }

  
}
