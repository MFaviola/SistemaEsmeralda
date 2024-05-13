import { Component, OnInit } from '@angular/core';
import { YService } from '../../venta/Impresion/impresion.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { BASE_URL } from 'src/app/Service/ulrsettings';
import { ServiceService } from 'src/app/Service/Factura.service';
import { EmpleadoRe } from 'src/app/Models/FacturaViewModel';

@Component({
  templateUrl: './reportepormpleado.component.html',
  styleUrl: './reporteporempleado.component.css',
  providers: [YService]
})

export class reporteporempleadoComponent implements OnInit  {
  pdfSrc: SafeResourceUrl | null = null;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
  listEmpleados: any[] = [];
  selecteEmpleadoAdvanced: any[] = [];
  filtredEmpleados: any[] = [];
  Empleado!:EmpleadoRe[];
  empl_nombre: string = ""
  constructor(private service: ServiceService,private yService: YService, private sanitizer: DomSanitizer) { }

  ngOnInit(): void {
    this.service.getAutoCompletadoEmpleadoLista().subscribe(countries => {
      this.listEmpleados = countries;
    });
    this.service.GetReportePorEmpleado(3).subscribe((data: any)=>{

      this.Empleado = data;
      console.log(data);
      const cuerpo = this.Empleado.map(item => [
        item.factura,
        item.fact_FechaFinalizado,
        item.total,
      ]);
      const cuerpoSinPrimerElemento = cuerpo.slice(1);

      const total = data.reduce((sum, item) => {
        const itemTotal = parseFloat(item.total) || 0; 
        return sum + itemTotal;
            }, 0);
               


             const totales = total.toFixed(2);

      const empleado = data[0].empl_Nombre
      const img = "assets/demo/images/galleria/Esmeraldas.png";
      const blob = this.yService.ReporteEmpleado(cuerpo, img,empleado,totales);
      const url = URL.createObjectURL(blob);
      this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
      console.log("Se muestra xd");
  },error=>{
    console.log(error);
  });
  }

  flitrerEmpleado(event: any) {
    const filtered: any[] = [];
    const query = event.query;
    for (let i = 0; i < this.listEmpleados.length; i++) {
        const empleado = this.listEmpleados[i];
        
        if (empleado.empl_DNI.toLowerCase().indexOf(query.toLowerCase()) == 0) {
  
            filtered.push(empleado);
        }
    }
   
    this.filtredEmpleados = filtered;
  }

  onSelectEmpleado(event) {
   
    this.empl_nombre = event.value.empl_Nombre
    this.service.GetReportePorEmpleado(event.value.empl_Id).subscribe((data: any)=>{

      this.Empleado = data;
      console.log(data);
      const cuerpo = this.Empleado.map(item => [
        item.factura,
        item.fact_FechaFinalizado,
        item.total,
      ]);
      const cuerpoSinPrimerElemento = cuerpo.slice(1);
      const total = data.reduce((sum, item) => {
        const itemTotal = parseFloat(item.total) || 0; 
        return sum + itemTotal;
            }, 0);
               


             const totales = total.toFixed(2);

      const empleado = data[0].empl_Nombre
      const img = "assets/demo/images/galleria/Esmeraldas.png";
      const blob = this.yService.ReporteEmpleado(cuerpo, img,empleado,totales);
      const url = URL.createObjectURL(blob);
      this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
      console.log("Se muestra xd");
  },error=>{
    console.log(error);
  });
  
  }

  
}
