import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Fill, Proveedor, ProveedorEnviar } from 'src/app/Models/ProveedorViewModel';
import { ServiceService } from 'src/app/Service/Proveedor.service';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
import { dropDepartamento } from 'src/app/Models/DepartamentoViewModel';
import { dropMunicipio } from 'src/app/Models/MunicipioViewModel';
import { CookieService } from 'ngx-cookie-service';
@Component({
  templateUrl: './list-proveedor.component.html',
  styleUrl: './list-proveedor.component.scss',
  providers: [ConfirmationService, MessageService,CookieService]
})
export class ListProveedorComponent implements OnInit{
  Proveedor!:Proveedor[];
   
  MensajeViewModel!: MensajeViewModel[];
  submitted: boolean = false;
  loading: boolean = false;
  departamentos: any[] = [];
  municipios: any[] = [];
  rol: any[] = [];
  fill: any[] = [];
  viewModel: ProveedorEnviar = new ProveedorEnviar();
  proveedorForm: FormGroup;
  Usua_Id: any = this.cookie.get('ID_Usuario');
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
  Detalle_Proveedor: String = "";
  Detalle_Telefono: String = "";
  Detalle_Departamento: String = "";
  Detalle_Municipio: String = "";
  UsuarioCreacion: String = "";
  UsuarioModificacion: String = "";
  FechaCreacion: String = "";
  FechaModificacion: String = "";
  ID: String = "";
  MunicipioCodigo: String = "";

  constructor(private service: ServiceService, private router: Router,   private messageService: MessageService,private cookie: CookieService
  
  ) { }


  ngOnInit(): void {
    this.proveedorForm = new FormGroup({
      Prov_Proveedor: new FormControl("",Validators.required),
      Prov_Telefono: new FormControl("", Validators.required),
      Depa_Codigo: new FormControl("0", [Validators.required]),
      Muni_Codigo: new FormControl("0", [Validators.required]),
    });
    this.service.getDropDownsDepartamentos().subscribe((data: dropDepartamento[]) => {

    this.departamentos = data;
    });
    this.service.getProveedor().subscribe((data: any)=>{
        console.log(data);
        this.Proveedor = data;
      },error=>{
        console.log(error);
      });
   }
   onDepartmentChange(departmentId) {
    if (departmentId !== '0') {
      this.service.getMunicipios(departmentId).subscribe(
        (data: any) => {
          this.municipios = data; 
          this.proveedorForm.get('Muni_Codigo').setValue('0'); 
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
         this.Detalle_Codigo = data.prov_Id,
         this.Detalle_Proveedor = data.prov_Proveedor,
         this.Detalle_Telefono = data.prov_Telefono,
         this.Detalle_Departamento = data.departamento,
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
  if (!/^[-a-zA-Z\s-]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
      event.preventDefault();
  }
}
ValidarNumero(event: KeyboardEvent) {
  if (!/^[0-9\s-]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
      event.preventDefault();
  }
}
onSubmit() {
  if (this.proveedorForm.valid && this.proveedorForm.get('Depa_Codigo').value !== '0' && this.proveedorForm.get('Muni_Codigo').value !== '0') {
     this.viewModel = this.proveedorForm.value;
     this.viewModel.Usua_Id = this.Usua_Id;
     if (this.Valor == "Agregar") {
      this.service.EnviarProveedor(this.viewModel).subscribe((data: MensajeViewModel[]) => {
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
      this.viewModel.Prov_Id = this.ID
          this.service.ActualizarProveedor(this.viewModel).subscribe((data: MensajeViewModel[]) => {
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
    this.service.EliminarProveedor(this.ID).subscribe({
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
          this.proveedorForm = new FormGroup({
            Prov_Proveedor: new FormControl(data.prov_Proveedor,Validators.required),
            Prov_Telefono: new FormControl(data.prov_Telefono, Validators.required),
            Depa_Codigo: new FormControl(data.depa_Codigo, [Validators.required]),
            Muni_Codigo: new FormControl(data.muni_Codigo, [Validators.required]),
          });
          this.MunicipioCodigo = data.muni_Codigo;
          console.log(this.MunicipioCodigo);
          this.service.getMunicipios(data.depa_Codigo).subscribe(
            (data: any) => {
              this.municipios = data; 
              this.proveedorForm.get('Muni_Codigo').setValue(this.MunicipioCodigo); 
            }
          );
            this.ID = data.prov_Id;
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
