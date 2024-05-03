import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Router } from '@angular/router';
import { Fill,Municipio,MunicipioEnviar } from 'src/app/Models/MunicipioViewModel';
import { dropDepartamento } from 'src/app/Models/DepartamentoViewModel';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { ServiceService } from 'src/app/Service/Municipio.service';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
@Component({
    templateUrl: './Municipiodemo.component.html',
    styleUrl: './list-municipio.component.css',
    providers: [ConfirmationService, MessageService]
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
    Agregar: boolean = true;
    MunCodigo: boolean = true;
    Valor: string = "";


    constructor(
        private service: ServiceService, 
        private router: Router,
        private confirmationService: ConfirmationService, 
        private messageService: MessageService
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
    collapse(){
        this.Collapse= true;
        this.DataTable = false;
        this.Valor = "Agregar";
    }
    //Cerrar Collapse y reiniciar el form
    cancelar(){
        this.Collapse= false;
        this.DataTable = true;
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

        if (!/^[a-zA-Z\s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
            event.preventDefault();
        }
    }

    //Insert
    onSubmit() {
    if (this.municipioForm.valid && this.municipioForm.get('Depa_Codigo').value !== '0') {
       this.viewModel = this.municipioForm.value;
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

       }  
       
    }   
        else 
        {
            this.submitted = true;
        }
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
                this.Valor = "Editar";
            }
          });

    }
}


