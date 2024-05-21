import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Usuario, UsuarioEnviar,Fill } from 'src/app/Models/UsuarioVIewModel';
import { ServiceService } from 'src/app/Service/Usuario.service';
import { FormGroup, FormBuilder, FormControl,  Validators  } from '@angular/forms';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { EmpleadoEnviar, dropEmpleado } from 'src/app/Models/EmpleadoViewModel';
import { dropRol } from 'src/app/Models/RolViewModel';
import { CookieService } from 'ngx-cookie-service';
import { clave } from 'src/app/Models/ValidarViewModel';
import { contraservice } from 'src/app/Service/Login.Service';

@Component({
  templateUrl: './list-usuario.component.html',
  styleUrl: './list-usuario.component.css',
  providers: [ConfirmationService,MessageService,CookieService]
})
export class ListUsuarioComponent {
  Usuario!:Usuario[];
  MensajeViewModel!: MensajeViewModel[];
  submitted: boolean = false;
  loading: boolean = false;
  empleados: any[] = [];
  rol: any[] = [];
  fill: any[] = [];
  viewModel: UsuarioEnviar = new UsuarioEnviar();
  usuarioForm: FormGroup;
  @ViewChild('filter') filter!: ElementRef;

  Usua_Id: any = this.cookie.get('ID_Usuario');
  Esadmin: any = this.cookie.get('esAdmin');
  selectedState: any = null;
  Collapse: boolean = false;
  DataTable: boolean = true;
  Detalles: boolean = false;
  Agregar: boolean = true;
  Contrasenas: boolean = true;
  Valor: string = "";
  staticData = [{}];
  
  deleteProductDialog: boolean = false;
  //Detalle
  Detalle_Usuario: String = "";
  Detalle_Administrador: String = "";
  Detalle_Empleado: String = "";
  Detalle_Rol: String = "";
  UsuarioCreacion: String = "";
  UsuarioModificacion: String = "";
  FechaCreacion: String = "";
  FechaModificacion: String = "";
  ID: String = "";
  enviarcontraForm: FormGroup;

  constructor(private service: ServiceService, private router: Router, private formBuilder: FormBuilder,  private cookie: CookieService, private messageService: MessageService, private contraService : contraservice ) { }


  ngOnInit(): void {
    this.usuarioForm = new FormGroup({
      Usua_Usuario: new FormControl("",Validators.required),
      Usua_Contraseña: new FormControl("", Validators.required),
      Usua_Administrador: new FormControl(false, [Validators.required]),
      Empl_Id: new FormControl('0', [Validators.required]),
      Role_Id: new FormControl('0', [Validators.required]),
    });

    this.enviarcontraForm = this.formBuilder.group({
      Usua_Id: ['0', [Validators.required]],
      Usua_Contraseña: ['', [Validators.required]],
    });

    this.service.getDropDownEmpleado().subscribe((data: dropEmpleado[]) => {
      this.empleados = data;
    });
    this.service.getDropDownRol().subscribe((data: dropRol[]) => {
      this.rol = data;
    });

      this.service.getUsuario().subscribe((data: any)=>{
          console.log(data);
          console.log(this.Esadmin);
          this.Usuario = data;
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
  this.Contrasenas = true;
  this.service.getFill(codigo).subscribe({
      next: (data: Fill) => {
         this.Detalle_Usuario = data.usua_Usuario,
         this.Detalle_Administrador = data.usua_Administradores,
         this.Detalle_Rol = data.role_Rol,
         this.Detalle_Empleado = data.empl_Nombre,
         this.UsuarioCreacion = data.usuarioCreacion,
         this.UsuarioModificacion = data.usuarioModificacion
         this.FechaCreacion = data.fechaCreacion,
         this.FechaModificacion = data.fechaModificacion
      }
    });
}
cancelar(){
  this.Collapse= false;
  this.DataTable = true;
  this.Detalles = false;
  this.ngOnInit();
  this.submitted = false;
  this.Agregar= true;
  this.Contrasenas = true;
  this.Valor = "";
}

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
validarTextoNumeros(event: KeyboardEvent) {

  if (!/^[0-9-a-zA-Z.@_\s-]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
      event.preventDefault();
  }
}
onSubmit() {
  if (this.usuarioForm.valid && this.usuarioForm.get('Empl_Id').value !== '0' && this.usuarioForm.get('Role_Id').value !== '0') {
     this.viewModel = this.usuarioForm.value;
     this.viewModel.Usua_UsuarioCreacion = this.Usua_Id;
     if (this.Valor == "Agregar") {
      this.service.EnviarUsuario(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
          this.ngOnInit();
           this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
           this.Collapse= false;
           this.DataTable = true;
           this.submitted = false;
           this.Detalles = false;
           this.Agregar= true;
          }else{
           this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
          }
          
       })
     } else {
          this.viewModel.Usua_Id = this.ID;
          this.service.ActualizarUsuario(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
            this.ngOnInit();
           this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
           this.Collapse= false;
           this.DataTable = true;
           this.Detalles = false;
           this.submitted = false;
           this.Agregar= true;
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
    this.service.EliminarUsuario(this.ID).subscribe({
        next: (response) => {
            if(response.message == "La accion ha sido existosa"){
               this.ngOnInit();
                this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Eliminado con Exito', life: 3000 });
                this.Collapse= false;
                this.DataTable = true;
                this.Detalles = false;
                this.submitted = false;
                this.deleteProductDialog = false;
               }else{
                this.deleteProductDialog = false;
                this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro eliminar', life: 3000 });
               }
        },
    });

}
Fill(codigo) {
    this.service.getFill(codigo).subscribe({
        next: (data: Fill) => {
          this.usuarioForm = new FormGroup({
            Usua_Usuario: new FormControl(data.usua_Usuario,Validators.required),
            Usua_Contraseña: new FormControl("x", Validators.required),
            Usua_Administrador: new FormControl(data.usua_Administrador, [Validators.required]),
            Empl_Id: new FormControl(data.empl_Id, [Validators.required]),
            Role_Id: new FormControl(data.role_Id, [Validators.required]),
          });
            this.ID = data.usua_Id;
            this.Collapse= true;
            this.DataTable = false;
            this.Agregar = false;
            this.Detalles = false;
            this.Contrasenas = true;
            this.Valor = "Editar";
        }
      });

}

  contraa(codigo){

    this.enviarcontraForm = new FormGroup({
      Usua_Id: new FormControl(codigo, [Validators.required]),
      Usua_Contraseña: new FormControl ('', [Validators.required]),
    })
    this.Contrasenas= true;
    this.DataTable = false;
    this.Agregar = false;
    this.Detalles = false;
    this.Contrasenas = false;
    }

  oncontra(){
    if(this.enviarcontraForm.valid)
    {
        const codigoData: clave = this.enviarcontraForm.value;
          console.log(codigoData);
          this.contraService.cambiarclave(codigoData).subscribe(
            response => {
              console.log('Respuesta del servidor:', response);
              if (response!="Error"){
                console.log("Contraseña establecida");
                this.Contrasenas= true;
                this.Collapse= false;
                this.DataTable = true;
                this.submitted = false;
                this.Detalles = false;
                this.Agregar= true;
              }
            },
            error => {
              console.error('codigo incorrecto:', error);
            }
          );
    }
    else
    {
      console.log('Formulario inválido');
      console.log(this.enviarcontraForm);

    }
  }
}
