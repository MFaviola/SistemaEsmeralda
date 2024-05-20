import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Fill, FacturaCompraEncabezado, CrearFacturaCompraEncabezado, FacturaCompraDetalleTabla } from 'src/app/Models/FacturaCompraViewModel';
import { FacturaCompraService } from 'src/app/Service/factura-compra.service'; 

import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { MegaMenuItem, MenuItem } from 'primeng/api';
import { FormGroup, FormControl,  Validators, FormBuilder  } from '@angular/forms';
import { ServiceService } from 'src/app/Service/Joya.service';
import { dropMaterial } from 'src/app/Models/MaterialViewModel';
import { dropCategoria } from 'src/app/Models/CategoriaViewModel';
import { Joya, JoyaEnviar } from 'src/app/Models/JoyaViewModel';
import { MaquillajeService } from 'src/app/Service/Maquillaje.service';
import { FileUpload } from 'primeng/fileupload';
import { Maquillaje, MaquillajeEnviar } from 'src/app/Models/MaquillajeViewModel';
import { dropMarca } from 'src/app/Models/MarcaViewModel';
import { JoyaService } from 'src/app/Service/Joya.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { forkJoin } from 'rxjs';
import {CookieService} from 'ngx-cookie-service';
import { DatePipe } from '@angular/common';
import { ProductoPorSucursalesService } from 'src/app/Service/ProductoPorSucursal.service';
import { ProductoPorSucursalDetalle, ProductoPorSucursalEnviar } from 'src/app/Models/ProductoPorSucursalViewModel';
@Component({
  templateUrl: './trasferencia.component.html',
  styleUrl: './transferencia.component.css',
  providers: [ConfirmationService,CookieService,DatePipe, MessageService]
})
export class TransferenciaComponent {
//Cantidad
@ViewChild('cantidadInput', { static: false }) cantidadInput: ElementRef;
//ViewModel
ProductoDetalle!:ProductoPorSucursalDetalle[];
MensajeViewModel!: MensajeViewModel[];
viewModel: ProductoPorSucursalEnviar = new ProductoPorSucursalEnviar();
//Almacenado del usuario
Usuario: string = this.cookie.get('Usuario');
Usua_Id: string = this.cookie.get('ID_Usuario');
SucursalID: string = this.cookie.get('SucursalID');
SucursalNombre: string = this.cookie.get('SucursalNombre');
//FormGrup
FacturaForm: FormGroup;

//Verificador
submitted: boolean = false;
//LlenadoDropDowns
sucursal: any[] = [];
countries: any[] = [];
listJoyas: any[] = [];
sucursalRecibido: any[] = [];
selectedListJoya: any[] = [];
selectedCountryAdvanced:  any[] = [];
selectedsSucursalAdvanced: any= this.SucursalNombre;
filteredCSucursal: any[] = [];
filteredListJoya: any[] = [];
filteredCountries: any[] = [];
selectedsSucursalRecibido: any[] = [];
filteredCSucursalRecibido: any[] = [];

  constructor(private service: ProductoPorSucursalesService, private router: Router, private messageService: MessageService,private fb: FormBuilder, private sservice: ServiceService, private maquillajeservice: MaquillajeService, private joyaService : JoyaService, private sanitizer: DomSanitizer,private cookie: CookieService, private datePipe: DatePipe) { }


