import { DatePipe } from '@angular/common';
import { Component, Injectable, NgModule } from '@angular/core';
import { jsPDF } from 'jspdf';
import autoTable from 'jspdf-autotable'
@Injectable({
  providedIn: 'root',
})
export class YService {
  private pageCount = 1;

  constructor() {
   
  }

 
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
      startY: 170, 
      styles: {
          font: 'helvetica',
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

  });
 
  return doc.output('blob');

}
  
Reporte2PDF(cuerpo, logoURL, Cliente, DNI, Muni, Depa, Fecha, Pedido, Imouesto, Metodo, Subtotal, Total,FechaCreacion,Usuario) {
  const doc = new jsPDF({
    orientation: 'portrait',
    unit: 'px',
    format: 'letter'
  });

  let pageNumber = 1; 
  const imgWidth = 200;
  const imgHeight = 50;
  doc.addImage(logoURL, 'JPEG', 10, 10, imgWidth, imgHeight);

  const footer = () => {
    doc.setFontSize(10);
    doc.setFont(undefined, 'normal');
    doc.text(String(pageNumber), 444, 580, { align: 'right' });
    doc.text('Usuario:' + Usuario, 10,570);
    doc.text('Fecha:' + FechaCreacion, 10,580);
  };

  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Esmeraldas HN', 270, 30);

  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text('Dirección :', 270, 40);
  doc.text("Tegucigalpa: Los dolores, calle buenos aires", 270, 50);

  doc.setFontSize(16);
  doc.setFont(undefined, 'bold');
  doc.text("PEDIDO", 32, 100);

  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text(DNI, 32, 110);
  doc.text("Cliente: " + Cliente, 32, 120);
  doc.text("Municipio: " + Muni, 32, 130);
  doc.text("Departamento: " + Depa, 32, 140);

  doc.text("Fecha Pedido: " + Fecha, 270, 100);
  doc.text("Codigo Pedido: " + Pedido, 270, 110);
  doc.text("Impuesto: " + Imouesto, 270, 120);
  doc.text("Metodo Pago: " + Metodo, 270, 130);
  doc.text("Subtotal: " + Subtotal, 270, 140);
  doc.setFont(undefined, 'bold');
  doc.text("Total: " + Total, 270, 150);

  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text("Producto ", 32, 180);
  doc.text("Cantidad ", 268, 180);
  doc.text("Precio", 328, 180);
  doc.text("Subtotal", 388, 180);

  let startY = 200;
  cuerpo.forEach(row => {
    doc.setFont(undefined, 'normal');
    doc.text(row[0], 32, startY);
    doc.text(row[1], 280, startY);
    doc.text(row[2], 340, startY);
    doc.text(row[3], 400, startY);
    startY += 20;

    if (startY > 750) {  
      footer();
      doc.addPage();
      pageNumber++;
      startY = 40;  
    }
  });

  footer();

  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text("Subtotal: " + Subtotal, 370, startY + 20);
  doc.setFont(undefined, 'bold');
  doc.text("Total: " + Total, 370, startY + 40);

  return doc.output('blob');
}

