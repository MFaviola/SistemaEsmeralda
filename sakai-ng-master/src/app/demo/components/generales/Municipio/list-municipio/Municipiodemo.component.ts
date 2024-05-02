import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import { Router } from '@angular/router';
import { Municipio,MunicipioEnviar } from 'src/app/Models/MunicipioViewModel';
import { dropDepartamento } from 'src/app/Models/DepartamentoViewModel';
import { ServiceService } from 'src/app/Service/Municipio.service';
import { ProductService } from 'src/app/demo/service/product.service';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
@Component({
    templateUrl: './Municipiodemo.component.html',
    providers: [ConfirmationService, MessageService]
})
export class MunicipioDemoComponent implements OnInit {
    Municipio!: Municipio[];
  

    statuses: any[] = [];
    selectedProducts: Product[] = [];
    products: Product[] = [];
    productDialog: boolean = false;
    rowGroupMetadata: any;
    submitted: boolean = false;

    display: boolean = false;
    activityValues: number[] = [0, 100];

    isExpanded: boolean = false;

    idFrozen: boolean = false;

    loading: boolean = false;
   
    @ViewChild('filter') filter!: ElementRef;

    selectedState: any = null;

    cities1: any[] = [];
    departamentos: any[] = [];
    cities2: any[] = [];

    city1: any = null;
    city2: any = null;
    viewModel: MunicipioEnviar = new MunicipioEnviar();
    municipioForm: FormGroup;

    constructor(
        private service: ServiceService, 
        private router: Router,
        private confirmationService: ConfirmationService, 
        private messageService: MessageService
        
    ) { 
       
    
    }
    
    ngOnInit(): void {
        this.municipioForm = new FormGroup({
            Muni_Codigo: new FormControl("",Validators.required),
            Muni_Municipio: new FormControl("", Validators.required),
            Depa_Codigo: new FormControl('0', [Validators.required])
          });


        this.service.getDropDownsDepartamentos().subscribe((data: dropDepartamento[]) => {
            this.departamentos = data;
        }, error => {
            console.log(error);
        });
       
        this.service.getMunicipios().subscribe((data: Municipio[]) => {
            console.log(data);
            this.Municipio = data;
        }, error => {
            console.log(error);
        });
    }


    onSubmit() {
        
    if (this.municipioForm.valid && this.municipioForm.get('Depa_Codigo').value !== '0') {
        this.viewModel = this.municipioForm.value;
        this.service.EnviarMunicipios(this.viewModel).subscribe({
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
              // handle error
            }
          });
        

    } else {
        this.submitted = true;
    }
      }
}


