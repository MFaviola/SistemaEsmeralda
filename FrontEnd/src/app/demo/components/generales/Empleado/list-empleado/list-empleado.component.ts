import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Empleado, EmpleadoEnviar, Fill} from 'src/app/Models/EmpleadoViewModel';
import { ServiceService } from 'src/app/Service/Empleado.service';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
import { dropDepartamento } from 'src/app/Models/DepartamentoViewModel';
import { dropMunicipio } from 'src/app/Models/MunicipioViewModel';
import { dropCargo } from 'src/app/Models/CargoViewModel';
import { dropEstadoCivil } from 'src/app/Models/EstadoCivilViewModel';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { CookieService } from 'ngx-cookie-service';
import { dropSucursal } from 'src/app/Models/SucursalViewModel';
@Component({
  templateUrl: './list-empleado.component.html',
  styleUrl: './list-empleado.component.scss',
  providers: [ConfirmationService, MessageService,CookieService]
})
export class ListEmpleadoComponent {
  Empleado!:Empleado[];
   
 
  MensajeViewModel!: MensajeViewModel[];
  submitted: boolean = false;
  loading: boolean = false;
  departamentos: any[] = [];
  sucursales: any[] = [];
  municipios: any[] = [];
  estadocivil: any[] = [];
  cargo: any[] = [];

  rol: any[] = [];
  fill: any[] = [];
  viewModel: EmpleadoEnviar = new EmpleadoEnviar();
  clienteForm: FormGroup;
 
  @ViewChild('filter') filter!: ElementRef;

  selectedState: any = null;
  Collapse: boolean = false;
  DataTable: boolean = true;
  Detalles: boolean = false;
  Agregar: boolean = true;
  Contrasenas: boolean = true;
  Valor: string = "";
  staticData = [{}];
  Id_Municipio: string = "";
  deleteProductDialog: boolean = false;
  //Detalle
  Detalle_Codigo: String = "";
  Detalle_DNI: String = "";
  Detalle_Nombre: String = "";
  Detalle_Apellido: String = "";
  Detalle_Sexo: String = "";
  Detalle_Estado: String = "";
  Detalle_Cargo: String = "";
  Detalle_Correo: String = "";
  Detalle_FechaNac: String = "";
  Detalle_Departamento: String = "";
  Detalle_Municipio: String = "";
  UsuarioCreacion: String = "";
  UsuarioModificacion: String = "";
  FechaCreacion: String = "";
  FechaModificacion: String = "";
  ID: string = "";
  MunicipioCodigo: String = "";
  Usua_Id: any = this.cookie.get('ID_Usuario');
  constructor(private service: ServiceService, private router: Router,   private messageService: MessageService,private cookie: CookieService
  
  ) { }


