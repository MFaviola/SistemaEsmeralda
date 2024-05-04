import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { ServiceService } from 'src/app/Service/MetodoPago.service';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { Fill,Metodo, MetodoPagoEnviar } from 'src/app/Models/MetodoPagoViewModel';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';

@Component({
  templateUrl: './list-metodopago.component.html',
  styleUrl: './list-metodopago.component.scss',
  providers: [ConfirmationService, MessageService]
})
export class ListMetodoComponent implements OnInit{
  Metodo!:Metodo[];
   
 

  MensajeViewModel!: MensajeViewModel[];
  submitted: boolean = false;
  loading: boolean = false;
  departamentos: any[] = [];
  fill: any[] = [];
  viewModel: MetodoPagoEnviar = new MetodoPagoEnviar();
  metodoForm: FormGroup;
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
  metodo: String = "";
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

      this.metodoForm = new FormGroup({
        mepa_Metodo: new FormControl("", Validators.required),
        });
      
      this.service.getMetodo().subscribe((data: any)=>{
          console.log(data);
          this.Metodo = data;
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
         this.metodo = data.mepa_Metodo,
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
  this.metodoForm = new FormGroup({
    mepa_Metodo: new FormControl("", Validators.required),
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
    if (this.metodoForm.valid ) {
       this.viewModel = this.metodoForm.value;
       if (this.Valor == "Agregar") {
        this.service.EnviarMetodoPago(this.viewModel).subscribe((data: MensajeViewModel[]) => {
            if(data["message"] == "Operación completada exitosamente."){
             this.service.getMetodo().subscribe((data: Metodo[]) => {
                 this.Metodo = data;
             });
             this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
             this.Collapse= false;
             this.DataTable = true;
             this.submitted = false;
             this.Detalles = false;

             this.metodoForm = new FormGroup({
              mepa_Metodo: new FormControl("", Validators.required),
              });
            

     
            }else{
             this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
            }
            
         })
       } else {
          this.viewModel.Mepa_Id = this.id ;
            this.service.ActualizarMetodoPago(this.viewModel).subscribe((data: MensajeViewModel[]) => {
            if(data["message"] == "Operación completada exitosamente."){
             this.service.getMetodo().subscribe((data: Metodo[]) => {
                 this.Metodo = data;
             });
             this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
             this.Collapse= false;
             this.DataTable = true;
             this.Detalles = false;
             this.submitted = false;
             this.metodoForm = new FormGroup({
              mepa_Metodo: new FormControl("", Validators.required),
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
  this.service.EliminarMetodoPago(this.ID).subscribe({
      next: (response) => {
          if(response.message == "La accion ha sido existosa"){
              this.service.getMetodo().subscribe((data: Metodo[]) => {
                  this.Metodo = data;
              });
              this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Eliminado con Exito', life: 3000 });
              this.Collapse= false;
              this.DataTable = true;
              this.Detalles = false;
              this.submitted = false;
              this.metodoForm = new FormGroup({
                mepa_Metodo: new FormControl("", Validators.required),
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
        this.metodoForm = new FormGroup({
          mepa_Metodo: new FormControl(data.mepa_Metodo, Validators.required),
          });
        
          this.id = data.mepa_Id;
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
