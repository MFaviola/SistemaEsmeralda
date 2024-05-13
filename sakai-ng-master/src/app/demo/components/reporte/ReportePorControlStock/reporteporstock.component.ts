import { Component, OnInit } from '@angular/core';
import { YService } from '../../venta/Impresion/impresion.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { BASE_URL } from 'src/app/Service/ulrsettings';
import { FormGroup, FormControl,  Validators, FormBuilder  } from '@angular/forms';
import { ServiceService } from 'src/app/Service/Factura.service';
import { Stock } from 'src/app/Models/FacturaViewModel';
@Component({
  templateUrl: './reporteporstock.component.html',
  styleUrl: './reporteporstock.component.css',
  providers: [YService]
})

export class reporteComponent implements OnInit  {
  pdfSrc: SafeResourceUrl | null = null;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
  selectedMetodo: string = '2';
  Stock!:Stock[];
  constructor(private service:ServiceService,private yService: YService, private sanitizer: DomSanitizer) { }

  ngOnInit(): void {
    this.service.getControlStock(2).subscribe((data: any)=>{
      this.Stock = data;
      console.log(data);
      const cuerpo = this.Stock.map(item => [
        item.categoria.toString(),
        item.producto.toString(),
        item.stock.toString(),
      ]);

      const img = "assets/demo/images/galleria/Esmeraldas.png";
      const blob = this.yService.ReporteStock(cuerpo, img);
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

      const img = "assets/demo/images/galleria/Esmeraldas.png";
      const blob = this.yService.ReporteStock(cuerpo, img);
      const url = URL.createObjectURL(blob);
      this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
      console.log("Se muestra xd");
  },error=>{
    console.log(error);
  });

   
    console.log(metodo);
}
  
}
