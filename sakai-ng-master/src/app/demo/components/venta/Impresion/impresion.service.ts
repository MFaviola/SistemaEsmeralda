import { Injectable } from '@angular/core';
import { jsPDF } from 'jspdf';
import autoTable from 'jspdf-autotable'
@Injectable({
  providedIn: 'root'
})
export class YService {
    private pageCount = 1;
  constructor() { }
   Reporte1PDF(cuerpo, logoURL, Cliente,DNI,Muni,Depa,Numero,Fecha,Pedido,Imouesto,Metodo,Subtotal,Total): Blob {
    const doc = new jsPDF({
        orientation: 'portrait',
        unit: 'px',
        format: 'letter'
    });

    // Logo
    const imgWidth = 200;
    const imgHeight = 50;
    doc.addImage(logoURL, 'JPEG', 10, 10, imgWidth, imgHeight);

    // Título del Documento - ACOSA Honduras
    doc.setFontSize(12);
    doc.setFont(undefined, 'bold');
    doc.text('Esmeraldas HN', 140*2 , 30);

    // Información de la empresa - Direcciones
    doc.setFontSize(12);
    doc.setFont(undefined, 'normal');
    doc.text('Direccion:', 140*2 , 40);
    doc.setFontSize(12);
    doc.setFont(undefined, 'normal');
    doc.text("San Pedro Sula: Barrio San Fernando,", 140*2 , 50);
    doc.setFontSize(12);
    doc.setFont(undefined, 'normal');
    doc.text("Salida Vieja a La Lima, SPS", 140*2 , 60);
    doc.setFontSize(20);
    doc.setFont(undefined, 'bold');
    doc.text("Pedido", 16*2 , 100);
    doc.setFontSize(14);
    doc.setFont(undefined, 'normal');
    doc.text("Cliente: " + Cliente, 16*2 , 110);
    doc.setFontSize(14);
    doc.setFont(undefined, 'normal');
    doc.text("DNI: " + DNI, 16*2 , 120);
    doc.setFontSize(14);
    doc.setFont(undefined, 'normal');
    doc.text("Municipio: " + Muni, 16*2 , 130);
    doc.setFontSize(14);
    doc.setFont(undefined, 'normal');
    doc.text("Departamento: " + Depa, 16*2 , 140);
    doc.setFontSize(14);
    doc.setFont(undefined, 'normal');
    doc.text("Numero: " + Numero, 16*2 , 150);
    doc.setFontSize(14);
    doc.setFont(undefined, 'normal');
    doc.text("Fecha Pedido: " + Fecha, 140*2 , 110);  
    doc.setFontSize(14);
    doc.setFont(undefined, 'normal');
    doc.text("Codigo Pedido: " + Pedido, 140*2 , 120);
    doc.setFontSize(14);
    doc.setFont(undefined, 'normal');
    doc.text("Impuesto: " + Imouesto, 140*2 , 130);
    doc.setFontSize(14);
    doc.setFont(undefined, 'normal');
    doc.text("Metodo Pago: " + Metodo, 140*2 , 140);

    doc.setFontSize(14);
    doc.setFont(undefined, 'normal');
    doc.text("Subtotal: " + Subtotal, 140*2, 150);
    doc.setFontSize(14);
    doc.setFont(undefined, 'bold');
    doc.text("Total: " + Total, 140*2, 160);
    // Mostrar PDF
    autoTable(doc, {
      head: [['Producto', 'Cantidad', 'Sin ISV','Total']],
      body: [
          ['Diamante', '3', '500','600'],
          ['Joya', '2', '700','900'],
      ],
      startY: 170, // Inicio de la tabla
      styles: {
          font: 'helvetica',
          fontSize: 10,
      },
      headStyles: {
          fillColor: [0, 0, 0], // Fondo negro
          textColor: [255, 255, 255], // Texto blanco
          halign: 'center',
          valign: 'middle',
          fontStyle: 'bold',
      },
      theme: 'grid',

  });
  // Aquí puedes continuar con la sección de detalles del cliente y de la factura
  
  return doc.output('blob');

}
  

Reporte2PDF(cuerpo: any[], logoURL: string): Blob {
    const doc = new jsPDF({
      orientation: 'portrait',
      unit: 'px',
      format: 'letter'
    });

    autoTable(doc, {
      head: [['Codigo', 'Producto', 'Stock', 'Pedir']],
      body: cuerpo,
      startY: 130,
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
      theme: 'grid',
      didDrawPage: (data) => {
        // Encabezado
        doc.setFontSize(12);
        doc.setFont(undefined, 'bold');
        const imgWidth = 120;
        const imgHeight = 20;
        doc.addImage(logoURL, 'JPEG', 10, 20, imgWidth, imgHeight);
        doc.text('Esmeraldas HN', 280, 30);
        doc.text('Direccion:', 280, 40);
        doc.text("San Pedro Sula: Barrio San Fernando,", 280, 50);
        doc.text("Salida Vieja a La Lima, SPS", 280, 60);

        // Pie de página
        doc.setFontSize(10);
        doc.setFont(undefined, 'normal');
        doc.text('Página ' + String(data.pageNumber) + ' de ' + String(this.pageCount++), 510, 780, { align: 'right' });
      }
    });

    this.pageCount = 1;  // Restablecer el contador de páginas para futuras impresiones
    return doc.output('blob');
  }
  
}