  ngOnInit(): void {
    this.service.getFacturasDetalle(0).subscribe((data: any)=>{
      console.log(data);
      this.ProductoDetalle = data;
  });

 


  //Traer DropDowns
  this.service.getDropDownsSucursales().subscribe(suc => {
    this.sucursal = suc;
    this.sucursalRecibido = suc;
    });

    this.service.getAutoCompletadoJoya(this.SucursalID).subscribe(countries => {
      console.log(countries)
      this.listJoyas = countries;
      this.countries = countries;
      });

  this.FacturaForm = new FormGroup({
    Sucu_NombreRecibido: new FormControl("", [Validators.required]),
    Sucu_NombreEnvio: new FormControl(""),

    //Enviar
    FacturaEncabezado: new FormControl(this.cookie.get('SucursalID'), [Validators.required]),
    Prod_Nombre: new FormControl("", [Validators.required]),
    Prxs_Dif: new FormControl("1",Validators.required),
    Prod_Id: new FormControl("", Validators.required),
    Sucu_Id: new FormControl("", Validators.required),
    Prsx_Stock: new FormControl('', [Validators.required, Validators.min(1)]),
});  

 } 

//Filtros
 FilterSucursal(event: any) {
  const filtered: any[] = [];
  const query = event.query;
  for (let i = 0; i < this.sucursal.length; i++) {
      const cliente = this.sucursal[i];
      if (cliente.text.toLowerCase().indexOf(query.toLowerCase()) == 0) {
          filtered.push(cliente);
      }
  }
  this.filteredCSucursal = filtered;
}
FilterSucursalRecibido(event: any) {
  const filtered: any[] = [];
  const query = event.query;
  for (let i = 0; i < this.sucursalRecibido.length; i++) {
      const cliente = this.sucursalRecibido[i];
      if (cliente.text.toLowerCase().indexOf(query.toLowerCase()) == 0) {
          filtered.push(cliente);
      }
  }
  this.filteredCSucursalRecibido = filtered;
}
filterJoyaList(event: any) {
  const filtered: any[] = [];
  const query = event.query;
  for (let i = 0; i < this.listJoyas.length; i++) {
      const country = this.listJoyas[i];
      if (country.id.toLowerCase().indexOf(query.toLowerCase()) == 0) {
          filtered.push(country);
      }
  }
  this.filteredListJoya = filtered;
}

filterJoyaEscrito(event: any) {
  const filtered: any[] = [];
  const query = event.query;
  for (let i = 0; i < this.countries.length; i++) {
      const country = this.countries[i];
      if (country.nombre.toLowerCase().indexOf(query.toLowerCase()) == 0) {
          filtered.push(country);
      }
  }
  this.filteredCountries = filtered;
}

//Selecionar Filtros
onSelectSucursalRecibido(event) {

  this.FacturaForm.get('Sucu_Id').setValue(event.value.value);
  this.service.getFacturasDetalle(event.value.value).subscribe((data: any)=>{
    console.log(data);
    this.ProductoDetalle = data;
});
}
onSelectSucursalEnvio(event) {
  this.FacturaForm.get('FacturaEncabezado').setValue(event.value.value);

  this.SucursalID = event.value.value;
  if (this.FacturaForm.get('Prxs_Dif').value == "1") {
    this.service.getAutoCompletadoJoya(this.SucursalID).subscribe(countries => {
      console.log(countries)
      this.listJoyas = countries;
      this.countries = countries;
      });
      this.FacturaForm.get('Prsx_Stock').setValue(""); 
      this.FacturaForm.get('Prod_Id').setValue(""); 
      this.FacturaForm.get('Prod_Nombre').setValue(""); 
      this.submitted = false;
  } else {
    this.service.getAutoCompletadoMaquillaje(this.SucursalID).subscribe(countries => {
      console.log(countries)
      this.listJoyas = countries;
      this.countries = countries;
      });

      this.FacturaForm.get('Prsx_Stock').setValue(""); 
      this.FacturaForm.get('Prod_Id').setValue(""); 
      this.FacturaForm.get('Prod_Nombre').setValue(""); 
      this.submitted = false;
  }
}


//Radio
onRadioChange(event: Event) {
  const target = event.target as HTMLInputElement;
  const value = target.value;

  if (value === "1") {
    this.service.getAutoCompletadoJoya(this.SucursalID).subscribe(countries => {
      console.log(countries)
      this.listJoyas = countries;
      this.countries = countries;
      });
      this.FacturaForm.get('Prsx_Stock').setValue(""); 
      this.FacturaForm.get('Prod_Id').setValue(""); 
      this.FacturaForm.get('Prod_Nombre').setValue(""); 
      this.submitted = false;
  } else {
    this.service.getAutoCompletadoMaquillaje(this.SucursalID).subscribe(countries => {
      console.log(countries)
      this.listJoyas = countries;
      this.countries = countries;
      });

      this.FacturaForm.get('Prsx_Stock').setValue(""); 
      this.FacturaForm.get('Prod_Id').setValue(""); 
      this.FacturaForm.get('Prod_Nombre').setValue(""); 
      this.submitted = false;
  }
}


//Seleccionador
onSelectJoyaList(event) {
  console.log(event);
  this.FacturaForm.get('Prsx_Stock').setValue(event.value.stock); 
  this.FacturaForm.get('Prod_Id').setValue(event.value.id); 
  this.FacturaForm.get('Prod_Nombre').setValue(event.value.nombre); 


  setTimeout(() => {
    this.cantidadInput.nativeElement.focus();
  }, 0); 
}

OnSelectProduct(event) {
  console.log(event);
  this.FacturaForm.get('Prsx_Stock').setValue(event.value.stock); 
  this.FacturaForm.get('Prod_Id').setValue(event.value.id); 
  this.FacturaForm.get('Prod_Nombre').setValue(event.value.nombre); 


  setTimeout(() => {
    this.cantidadInput.nativeElement.focus();
  }, 0); 
}


//Tab
handleKeyDown(event: KeyboardEvent, fieldName: string) {
  if (event.key === "Enter" || event.key === "Tab") {
    event.preventDefault(); 

    if (fieldName === 'Prod_Nombre' || fieldName === 'Prod_Id') {
      if (!event.shiftKey && this.FacturaForm.get('Prod_Nombre').value) {

        setTimeout(() => {
          this.cantidadInput.nativeElement.focus();
        }, 0);
      }
    } else if (fieldName == 'Prsx_Stock') {
      this.onSubmit();

    }
  }
}

onSubmit() {
  console.log(this.FacturaForm)
  if (this.FacturaForm.valid && this.FacturaForm.get('Prsx_Stock').value !== '0') {
     this.viewModel = this.FacturaForm.value;
     this.viewModel.Usua_Id = this.Usua_Id;
        this.service.EnviarProductos(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
            this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Transferencia con exito', life: 3000 });
            this.service.getFacturasDetalle(this.viewModel.Sucu_Id).subscribe((data: any)=>{
              this.ProductoDetalle = data;
            });
            if (this.viewModel.Prxs_Dif == "1") {
              this.service.getAutoCompletadoJoya(this.SucursalID).subscribe(countries => {
                console.log(countries)
                this.listJoyas = countries;
                this.countries = countries;
                });
                this.FacturaForm.get('Prsx_Stock').setValue(""); 
                this.FacturaForm.get('Prod_Id').setValue(""); 
                this.FacturaForm.get('Prod_Nombre').setValue(""); 
                this.submitted = false;
            } else {
              this.service.getAutoCompletadoMaquillaje(this.SucursalID).subscribe(countries => {
                console.log(countries)
                this.listJoyas = countries;
                this.countries = countries;
                });
          
                this.FacturaForm.get('Prsx_Stock').setValue(""); 
                this.FacturaForm.get('Prod_Id').setValue(""); 
                this.FacturaForm.get('Prod_Nombre').setValue(""); 
                this.submitted = false;
            }


            this.submitted = false;


            }else{
              this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Stock mayor al que esta registrado', life: 3000 });
              this.submitted = false;
  
  
              }
       }  )
      
   
    
     
  }   
      else 
      {
          this.submitted = true;
      }
  }

}

