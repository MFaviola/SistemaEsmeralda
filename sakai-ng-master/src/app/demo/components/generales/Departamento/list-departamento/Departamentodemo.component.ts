import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Departamento, DepartamentoEnviar } from 'src/app/Models/DepartamentoViewModel';
import { ServiceService } from 'src/app/Service/Departamento.service';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';


@Component({
    templateUrl: './Departamentodemo.component.html',
    providers: [ConfirmationService, MessageService]
})
export class DepartamentoDemoComponent implements OnInit {
    departamento!:Departamento[];
   

    statuses: any[] = [];
    selectedProducts: Product[] = [];
    products: Product[] = [];
    productDialog: boolean = false;
    rowGroupMetadata: any;
    submitted: boolean = false;
    display: boolean = false;
    isExpanded: boolean = false;

    idFrozen: boolean = false;

    loading: boolean = false;

    @ViewChild('filter') filter!: ElementRef;


    viewModel: DepartamentoEnviar = new DepartamentoEnviar();
    departamentoForm: FormGroup;

    constructor(  private service: ServiceService, 
        private router: Router,
        private confirmationService: ConfirmationService, 
        private messageService: MessageService
    
    ) { }
  

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
    



     onSubmit() {
        
        if (this.departamentoForm.valid && this.departamentoForm.get('Depa_Codigo').value !== '0') {
            this.viewModel = this.departamentoForm.value;
            this.service.DepartamentoEnviar(this.viewModel).subscribe({
                next: (response) => {
                    console.log('Respuesta del servidor:', response);
                  if (response.success) {
                    console.log('Respuesta del servidor:', response.success);
                    this.messageService.add({ key: 'tst', severity: 'success', summary: 'Insertado con Exito', detail: 'Exito' });
                    window.location.reload();
                } else {
    
                    this.messageService.add({ key: 'tst', severity: 'error', summary: 'No se inserto', detail: 'Error' });
                  }
                },
                error: (error) => {
                }
              });
            
    
        } else {
            this.submitted = true;
        }
          }
    
      
}