ReporteStock(cuerpo, logoURL: string,): Blob {
  const doc = new jsPDF({
    orientation: 'portrait',
    unit: 'px',
    format: 'letter'
  });


  let pageNumber = 1;  
  const imgWidth = 200;
  const imgHeight = 50;
  doc.addImage(logoURL, 'JPEG', 10, 10, imgWidth, imgHeight);


  
  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Esmeraldas HN', 140*2 , 30);


  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text('Dirección :', 140*2 , 40);
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text("Tegucigalpa: Los dolores, calle buenos aires", 140*2 , 50);

  doc.setFontSize(28);
  doc.setFont(undefined, 'bold');
  doc.text('Stock', 212 , 80);

  const footer = () => {
    doc.setFontSize(10);
    doc.setFont(undefined, 'normal');
    doc.text( String(pageNumber), 444, 580, { align: 'right' });
  };

  autoTable(doc, {
    
    head: [['Categoria', 'Producto', 'Stock']],
    body: cuerpo,
    startY: pageNumber === 1 ? 100 : 90,
    styles: {
      fontSize: 10,
    },
    headStyles: {
      fillColor: [0, 0, 0],
      textColor: [255, 255, 255],
      halign: 'center',
      valign: 'middle',
      fontStyle: 'bold',
    }, columnStyles: {
      0: { halign: 'center' },  
      1: { halign: 'center' }, 
      2: { halign: 'center' }, 
      3: { halign: 'center' },  
      4: { halign: 'center' }  
    },
    theme: 'grid',
    didDrawPage: (data) => {
 
  
      footer();
      pageNumber++;
    }
  });

  return doc.output('blob');
}
ReporteFacturaCompraPDF(cuerpo: any[], logoURL: string,  Fecha, Factura, Proveedor, Metodo): Blob {
  const doc = new jsPDF({
    orientation: 'portrait',
    unit: 'px',
    format: 'letter'
  });

  let pageNumber = 1;

  const imgWidth = 200;
  const imgHeight = 50;
  doc.addImage(logoURL, 'JPEG', 10, 10, imgWidth, imgHeight);

  
  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Esmeraldas HN', 140*2 , 30);


  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text('Dirección :', 140*2 , 40);
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text("Tegucigalpa: Los dolores, calle buenos aires", 140*2 , 50);

  doc.setFontSize(16);
  doc.setFont(undefined, 'bold');
  doc.text("PEDIDO", 16*2 , 100);
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text("Proveedor: " + Proveedor, 16*2 , 110);

  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text("Fecha Pedido: " + Fecha, 140*2 , 110);  
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text("Metodo Pago: " + Metodo, 140*2 , 140);

  const footer = () => {
    doc.setFontSize(10);
    doc.setFont(undefined, 'normal');
    doc.text( String(pageNumber), 444, 580, { align: 'right' });
  };
  autoTable(doc, {
    
    head: [['Factura', 'Producto', 'Cantidad', 'Categoria', 'Precio Compra','Precio Venta','Precio Mayorista', 'Subtotal']],
    body: cuerpo,
    startY: pageNumber === 1 ? 180 : 170,
    styles: {
      fontSize: 10,
    },
    headStyles: {
      fillColor: [0, 0, 0],
      textColor: [255, 255, 255],
      halign: 'center',
      valign: 'middle',
      fontStyle: 'bold',
    }, columnStyles: {
      0: { halign: 'center' },  
      1: { halign: 'center' }, 
      2: { halign: 'center' }, 
      3: { halign: 'center' },  
      4: { halign: 'center' }  
    },
    theme: 'grid',
    didDrawPage: (data) => {
 
  
      footer();
      pageNumber++;
    }
  });

  return doc.output('blob');
}
ReporteEmpleado(cuerpo, logoURL: string,Empleado,Total): Blob {
  const doc = new jsPDF({
    orientation: 'portrait',
    unit: 'px',
    format: 'letter'
  });


  let pageNumber = 1;  // Inicializar el contador de página
  const imgWidth = 200;
  const imgHeight = 50;
  doc.addImage(logoURL, 'JPEG', 10, 10, imgWidth, imgHeight);


  
  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Esmeraldas HN', 140*2 , 30);

  // Información de la empresa - Direcciones
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text('Dirección :', 140*2 , 40);
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text("Tegucigalpa: Los dolores, calle buenos aires", 140*2 , 50);

  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Empleado:' + Empleado , 30 , 80);

  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Total:' + Total , 380 , 80);




  
  // Mostrar PDF
  // Función para dibujar el pie de página
  const footer = () => {
    doc.setFontSize(10);
    doc.setFont(undefined, 'normal');
    doc.text( String(pageNumber), 444, 580, { align: 'right' });
  };

  autoTable(doc, {
    
    head: [['Factura', 'Fecha', 'Total']],
    body: cuerpo,
    startY: pageNumber === 1 ? 100 : 90,
    styles: {
      fontSize: 10,
    },
    headStyles: {
      fillColor: [0, 0, 0],
      textColor: [255, 255, 255],
      halign: 'center',
      valign: 'middle',
      fontStyle: 'bold',
    }, columnStyles: {
      0: { halign: 'center' },  
      1: { halign: 'center' }, 
      2: { halign: 'center' }, 
      3: { halign: 'center' },  
      4: { halign: 'center' }  
    },
    theme: 'grid',
    didDrawPage: (data) => {
 
  
      footer();
      pageNumber++;
    }
  });

  return doc.output('blob');
}
ReporteEmpleadoTodo(cuerpo, logoURL: string,Empleado,Total): Blob {
  const doc = new jsPDF({
    orientation: 'portrait',
    unit: 'px',
    format: 'letter'
  });


  let pageNumber = 1;  // Inicializar el contador de página
  const imgWidth = 200;
  const imgHeight = 50;
  doc.addImage(logoURL, 'JPEG', 10, 10, imgWidth, imgHeight);


  
  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Esmeraldas HN', 140*2 , 30);

  // Información de la empresa - Direcciones
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text('Dirección :', 140*2 , 40);
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text("Tegucigalpa: Los dolores, calle buenos aires", 140*2 , 50);

  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Empleado:' + Empleado , 30 , 80);

  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Total:' + Total , 380 , 80);




  
  // Mostrar PDF
  // Función para dibujar el pie de página
  const footer = () => {
    doc.setFontSize(10);
    doc.setFont(undefined, 'normal');
    doc.text( String(pageNumber), 444, 580, { align: 'right' });
  };

  autoTable(doc, {
    
    head: [['Factura', 'Fecha', 'Total']],
    body: cuerpo,
    startY: pageNumber === 1 ? 100 : 90,
    styles: {
      fontSize: 10,
    },
    headStyles: {
      fillColor: [0, 0, 0],
      textColor: [255, 255, 255],
      halign: 'center',
      valign: 'middle',
      fontStyle: 'bold',
    }, columnStyles: {
      0: { halign: 'center' },  
      1: { halign: 'center' }, 
      2: { halign: 'center' }, 
      3: { halign: 'center' },  
      4: { halign: 'center' }  
    },
    theme: 'grid',
    didDrawPage: (data) => {
 
  
      footer();
      pageNumber++;
    }
  });

  return doc.output('blob');
}
ReportePorMes(cuerpo, logoURL: string,Mes,Year,Total): Blob {
  const doc = new jsPDF({
    orientation: 'portrait',
    unit: 'px',
    format: 'letter'
  });


  let pageNumber = 1;  // Inicializar el contador de página
  const imgWidth = 200;
  const imgHeight = 50;
  doc.addImage(logoURL, 'JPEG', 10, 10, imgWidth, imgHeight);


  
  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Esmeraldas HN', 140*2 , 30);

  // Información de la empresa - Direcciones
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text('Dirección :', 140*2 , 40);
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text("Tegucigalpa: Los dolores, calle buenos aires", 140*2 , 50);

  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Mes:' + Mes , 30 , 80);
  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Año:' + Year , 30 , 90);

  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Total:' + Total , 380 , 80);




  
  // Mostrar PDF
  // Función para dibujar el pie de página
  const footer = () => {
    doc.setFontSize(10);
    doc.setFont(undefined, 'normal');
    doc.text( String(pageNumber), 444, 580, { align: 'right' });
  };

  autoTable(doc, {
    
    head: [['Categoria','Producto', 'Cantidad', 'Precio','Total']],
    body: cuerpo,
    startY: pageNumber === 1 ? 100 : 90,
    styles: {
      fontSize: 10,
    },
    headStyles: {
      fillColor: [0, 0, 0],
      textColor: [255, 255, 255],
      halign: 'center',
      valign: 'middle',
      fontStyle: 'bold',
    }, columnStyles: {
      0: { halign: 'center' },  
      1: { halign: 'center' }, 
      2: { halign: 'center' }, 
      3: { halign: 'center' },  
      4: { halign: 'center' }  
    },
    theme: 'grid',
    didDrawPage: (data) => {
 
  
      footer();
      pageNumber++;
    }
  });

  return doc.output('blob');
}
ReportesTop10(cuerpo, logoURL: string,Inicio,Final,Total): Blob {
  const doc = new jsPDF({
    orientation: 'portrait',
    unit: 'px',
    format: 'letter'
  });


  let pageNumber = 1;  // Inicializar el contador de página
  const imgWidth = 200;
  const imgHeight = 50;
  doc.addImage(logoURL, 'JPEG', 10, 10, imgWidth, imgHeight);


  
  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Esmeraldas HN', 140*2 , 30);

  // Información de la empresa - Direcciones
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text('Dirección :', 140*2 , 40);
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text("Tegucigalpa: Los dolores, calle buenos aires", 140*2 , 50);

  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Fecha Inicio:' + Inicio , 30 , 80);
  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Fecha Final:' + Final , 30 , 90);

  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Total:' + Total , 380 , 80);




  
  // Mostrar PDF
  // Función para dibujar el pie de página
  const footer = () => {
    doc.setFontSize(10);
    doc.setFont(undefined, 'normal');
    doc.text( String(pageNumber), 444, 580, { align: 'right' });
  };

  autoTable(doc, {
    
    head: [['Categoria','Producto', 'Cantidad', 'Precio','Total']],
    body: cuerpo,
    startY: pageNumber === 1 ? 100 : 90,
    styles: {
      fontSize: 10,
    },
    headStyles: {
      fillColor: [0, 0, 0],
      textColor: [255, 255, 255],
      halign: 'center',
      valign: 'middle',
      fontStyle: 'bold',
    }, columnStyles: {
      0: { halign: 'center' },  
      1: { halign: 'center' }, 
      2: { halign: 'center' }, 
      3: { halign: 'center' },  
      4: { halign: 'center' }  
    },
    theme: 'grid',
    didDrawPage: (data) => {
 
  
      footer();
      pageNumber++;
    }
  });

  return doc.output('blob');
}


