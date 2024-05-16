import { Component, OnInit } from '@angular/core';
import { YService } from '../../venta/Impresion/impresion.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { BASE_URL } from 'src/app/Service/ulrsettings';
import { FormGroup, FormControl,  Validators, FormBuilder  } from '@angular/forms';
import { ServiceService } from 'src/app/Service/Factura.service';
import { Stock } from 'src/app/Models/FacturaViewModel';
import { DatePipe } from '@angular/common';
import { CookieService } from 'ngx-cookie-service';
import { Usuario } from 'src/app/Models/UsuarioVIewModel';
@Component({
  templateUrl: './reporteporstock.component.html',
  styleUrl: './reporteporstock.component.css',
  providers: [YService,DatePipe,CookieService]
})

export class reporteComponent implements OnInit  {
    //Region Fecha
    dateDay = new Date();
    conversion: string;

    //
  pdfSrc: SafeResourceUrl | null = null;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
  selectedMetodo: string = '2';
  Stock!:Stock[];
  constructor(private service:ServiceService,private yService: YService, private sanitizer: DomSanitizer,private datePipe: DatePipe, private cookie: CookieService) { }

  ngOnInit(): void {
    this.service.getControlStock(2).subscribe((data: any)=>{
      this.Stock = data;
      console.log(data);
      const cuerpo = this.Stock.map(item => [
        item.categoria.toString(),
        item.producto.toString(),
        item.stock.toString(),
      ]);

      const usuario = this.cookie.get('Empleado');
      const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
      const img = "assets/demo/images/galleria/Esmeraldas.png";
      const blob = this.yService.ReporteStock(cuerpo, img,usuario,fechaC);
      const url = URL.createObjectURL(blob);
      this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
      console.log("Se muestra xd");
  },error=>{
    console.log(error);
  });
  }

  
  selectMetodoPago(metodo: string) {
    this.selectedMetodo = metodo;
    this.service.getControlStock(this.selectedMetodo).subscribe((data: any)=>{
      this.Stock = data;
      console.log(data);
      const cuerpo = this.Stock.map(item => [
        item.categoria.toString(),
        item.producto.toString(),
        item.stock.toString(),
      ]);
      const usuario = this.cookie.get('Empleado');
      const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
      const img = "assets/demo/images/galleria/Esmeraldas.png";
      const blob = this.yService.ReporteStock(cuerpo, img,usuario,fechaC);
      const url = URL.createObjectURL(blob);
      this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
      console.log("Se muestra xd");
  },error=>{
    console.log(error);
  });

   
    console.log(metodo);
}
  
}
