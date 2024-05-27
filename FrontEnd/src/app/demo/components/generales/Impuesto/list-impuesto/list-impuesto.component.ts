import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Impuesto, ImpuestoEnviar, Fill } from 'src/app/Models/ImpuestoViewModel';
import { ServiceService } from 'src/app/Service/Impuesto.service';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';

@Component({
  templateUrl: './list-impuesto.component.html',
  styleUrl: './list-impuesto.component.scss',
  providers: [ConfirmationService, MessageService]
})
export class ListImpuestoComponent implements OnInit{
  Impuesto!:Impuesto[];
  MensajeViewModel!: MensajeViewModel[];
  submitted: boolean = false;
  loading: boolean = false;
  departamentos: any[] = [];
  fill: any[] = [];
  viewModel: ImpuestoEnviar = new ImpuestoEnviar();
  impuestoForm: FormGroup;
  @ViewChild('filter') filter!: ElementRef;
  Collapse: boolean = false;
  DataTable: boolean = true;
  Detalles: boolean = false;
  Agregar: boolean = true;
  MunCodigo: boolean = true;
  Valor: string = "";
  staticData = [{}];


  deleteProductDialog: boolean = false;
  //Detalle
  impu: String = "";
  id: string="";
  UsuarioCreacion: String = "";
  UsuarioModificacion: String = "";
  FechaCreacion: String = "";
  FechaModificacion: String = "";
  ID: String = "";

  constructor(
      private service: ServiceService, 
      private router: Router,
      private confirmationService: ConfirmationService, 
      private messageService: MessageService
  ) { 
     
  
  }

  ngOnInit(): void {


    this.impuestoForm = new FormGroup({
      impu_Impuesto: new FormControl("", Validators.required),
    });


      this.service.getImpuesto().subscribe((data: any)=>{
          console.log(data);
          this.Impuesto = data;
      },error=>{
        console.log(error);
      });
   }


    
  //Abrir collapse
  collapse(){
    this.Collapse= true;
    this.DataTable = false;
    this.Valor = "Agregar";
    this.Agregar= false;
    this.Detalles = false;
}
detalles(id){
    this.Collapse= false;
    this.DataTable = false;
    this.Agregar= false;
    this.Detalles = true;
    this.service.getFill(id).subscribe({
        next: (data: Fill) => {
           this. impu= data.impu_Impuesto,
           this.UsuarioCreacion = data.usuarioCreacion,
           this.UsuarioModificacion = data.usuarioModificacion
           this.FechaCreacion = data.fechaCreacion,
           this.FechaModificacion = data.fechaModificacion
        }
      });
}
//Cerrar Collapse y reiniciar el form
cancelar(){
    this.Collapse= false;
    this.DataTable = true;
    this.Detalles = false;
    this.impuestoForm = new FormGroup({
      impu_Impuesto: new FormControl("", Validators.required),
    });
    this.submitted = false;
    this.Agregar= true;
    this.MunCodigo=true;
    this.Valor = "";
}
//Funcionan como regex
ValidarNumeros(event: KeyboardEvent) {
    if (!/[0-9]/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab') {
        event.preventDefault();
    }
}
validarTexto(event: KeyboardEvent) {

    if (!/^[a-zA-Z\s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
        event.preventDefault();
    }
}








   onSubmit() {
    if (this.impuestoForm.valid ) {
       this.viewModel = this.impuestoForm.value;
       if (this.Valor == "Agregar") {
        this.service.EnviarImpuesto(this.viewModel).subscribe((data: MensajeViewModel[]) => {
            if(data["message"] == "Operación completada exitosamente."){
             this.service.getImpuesto().subscribe((data: Impuesto[]) => {
                 this.Impuesto = data;
             });
             this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
             this.Collapse= false;
             this.DataTable = true;
             this.submitted = false;
            
             this.impuestoForm = new FormGroup({
              impu_Impuesto: new FormControl("", Validators.required),
            });
     
          }else{
            this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
           }
           
        })
      } else {
         this.viewModel.Impu_Id = this.id ;
           this.service.ActualizarImpuesto(this.viewModel).subscribe((data: MensajeViewModel[]) => {
           if(data["message"] == "Operación completada exitosamente."){
            this.service.getImpuesto().subscribe((data: Impuesto[]) => {
                this.Impuesto = data;
            });
            this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
            this.Collapse= false;
            this.DataTable = true;
            this.Detalles = false;
            this.submitted = false;
            this.impuestoForm = new FormGroup({
              impu_Impuesto: new FormControl("", Validators.required),
            });
    
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
 
 
   deleteSelectedProducts(id) {
       this.deleteProductDialog = true;
       this.ID = id;
       console.log("El codigo es" + id);
   }
   confirmDelete() {
       this.service.EliminarImpuesto(this.ID).subscribe({
           next: (response) => {
               if(response.message == "La accion ha sido existosa"){
                   this.service.getImpuesto().subscribe((data: Impuesto[]) => {
                       this.Impuesto = data;
                   });
                   this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Eliminado con Exito', life: 3000 });
                   this.Collapse= false;
                   this.DataTable = true;
                   this.Detalles = false;
                   this.submitted = false;
                   this.impuestoForm = new FormGroup({
                    impu_Impuesto: new FormControl("", Validators.required),
                  });
                   this.deleteProductDialog = false;
                  }else{
                   this.deleteProductDialog = false;
                   this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro eliminar', life: 3000 });
                  }
           },
       });
   
   }
   Fill(id) {
       this.service.getFill(id).subscribe({
           next: (data: Fill) => {
            this.impuestoForm = new FormGroup({
              impu_Impuesto: new FormControl(data.impu_Impuesto, Validators.required),
            });
 
               this.id = data.impu_Id;
               this.Collapse= true;
               this.DataTable = false;
               this.Agregar = false;
               this.MunCodigo = false;
               this.Detalles = false;
               this.Valor = "Editar";
           }
         });
 
   }
 
  
  
}
