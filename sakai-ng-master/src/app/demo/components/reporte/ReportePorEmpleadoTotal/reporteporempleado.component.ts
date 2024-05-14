import { Component, OnInit } from '@angular/core';
import { YService } from '../../venta/Impresion/impresion.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { BASE_URL } from 'src/app/Service/ulrsettings';
import { ServiceService } from 'src/app/Service/Factura.service';
import { EmpleadoRe } from 'src/app/Models/FacturaViewModel';
import { Injectable } from '@angular/core';
import { jsPDF } from 'jspdf';
import autoTable from 'jspdf-autotable'
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
    this.generarReportePorEmpleados();
  }

  generarReportePorEmpleados() {
    this.service.GetReportePorEmpleado(0).subscribe((data: EmpleadoRe[]) => {
      this.Empleado = data;
      console.log(data);
      const doc = new jsPDF({
        orientation: 'portrait',
        unit: 'px',
        format: 'letter'
      });

      const imgWidth = 200;
      const imgHeight = 50;
      const img = "assets/demo/images/galleria/Esmeraldas.png";

      doc.addImage(img, 'JPEG', 10, 10, imgWidth, imgHeight);
      doc.setFontSize(10);
      doc.setFont(undefined, 'bold');
      doc.text('Esmeraldas HN', 140 * 2, 30);
      doc.setFontSize(10);
      doc.setFont(undefined, 'normal');
      doc.text('Dirección :', 140 * 2, 40);
      doc.text("Tegucigalpa: Los dolores, calle buenos aires", 140 * 2, 50);

      let pageNumber = 1;

      const empleadosAgrupados = this.groupBy(this.Empleado, 'empl_Id');
      const empleadoIds = Object.keys(empleadosAgrupados);

      empleadoIds.forEach((empleadoId, index) => {
        const facturasArray = empleadosAgrupados[empleadoId] as EmpleadoRe[];
        const empleadoNombre = facturasArray[0].empl_Nombre;
        const totalEmpleado = facturasArray.reduce((sum, item) => sum + (parseFloat(item.total) || 0), 0).toFixed(2);

        // Imprimir nombre del empleado
        doc.setFontSize(10);
        doc.setFont(undefined, 'bold');
        const yPosition = pageNumber === 1 ? 80 : (doc as any).previousAutoTable ? (doc as any).previousAutoTable.finalY + 30 : 80;
        doc.text(`Empleado: ${empleadoNombre}`, doc.internal.pageSize.getWidth() / 2, yPosition, { align: 'center' });

        const cuerpo = facturasArray.map(item => [
          item.factura,
          item.fact_FechaFinalizado,
          item.total,
        ]);

        autoTable(doc, {
          head: [['Factura', 'Fecha', 'Total']],
          body: cuerpo,
          startY: yPosition + 20, // Reducir espacio entre tablas
          styles: {
            fontSize: 10,
          },
          headStyles: {
            fillColor: [0, 0, 0],
            textColor: [255, 255, 255],
            halign: 'center',
            valign: 'middle',
            fontStyle: 'bold',
          },
          columnStyles: {
            0: { halign: 'center' },  
            1: { halign: 'center' }, 
            2: { halign: 'center' }, 
          },
          theme: 'grid',
          didDrawPage: (data) => {
            this.footer(doc, pageNumber);
            pageNumber++;
          }
        });

        // Mover el total debajo de la tabla y alinearlo a la derecha
        doc.setFontSize(10);
        doc.setFont(undefined, 'bold');
        doc.text(`Total: ${totalEmpleado}`, doc.internal.pageSize.getWidth() - 60, (doc as any).previousAutoTable.finalY + 15, { align: 'right' });

        // Añadir una nueva página si el contenido excede el límite
        if ((doc as any).previousAutoTable.finalY + 30 > doc.internal.pageSize.getHeight()) {
          doc.addPage();
          pageNumber++;
        }
      });

      const blob = doc.output('blob');
      const url = URL.createObjectURL(blob);
      this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
      console.log("Se muestra xd");
    }, error => {
      console.log(error);
    });
  }

  groupBy(array: EmpleadoRe[], key: string) {
    return array.reduce((result, currentValue) => {
      (result[currentValue[key]] = result[currentValue[key]] || []).push(currentValue);
      return result;
    }, {});
  }

  footer(doc: jsPDF, pageNumber: number) {
    doc.setFontSize(10);
    doc.setFont(undefined, 'normal');
    doc.text(String(pageNumber), 444, 580, { align: 'right' });
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
