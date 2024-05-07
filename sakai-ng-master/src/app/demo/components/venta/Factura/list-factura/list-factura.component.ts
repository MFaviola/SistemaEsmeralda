import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Factura } from 'src/app/Models/FacturaViewModel';
import { ServiceService } from 'src/app/Service/Factura.service';
import { YService } from '../../Impresion/impresion.service';
import { Cliente } from 'src/app/Models/ClienteViewModel';

@Component({
  templateUrl: './list-factura.component.html',
  providers: [ConfirmationService, MessageService]
})
export class ListFacturaComponent {
  Factura!:Factura[];

  statuses: any[] = [];

  products: Product[] = [];
  productDialog: boolean = false;
  rowGroupMetadata: any;
  submitted: boolean = false;

  display: boolean = false;
  activityValues: number[] = [0, 100];

  isExpanded: boolean = false;

  idFrozen: boolean = false;

  loading: boolean = false;
 
  @ViewChild('filter') filter!: ElementRef;

  selectedState: any = null;

  states: any[] = [
      {name: 'Arizona', code: 'Arizona'},
      {name: 'California', value: 'California'},
      {name: 'Florida', code: 'Florida'},
      {name: 'Ohio', code: 'Ohio'},
      {name: 'Washington', code: 'Washington'}
  ];

  dropdownItems = [
      { name: 'Option 1', code: 'Option 1' },
      { name: 'Option 2', code: 'Option 2' },
      { name: 'Option 3', code: 'Option 3' },
      { name: 'Option 3', code: 'Option 3' },
      { name: 'Option 3', code: 'Option 3' },
      
  ];

  cities1: any[] = [];

  cities2: any[] = [];

  city1: any = null;

  city2: any = null;
  facura_impresa: any = null;
  constructor(private service: ServiceService, private router: Router, private srvImprecion : YService
  
  ) { }


  ngOnInit(): void {
      this.service.getFacturas().subscribe((data: any)=>{
          console.log(data);
          this.Factura = data;
      },error=>{
        console.log(error);
      });
   } 

   Imprimir(){
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
    this.facura_impresa = this.srvImprecion.Reporte1PDF(cuerpo,img,cliente,DNI,Municipi,Depa,Numero,Fecha,Factura,Impuesto,Metodo,Subtotal,Total)
 } 
}
