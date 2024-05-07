import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Factura, FacturaEnviar } from 'src/app/Models/FacturaViewModel';
import { ServiceService } from 'src/app/Service/Factura.service';
import { YService } from '../../Impresion/impresion.service';
import { Cliente } from 'src/app/Models/ClienteViewModel';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { MegaMenuItem, MenuItem } from 'primeng/api';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
@Component({
  templateUrl: './list-factura.component.html',
  providers: [ConfirmationService, MessageService]
})
export class ListFacturaComponent {
  Factura!:Factura[];

  routeItems: MenuItem[] = [];
  MensajeViewModel!: MensajeViewModel[];
  submitted: boolean = false;
  loading: boolean = false;
  departamentos: any[] = [];
  fill: any[] = [];
  viewModel: FacturaEnviar = new FacturaEnviar();
  FacturaForm: FormGroup;
 
  @ViewChild('filter') filter!: ElementRef;
  Collapse: boolean = false;
  DataTable: boolean = true;
  Tabla: boolean = false;
  Detalles: boolean = false;
  Agregar: boolean = true;
  MunCodigo: boolean = true;
  Valor: string = "";
  staticData = [{}];


  deleteProductDialog: boolean = false;
  //Detalle
  Esta: String = "";
  id: string="";
  UsuarioCreacion: String = "";
  UsuarioModificacion: String = "";
  FechaCreacion: String = "";
  FechaModificacion: String = "";
  ID: String = "";
  facura_impresa: any = null;
  constructor(private service: ServiceService, private router: Router, private srvImprecion : YService,
    private messageService: MessageService
  
  ) { }


  ngOnInit(): void {
      this.service.getFacturas().subscribe((data: any)=>{
          console.log(data);
          this.Factura = data;
      },error=>{
        console.log(error);
      });
      this.FacturaForm = new FormGroup({
        Impu_Id: new FormControl("0",Validators.required),
        Mepa_Id: new FormControl("", Validators.required),
        Empl_Id: new FormControl("", [Validators.required]),
        Clie_Id: new FormControl("", [Validators.required]),
        Clie_DNI: new FormControl("", [Validators.required]),
        Impu_Impuesto: new FormControl("15%",Validators.required),
        Clie_Nombre: new FormControl("Usuario Final", [Validators.required]),
        Empl_Nombre: new FormControl("Eduardo Varela", [Validators.required]),
    });
      this.routeItems = [
        { label: 'Personal', routerLink: 'personal' },
        { label: 'Seat', routerLink: 'seat' },
        { label: 'Payment', routerLink: 'payment' },
        { label: 'Confirmation', routerLink: 'confirmation' },
    ];
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
 cancelar(){
  this.Collapse= false;
  this.DataTable = true;
  this.Detalles = false;
  this.ngOnInit();
  this.submitted = false;
  this.Agregar= true;
  this.MunCodigo=true;
  this.Valor = "";
}
validarTexto(event: KeyboardEvent) {

  if (!/^[a-zA-Z\s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
      event.preventDefault();
  }
}
onSubmit() {
  if (this.FacturaForm.valid && this.FacturaForm.get('Impu_Id').value !== '0') {
     this.viewModel = this.FacturaForm.value;
     if (this.Valor == "Agregar") {
      this.service.EnviarFactura(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
           this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
           this.Collapse= false;
           this.DataTable = true;
           this.submitted = false;
           this.Detalles = false;
           this.Agregar = true;
           this.ngOnInit();
   
          }else{
           this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
          }
          
       })
     } else {
          this.service.ActualizarFactura(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
           this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
           this.Collapse= false;
           this.DataTable = true;
           this.Detalles = false;
           this.submitted = false;
           this.Agregar = true;
           this.ngOnInit();
   
          }else{
           this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro actualizar', life: 3000 });
          }
          
       })
     }  
     
  }   
      else 
      {
          this.submitted = true;
      }
  }
  collapse(){
    this.Collapse= true;
    this.DataTable = false;
    this.Valor = "Agregar";
    this.Agregar= false;
    this.Detalles = false;
    this.Tabla = true;
}
}

