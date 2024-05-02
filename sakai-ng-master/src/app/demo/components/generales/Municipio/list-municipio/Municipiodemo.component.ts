import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import { Router } from '@angular/router';
import { Municipio,MunicipioEnviar } from 'src/app/Models/MunicipioViewModel';
import { dropDepartamento } from 'src/app/Models/DepartamentoViewModel';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { ServiceService } from 'src/app/Service/Municipio.service';
import { ProductService } from 'src/app/demo/service/product.service';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
@Component({
    templateUrl: './Municipiodemo.component.html',
    providers: [ConfirmationService, MessageService]
})
export class MunicipioDemoComponent implements OnInit {
    Municipio!: Municipio[];
    MensajeViewModel!: MensajeViewModel[];
    submitted: boolean = false;
    display: boolean = false;
    loading: boolean = false;
    departamentos: any[] = [];
    mensaje: any[] = [];
    viewModel: MunicipioEnviar = new MunicipioEnviar();
    municipioForm: FormGroup;
    MunicipioEditarForm: FormGroup;
        @ViewChild('filter') filter!: ElementRef;

  
  

    constructor(
        private service: ServiceService, 
        private router: Router,
        private confirmationService: ConfirmationService, 
        private messageService: MessageService
        
    ) { 
       
    
    }
    
    ngOnInit(): void {
        //Inicializar  el FormGroup
        this.municipioForm = new FormGroup({
            Muni_Codigo: new FormControl("",Validators.required),
            Muni_Municipio: new FormControl("", Validators.required),
            Depa_Codigo: new FormControl('0', [Validators.required])
          });

        //Cargar los dropDowns
        this.service.getDropDownsDepartamentos().subscribe((data: dropDepartamento[]) => {
            this.departamentos = data;
        });
       
        this.service.getMunicipios().subscribe((data: Municipio[]) => {
            console.log(data);
            this.Municipio = data;
        });
    }


    onSubmit() {
    if (this.municipioForm.valid && this.municipioForm.get('Depa_Codigo').value !== '0') {
       this.viewModel = this.municipioForm.value;
       this.service.EnviarMunicipios(this.viewModel).subscribe((data: MensajeViewModel[]) => {
       console.log(data["message"])
       if(data["message"] == "Operación completada exitosamente."){
        this.service.getMunicipios().subscribe((data: Municipio[]) => {
            this.Municipio = data;
        }, error => {
            console.log(error);
        }); 
        this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 1000 });
        this.display = false;
        this.municipioForm = new FormGroup({
            Muni_Codigo: new FormControl("",Validators.required),
            Muni_Municipio: new FormControl("", Validators.required),
            Depa_Codigo: new FormControl('0', [Validators.required])
          });
       }else{
        this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 1000 });
       }
       
    })
    } else {
        this.submitted = true;
    }
      }
}


