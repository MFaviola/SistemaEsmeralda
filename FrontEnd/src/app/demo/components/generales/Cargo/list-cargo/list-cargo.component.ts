import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { ServiceService } from 'src/app/Service/Cargo.service';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { Fill,Cargo, CargoEnviar } from 'src/app/Models/CargoViewModel';
import { CookieService } from 'ngx-cookie-service';



@Component({
  templateUrl: './list-cargo.component.html',
  styleUrl: './list-cargo.component.scss',
  providers: [ConfirmationService, MessageService,CookieService]
})
export class ListCargoComponent implements OnInit{
  Cargo!:Cargo[];
  Usua_Id: any = this.cookie.get('ID_Usuario');
  MensajeViewModel!: MensajeViewModel[];
  submitted: boolean = false;
  loading: boolean = false;
  departamentos: any[] = [];
  fill: any[] = [];
  viewModel: CargoEnviar = new CargoEnviar();
  cargoForm: FormGroup;
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
  Carg: String = "";
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
      private messageService: MessageService,
      private cookie: CookieService
  ) { 
     
  
  }
  






  ngOnInit(): void {
      //Inicializamos form,drops,lista
      this.cargoForm = new FormGroup({
        Carg_Cargo: new FormControl("", Validators.required),
        });
    

      this.service.getCargo().subscribe((data: Cargo[]) => {
          console.log(data);
          this.Cargo = data;
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
             this.Carg = data.carg_Cargo,
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
      this.cargoForm = new FormGroup({
          Carg_Cargo: new FormControl("", Validators.required),
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

      if (!/^[a-zñA-ZÑ\s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
          event.preventDefault();
      }
  }
  clear(table: Table, filter: ElementRef) {
    table.clear();
    filter.nativeElement.value = '';
  }

  onGlobalFilter(table: Table, event: Event) {
    table.filterGlobal((event.target as HTMLInputElement).value, 'contains');
  }
  //Insert
  onSubmit() {
  if (this.cargoForm.valid ) {
     this.viewModel = this.cargoForm.value;
     this.viewModel.Usua_ID = this.Usua_Id
     if (this.Valor == "Agregar") {
      this.service.EnviarCargo(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
           this.service.getCargo().subscribe((data: Cargo[]) => {
               this.Cargo = data;
           });
           
           this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
           this.Collapse= false;
           this.DataTable = true;
           this.submitted = false;
           this.Detalles = false;
           this.cargoForm = new FormGroup({
               Carg_Cargo: new FormControl("", Validators.required),
           });
   
          }else{
           this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
          }
          
       })
     } else {
        this.viewModel.Carg_Id = this.id ;
          this.service.ActualizarCargo(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
           this.service.getCargo().subscribe((data: Cargo[]) => {
               this.Cargo = data;
           });
           this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
           this.Collapse= false;
           this.DataTable = true;
           this.Detalles = false;
           this.submitted = false;
           this.cargoForm = new FormGroup({
               Carg_Cargo: new FormControl("", Validators.required),
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
      this.service.EliminarCargo(this.ID).subscribe({
          next: (response) => {
              if(response.message == "La accion ha sido existosa"){
                  this.service.getCargo().subscribe((data: Cargo[]) => {
                      this.Cargo = data;
                  });
                  this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Eliminado con Exito', life: 3000 });
                  this.Collapse= false;
                  this.DataTable = true;
                  this.Detalles = false;
                  this.submitted = false;
                  this.cargoForm = new FormGroup({
                      Carg_Cargo: new FormControl("", Validators.required),
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
              this.cargoForm = new FormGroup({
                
                  Carg_Cargo: new FormControl(data.carg_Cargo, Validators.required),
              });
              this.id = data.carg_Id;
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


