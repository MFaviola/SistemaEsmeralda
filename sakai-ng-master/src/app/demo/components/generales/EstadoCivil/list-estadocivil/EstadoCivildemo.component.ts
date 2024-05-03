import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Estado, EstadoCivilEnviar } from 'src/app/Models/EstadoCivilViewModel';
import { ServiceService } from 'src/app/Service/EstadoCivil.service';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';

@Component({
    templateUrl: './EstadoCivildemo.component.html',
    styleUrl: './list-estadocivil.component.css',

    providers: [ConfirmationService, MessageService]
})
export class EstadoCivilDemoComponent implements OnInit {
    Estado!:Estado[];

    MensajeViewModel!: MensajeViewModel[];
    viewModel: EstadoCivilEnviar = new EstadoCivilEnviar();
    Collapse: boolean = false;
    DataTable: boolean = true;
    Agregar: boolean = true;
    MunCodigo: boolean = true;
    Valor: string = "";
    selectedState: any = null;

    statuses: any[] = [];

    products: Product[] = [];
    productDialog: boolean = false;
    rowGroupMetadata: any;
    submitted: boolean = false;

    display: boolean = false;
    activityValues: number[] = [0, 100];

    isExpanded: boolean = false;

    idFrozen: boolean = false;

    loading: boolean = false;
    estadocivilForm: FormGroup;

    @ViewChild('filter') filter!: ElementRef;
   

    states: any[] = [
        {name: 'Arizona', code: 'Arizona'},
        {name: 'California', value: 'California'},
        {name: 'Florida', code: 'Florida'},
        {name: 'Ohio', code: 'Ohio'},
        {name: 'Washington', code: 'Washington'}
    ];

    dropdownItems = [
        { name: 'Option 1', code: 'Option 1' },
        { name: 'Option 2', code: 'Option 2' },
        { name: 'Option 3', code: 'Option 3' },
        { name: 'Option 3', code: 'Option 3' },
        { name: 'Option 3', code: 'Option 3' },
        
    ];

    cities1: any[] = [];

    cities2: any[] = [];

    city1: any = null;

    city2: any = null;

    constructor(private service: ServiceService, 
        private router: Router,
        private confirmationService: ConfirmationService, 
        private messageService: MessageService
    
    ) { }
  

    ngOnInit(): void {
        this.estadocivilForm = new FormGroup({
            esta_EstadoCivil: new FormControl("", Validators.required),
          });



        this.service.getEstadosCivil().subscribe((data: any)=>{
            console.log(data);
            this.Estado = data;
        },error=>{
          console.log(error);
        });
     }
    
    




     onSubmit() {
        if (this.estadocivilForm.valid ) {
           this.viewModel = this.estadocivilForm.value;
           if (this.Valor == "Agregar") {
            this.service.EnviarEstadoCivil(this.viewModel).subscribe((data: MensajeViewModel[]) => {
                if(data["message"] == "Operación completada exitosamente."){
                 this.service.getEstadosCivil().subscribe((data: Estado[]) => {
                     this.Estado = data;
                 });
                 this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
                 this.Collapse= false;
                 this.DataTable = true;
                 this.submitted = false;
                
          this.estadocivilForm = new FormGroup({
            esta_EstadoCivil: new FormControl("", Validators.required),
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
    
    
    
  
  
  
  
  collapse(){
          this.Collapse= true;
          this.DataTable = false;
          this.Valor = "Agregar";
      }
      //Cerrar Collapse y reiniciar el form
      cancelar(){
          this.Collapse= false;
          this.DataTable = true;
          this.estadocivilForm = new FormGroup({
            esta_EstadoCivil: new FormControl("", Validators.required),
       
          });
          this.submitted = false;
          this.Agregar= true;
          this.MunCodigo=true;
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
  
  
  

      
}