ReportesVentaAnual(cuerpo, logoURL: string,Ano,Total): Blob {
  const doc = new jsPDF({
    orientation: 'portrait',
    unit: 'px',
    format: 'letter'
  });


  let pageNumber = 1;  // Inicializar el contador de página
  const imgWidth = 200;
  const imgHeight = 50;
  doc.addImage(logoURL, 'JPEG', 10, 10, imgWidth, imgHeight);


  
  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Esmeraldas HN', 140*2 , 30);

  // Información de la empresa - Direcciones
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text('Dirección :', 140*2 , 40);
  doc.setFontSize(10);
  doc.setFont(undefined, 'normal');
  doc.text("Tegucigalpa: Los dolores, calle buenos aires", 140*2 , 50);

  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Año:' + Ano , 30 , 80);


  doc.setFontSize(10);
  doc.setFont(undefined, 'bold');
  doc.text('Total:' + Total , 380 , 80);




  
  // Mostrar PDF
  // Función para dibujar el pie de página
  const footer = () => {
    doc.setFontSize(10);
    doc.setFont(undefined, 'normal');
    doc.text( String(pageNumber), 444, 580, { align: 'right' });
  };

  autoTable(doc, {
    
    head: [['Categoria','Producto', 'Cantidad', 'Precio','Total']],
    body: cuerpo,
    startY: pageNumber === 1 ? 100 : 90,
    styles: {
      fontSize: 10,
    },
    headStyles: {
      fillColor: [0, 0, 0],
      textColor: [255, 255, 255],
      halign: 'center',
      valign: 'middle',
      fontStyle: 'bold',
    }, columnStyles: {
      0: { halign: 'center' },  
      1: { halign: 'center' }, 
      2: { halign: 'center' }, 
      3: { halign: 'center' },  
      4: { halign: 'center' }  
    },
    theme: 'grid',
    didDrawPage: (data) => {
 
  
      footer();
      pageNumber++;
    }
  });

  return doc.output('blob');
}

  
}