  ngOnInit(): void {
    this.clienteForm = new FormGroup({
        Empl_DNI: new FormControl("",[Validators.required , Validators.minLength(14)]),
        Empl_Nombre: new FormControl("",Validators.required),
        Empl_Apellido: new FormControl("", Validators.required),
        Empl_Sexo: new FormControl("", Validators.required),
        Empl_FechaNac: new FormControl("", Validators.required),
        Carg_Id: new FormControl("", Validators.required),
        Empl_Correo:new FormControl("",Validators.required),
      Sucu_Id: new FormControl("0",Validators.required),
      Esta_Id: new FormControl("0", Validators.required),
      Depa_Codigo: new FormControl("0", [Validators.required]),
      Muni_Codigo: new FormControl("0", [Validators.required]),
    });
    this.service.getDropDownsDepartamentos().subscribe((data: dropDepartamento[]) => {
    console.log(data);
    this.departamentos = data;
    });
    this.service.getDropDownsSucursales().subscribe((data: dropSucursal[]) => {
      console.log(data);
      this.sucursales = data;
      });
    this.service.getDropDownsEstado().subscribe((data: dropEstadoCivil[]) => {
      console.log(data);
      this.estadocivil = data;
      });


      this.service.getDropDownCargo().subscribe((data: dropCargo[]) => {
        console.log(data);
        this.cargo = data;
        });


    this.service.getEmpleados().subscribe((data: any)=>{
        console.log(data);
        this.Empleado = data;
      },error=>{
        console.log(error);
      });
   }
   ValidarNumeros(event: KeyboardEvent) {
    if (!/[0-9]/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab') {
        event.preventDefault();
    }
  }
   onDepartmentChange(departmentId) {
    if (departmentId !== '0') {
      this.service.getMunicipios(departmentId).subscribe(
        (data: any) => {
          this.municipios = data; 
          this.clienteForm.get('Muni_Codigo').setValue('0'); 
        },
        error => {
          console.error('Error fetching municipios:', error);
        }
      );
    } else {
      this.municipios = []; // Clear municipios if the department is invalid or reset
    }
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
    this.service.getFill(codigo).subscribe({
      next: (data: Fill) => {
         this.Detalle_Codigo = data.empl_DNI,
         this.Detalle_Nombre = data.empl_Nombre,
         this.Detalle_Apellido = data.empl_Apellido,
         this.Detalle_Sexo = data.empl_Sexo,
         this.Detalle_Estado = data.esta_EstadoCivil,
        this.Detalle_Cargo = data.carg_Cargo,
        this.Detalle_Correo = data.empl_Correo,

         this.Detalle_FechaNac = data.empl_FechaNac,
         this.Detalle_Departamento = data.depa_Departamento,
         this.Detalle_Municipio = data.muni_Municipio,
         this.UsuarioCreacion = data.usuarioCreacion,
         this.UsuarioModificacion = data.usuarioModificacion
         this.FechaCreacion = data.fechaCreacion,
         this.FechaModificacion = data.fechaModificacion
      }
    });
    this.ngOnInit();
}
//Cerrar Collapse y reiniciar el form
cancelar(){
    this.Collapse= false;
    this.DataTable = true;
    this.Detalles = false;
    this.ngOnInit();
    this.submitted = false;
    this.Agregar= true;
    this.Valor = "";
}

validarTexto(event: KeyboardEvent) {
  if (!/^[a-zñA-ZÑ\s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
      event.preventDefault();
  }
}


validarCorreo(event: KeyboardEvent) {
  if (!/^[-a-zA-Z\s-áéíóúÁÉÍÓÚüÜñÑ,.?!¡¿@#$%&*()]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
      event.preventDefault();
  }
}


ValidarNumero(event: KeyboardEvent) {
  if (!/^[0-9\s-]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
      event.preventDefault();
  }
}
onSubmit() {
  if (this.clienteForm.valid && this.clienteForm.get('Depa_Codigo').value !== '0' && this.clienteForm.get('Muni_Codigo').value !== '0'&& this.clienteForm.get('Esta_Id').value !== '0' ) {
     this.viewModel = this.clienteForm.value;
     this.viewModel.Usua_Id = this.Usua_Id;
     if (this.Valor == "Agregar") {
      this.service.EnviarEmpleado(this.viewModel).subscribe((data: MensajeViewModel[]) => {
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
      this.viewModel.Empl_Id = this.ID
          this.service.ActualizarEmpleado(this.viewModel).subscribe((data: MensajeViewModel[]) => {
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
    this.service.EliminarEmpleado(this.ID).subscribe({
        next: (response) => {
            if(response.message == "La accion ha sido existosa"){
               
                this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Eliminado con Exito', life: 3000 });
                this.Collapse= false;
                this.DataTable = true;
                this.Detalles = false;
                this.submitted = false;
                this.deleteProductDialog = false;
                this.ngOnInit();
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

          this.clienteForm = new FormGroup({
            Empl_DNI: new FormControl(data.empl_DNI,Validators.required),
            Empl_Nombre: new FormControl(data.empl_Nombre,Validators.required),
            Empl_Apellido: new FormControl(data.empl_Apellido, Validators.required),
            Empl_Sexo: new FormControl(data.empl_Sexo, Validators.required),
            Empl_FechaNac: new FormControl(data.empl_FechaNac, Validators.required),
            Carg_Id: new FormControl(data.carg_Id, Validators.required),
            Empl_Correo: new FormControl(data.empl_Correo, Validators.required),
            Sucu_Id: new FormControl(data.sucu_Id, Validators.required),
          Esta_Id: new FormControl(data.esta_Id, Validators.required),
          Depa_Codigo: new FormControl(data.depa_Codigo, [Validators.required]),
          Muni_Codigo: new FormControl(data.muni_Codigo, [Validators.required]),
        });

          this.MunicipioCodigo = data.muni_Codigo;
          console.log(this.MunicipioCodigo);
          this.service.getMunicipios(data.depa_Codigo).subscribe(
            (data: any) => {
              this.municipios = data; 
              this.clienteForm.get('Muni_Codigo').setValue(this.MunicipioCodigo); 
            }
          );
            this.ID = data.empl_Id;
            this.Collapse= true;
            this.DataTable = false;
            this.Agregar = false;
            this.Detalles = false;
            this.Contrasenas = false;
            this.Valor = "Editar";
        }
      });

}
}