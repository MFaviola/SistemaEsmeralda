import { Injectable } from '@angular/core';
import { jsPDF } from 'jspdf';
import autoTable from 'jspdf-autotable'
@Injectable({
  providedIn: 'root'
})
export class YService {

  constructor() { }
   imprimirFactura(cuerpo, logoURL, Cliente,DNI,Muni,Depa,Numero,Fecha,Pedido,Imouesto,Metodo,Subtotal,Total) {
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
  doc.html(document.body, {
    callback: function (doc) {
      doc.save();
    } 
 });
}
  
   
  
}
