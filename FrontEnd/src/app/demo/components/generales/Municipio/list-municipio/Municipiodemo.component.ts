import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Router } from '@angular/router';
import { Fill,Municipio,MunicipioEnviar } from 'src/app/Models/MunicipioViewModel';
import { dropDepartamento } from 'src/app/Models/DepartamentoViewModel';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { Table } from 'primeng/table';
import { ServiceService } from 'src/app/Service/Municipio.service';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
import { CookieService } from 'ngx-cookie-service';
@Component({
    templateUrl: './Municipiodemo.component.html',
    styleUrl: './list-municipio.component.css',
    providers: [ConfirmationService, MessageService,CookieService]
})
export class MunicipioDemoComponent implements OnInit {
    Municipio!: Municipio[];
    MensajeViewModel!: MensajeViewModel[];
    submitted: boolean = false;
    loading: boolean = false;
    departamentos: any[] = [];
    fill: any[] = [];
    viewModel: MunicipioEnviar = new MunicipioEnviar();
    municipioForm: FormGroup;
    @ViewChild('filter') filter!: ElementRef;
    Collapse: boolean = false;
    DataTable: boolean = true;
    Detalles: boolean = false;
    Agregar: boolean = true;
    MunCodigo: boolean = true;
    Valor: string = "";
    staticData = [{}];

    Usua_Id: any = this.cookie.get('ID_Usuario');
    
    deleteProductDialog: boolean = false;
    //Detalle
    Muni: String = "";
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
        //Inicializamos form,drops,lista
        this.municipioForm = new FormGroup({
            Muni_Codigo: new FormControl("",Validators.required),
            Muni_Municipio: new FormControl("", Validators.required),
            Depa_Codigo: new FormControl('0', [Validators.required])
          });
        this.service.getDropDownsDepartamentos().subscribe((data: dropDepartamento[]) => {
            this.departamentos = data;
        });
        this.service.getMunicipios().subscribe((data: Municipio[]) => {
            console.log(data);
            this.Municipio = data;
        });
    }
    //Abrir collapse
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
        this.service.getDetalles(codigo).subscribe({
            next: (data: Fill) => {
               this.Muni = data.muni_Municipio,
               this.Codigo = data.muni_Codigo,
               this.Depa = data.departamento,
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
        this.municipioForm = new FormGroup({
            Muni_Codigo: new FormControl("",Validators.required),
            Muni_Municipio: new FormControl("", Validators.required),
            Depa_Codigo: new FormControl('0', [Validators.required])
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

    //Insert
    onSubmit() {
    if (this.municipioForm.valid && this.municipioForm.get('Depa_Codigo').value !== '0') {
       this.viewModel = this.municipioForm.value;
       this.viewModel.Usua_Id = this.Usua_Id
       if (this.Valor == "Agregar") {
        this.service.EnviarMunicipios(this.viewModel).subscribe((data: MensajeViewModel[]) => {
            if(data["message"] == "Operación completada exitosamente."){
             this.service.getMunicipios().subscribe((data: Municipio[]) => {
                 this.Municipio = data;
             });
             this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
             this.Collapse= false;
             this.DataTable = true;
             this.submitted = false;
             this.Detalles = false;
             this.Agregar = true;
             this.municipioForm = new FormGroup({
                 Muni_Codigo: new FormControl("",Validators.required),
                 Muni_Municipio: new FormControl("", Validators.required),
                 Depa_Codigo: new FormControl('0', [Validators.required])
             });
     
            }else{
             this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
            }
            
         })
       } else {
            this.service.ActualizarMunicipios(this.viewModel).subscribe((data: MensajeViewModel[]) => {
            if(data["message"] == "Operación completada exitosamente."){
             this.service.getMunicipios().subscribe((data: Municipio[]) => {
                 this.Municipio = data;
             });
             this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
             this.Collapse= false;
             this.DataTable = true;
             this.Detalles = false;
             this.submitted = false;
             this.Agregar = true;
             this.municipioForm = new FormGroup({
                 Muni_Codigo: new FormControl("",Validators.required),
                 Muni_Municipio: new FormControl("", Validators.required),
                 Depa_Codigo: new FormControl('0', [Validators.required])
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
        this.service.EliminarMunicipios(this.ID).subscribe({
            next: (response) => {
                if(response.message == "La accion ha sido existosa"){
                    this.service.getMunicipios().subscribe((data: Municipio[]) => {
                        this.Municipio = data;
                    });
                    this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Eliminado con Exito', life: 3000 });
                    this.Collapse= false;
                    this.DataTable = true;
                    this.Detalles = false;
                    this.submitted = false;
                    this.Agregar = true;
                    this.municipioForm = new FormGroup({
                        Muni_Codigo: new FormControl("",Validators.required),
                        Muni_Municipio: new FormControl("", Validators.required),
                        Depa_Codigo: new FormControl('0', [Validators.required])
                    });
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
                this.municipioForm = new FormGroup({
                    Muni_Codigo: new FormControl(data.muni_Codigo,Validators.required),
                    Muni_Municipio: new FormControl(data.muni_Municipio, Validators.required),
                    Depa_Codigo: new FormControl(data.depa_Codigo, [Validators.required])
                });
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


