import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { ServiceService } from 'src/app/Service/Departamento.service';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { Fill,Departamento, DepartamentoEnviar } from 'src/app/Models/DepartamentoViewModel';
import { CookieService } from 'ngx-cookie-service';


@Component({
    templateUrl: './Departamentodemo.component.html',
    styleUrl: './list-departamento.component.css',
    providers: [ConfirmationService, MessageService,CookieService]
})
export class DepartamentoDemoComponent implements OnInit {
    departamento!:Departamento[];
    Usua_Id: any = this.cookie.get('ID_Usuario');
    MensajeViewModel!: MensajeViewModel[];
    submitted: boolean = false;
    loading: boolean = false;
    departamentos: any[] = [];
    fill: any[] = [];
    viewModel: DepartamentoEnviar = new DepartamentoEnviar();
    departamentoForm: FormGroup;
    @ViewChild('filter') filter!: ElementRef;
    Collapse: boolean = false;
    DataTable: boolean = true;
    Detalles: boolean = false;
    Agregar: boolean = true;
    Cod_Depa: boolean = true;  
    Valor: string = "";
    staticData = [{}];

    deleteProductDialog: boolean = false;
    //Detalle
    Codigo: String = "";
    Depa: String = "";
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

        this.departamentoForm = new FormGroup({
            Depa_Codigo: new FormControl("",Validators.required),
            Depa_Departamento: new FormControl("", Validators.required),
          });


        this.service.getDepartamentos().subscribe((data: any)=>{
            console.log(data);
            this.departamento = data;
        },error=>{
          console.log(error);
        });
        
     }

     clear(table: Table, filter: ElementRef) {
      table.clear();
      filter.nativeElement.value = '';
    }
  
    onGlobalFilter(table: Table, event: Event) {
      table.filterGlobal((event.target as HTMLInputElement).value, 'contains');
    }

 //Abrir collapse
 collapse(){
  this.Collapse= true;
  this.DataTable = false;
  this.Valor = "Agregar";
  this.Agregar= false;
  this.Detalles = false;
}
detalles(codigo){
  this.Collapse= false;
  this.DataTable = false;
  this.Agregar= false;
  this.Detalles = true;
  this.service.getFill(codigo).subscribe({
      next: (data: Fill) => {
         this.Codigo = data.depa_Codigo,
         this.Depa = data.depa_Departamento,
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
  this.departamentoForm = new FormGroup({
      Depa_Codigo: new FormControl("",Validators.required),
      Depa_Departamento: new FormControl("", Validators.required),
  });
  this.submitted = false;
  this.Agregar= true;
  this.Cod_Depa=true;
  this.Valor = "";
}
//Funcionan como regex
ValidarNumeros(event: KeyboardEvent) {
  if (!/[0-9]/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab') {
      event.preventDefault();
  }
}
validarTexto(event: KeyboardEvent) {

  if (!/^[a-zA-Z \s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
      event.preventDefault();
  }
}

    
     onSubmit() {
      if (this.departamentoForm.valid ) {
        this.viewModel = this.departamentoForm.value;
        this.viewModel.Usua_Id = this.Usua_Id;
        if (this.Valor == "Agregar") {
         this.service.DepartamentoEnviar(this.viewModel).subscribe((data: MensajeViewModel[]) => {
             if(data["message"] == "Operación completada exitosamente."){
              this.service.getDepartamentos().subscribe((data: Departamento[]) => {
                  this.departamento = data;
              });
              this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
              this.Collapse= false;
              this.DataTable = true;
              this.submitted = false;
              this.Detalles = false;
              this.departamentoForm = new FormGroup({
                Depa_Codigo: new FormControl("",Validators.required),
                  Depa_Departamento: new FormControl("", Validators.required),
              });
      
             }else{
              this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
             }
             
          })
        } else {
             this.service.ActualizarDepartamento(this.viewModel).subscribe((data: MensajeViewModel[]) => {
             if(data["message"] == "Operación completada exitosamente."){
              this.service.getDepartamentos().subscribe((data: Departamento[]) => {
                  this.departamento = data;
              });
              this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
              this.Collapse= false;
              this.DataTable = true;
              this.Detalles = false;
              this.submitted = false;
              this.Agregar = true;
              this.Cod_Depa = true;
              this.departamentoForm = new FormGroup({
              Depa_Codigo: new FormControl("",Validators.required),
              Depa_Departamento: new FormControl("", Validators.required),
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
    
    deleteSelectedProducts(codigo) {
      this.deleteProductDialog = true;
      this.ID = codigo;
      console.log("El codigo es" + codigo);
  }
  confirmDelete() {
      this.service.EliminarDepartamento(this.ID).subscribe({
          next: (response) => {
              if(response.message == "La accion ha sido existosa"){
                  this.service.getDepartamentos().subscribe((data: Departamento[]) => {
                      this.departamento = data;
                  });
                  this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Eliminado con Exito', life: 3000 });
                  this.Collapse= false;
                  this.DataTable = true;
                  this.Detalles = false;
                  this.submitted = false;
                  this.departamentoForm = new FormGroup({
                      Depa_Codigo: new FormControl("",Validators.required),
                      Depa_Departamento: new FormControl("", Validators.required),
                  });
                  this.deleteProductDialog = false;
                 }else{
                  this.deleteProductDialog = false;
                  this.messageService.add({ severity: 'error', summary: 'Error', detail: 'El departamento esta vinculado', life: 3000 });
                 }
          },
      });
  
  }
  Fill(codigo) {
      this.service.getFill(codigo).subscribe({
         
        next: (data: Fill) => {
          console.log(data);
            this.departamentoForm = new FormGroup({
              Depa_Codigo: new FormControl(data.depa_Codigo,Validators.required),
              Depa_Departamento: new FormControl(data.depa_Departamento, Validators.required),
            });
              this.Collapse= true;
              this.DataTable = false;
              this.Agregar = false;
              this.Cod_Depa = false;
              this.Detalles = false;
              this.Valor = "Editar";
          }
        });

  }



}







