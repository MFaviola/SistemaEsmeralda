import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Factura, FacturaDetalle, FacturaEnviar, Fill } from 'src/app/Models/FacturaViewModel';
import { ServiceService } from 'src/app/Service/Factura.service';
import { YService } from '../../Impresion/impresion.service';
import { Cliente } from 'src/app/Models/ClienteViewModel';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { MegaMenuItem, MenuItem } from 'primeng/api';
import { FormGroup, FormControl,  Validators, FormBuilder  } from '@angular/forms';
import { CountryService } from 'src/app/demo/service/country.service';

@Component({
  templateUrl: './list-factura.component.html',
  styleUrl: './list-factura.component.css',
  providers: [ConfirmationService, MessageService]
})
export class ListFacturaComponent {
  Factura!:Factura[];
  FacturaDetalle!:FacturaDetalle[];
  routeItems: MenuItem[] = [];
  MensajeViewModel!: MensajeViewModel[];
  submitted: boolean = false;
  loading: boolean = false;
  departamentos: any[] = [];
  fill: any[] = [];
  viewModel: FacturaEnviar = new FacturaEnviar();
  FacturaForm: FormGroup;
  DetalleForm: FormGroup;
  @ViewChild('filter') filter!: ElementRef;
  Collapse: boolean = false;
  DataTable: boolean = true;
  Tabla: boolean = true;
  Detalles: boolean = false;
  Agregar: boolean = true;
  MunCodigo: boolean = true;
  Valor: string = "";
  staticData = [{}];


  deleteProductDialog: boolean = false;
  //Detalle
  Esta: String = "";
  id: string="";
  UsuarioCreacion: String = "";
  UsuarioModificacion: String = "";
  FechaCreacion: String = "";
  FechaModificacion: String = "";
  ID: String = "";
  facura_impresa: any = null;

  selectedRadio: string = '1'; 


  Fact_ID: string = "0";
  selectedMetodo: string = '4';
  


  //SUBTOTAL
  Subtotal: string = "0";
  Total: string = "0";
  //AUTOCOMPLETADO
  detalleForm: FormGroup;
  metodos: any[] = [];
  clientes: any[] = [];
  countries: any[] = [];
  selectedCountryAdvanced: any[] = [];
  selectedClientesAdvanced: any[] = [];
  selectedMetodoPagoAdvanced: any[] = [];
  filteredMetodoPago: any[] = [];
  filteredCountries: any[] = [];
  filteredClientes: any[] = [];
  constructor(private service: ServiceService, private router: Router, private srvImprecion : YService,
    private messageService: MessageService,private countryService: CountryService,private fb: FormBuilder
  
  ) { }


  ngOnInit(): void {
      this.service.getFacturas().subscribe((data: any)=>{
          console.log(data);
          this.Factura = data;
      },error=>{
        console.log(error);
      });

      this.service.getFacturasDetalle(this.Fact_ID).subscribe((data: any)=>{
        console.log(data);
        this.FacturaDetalle = data;
    },error=>{
      console.log(error);
    });
      this.FacturaForm = new FormGroup({
        //FACTUR
        Mepa_Id: new FormControl("1", Validators.required),
        Empl_Id: new FormControl("3", [Validators.required]),
        Clie_Id: new FormControl("1", [Validators.required]),
        Clie_DNI: new FormControl(""),
        Impu_Impuesto: new FormControl("15%",Validators.required),
        Clie_Nombre: new FormControl("Usuario Final", [Validators.required]),
        Empl_Nombre: new FormControl("Eduardo Varela", [Validators.required]),
        Prod_Producto: new FormControl(""),
        //Detalle
        Faxd_Dif: new FormControl("1",Validators.required),
        Prod_Nombre: new FormControl("", Validators.required),
        Prod_Id: new FormControl("", Validators.required),
        Faxd_Cantidad: new FormControl("", [Validators.required]),
    });  


      //AUTOCOMPLETADO
      this.service.getAutoCompletadoJoya().subscribe(countries => {
        this.countries = countries;
    });
    this.service.getMetodo().subscribe(meto => {
      this.metodos = meto;
   });
   this.service.getClientes().subscribe(client => {
    this.clientes = client;
    });
   } 
   selectMetodoPago(metodo: string) {
    this.selectedMetodo = metodo;


    this.FacturaForm.controls['Mepa_Id'].setValue(metodo);
}
   onRadioChange(event: Event) {
    const target = event.target as HTMLInputElement;
    const value = target.value;
    this.selectedRadio = target.value;

    if (value === "1") {
      this.service.getAutoCompletadoJoya().subscribe(countries => {
      this.countries = countries;
      this.FacturaForm.get('Faxd_Dif').setValue(value); 
      this.FacturaForm.get('Prod_Nombre').setValue(""); 
      this.FacturaForm.get('Prod_Id').setValue(""); 
      this.FacturaForm.get('Prod_Producto').setValue(""); 
      this.FacturaForm.get('Faxd_Cantidad').setValue(""); 
    });
    } else {
      this.service.getAutoCompletadoMaquillaje().subscribe(countries => {
        this.countries = countries;
      this.FacturaForm.get('Faxd_Dif').setValue(value); 
      this.FacturaForm.get('Prod_Nombre').setValue(""); 
      this.FacturaForm.get('Prod_Producto').setValue(""); 
      this.FacturaForm.get('Prod_Id').setValue(""); 
      this.FacturaForm.get('Faxd_Cantidad').setValue(""); 
    });
    }
  }

   filterCountry(event: any) {
    const filtered: any[] = [];
    const query = event.query;
    for (let i = 0; i < this.countries.length; i++) {
        const country = this.countries[i];
        
        if (country.text.toLowerCase().indexOf(query.toLowerCase()) == 0) {

            filtered.push(country);
        }
    }
   
  
    this.filteredCountries = filtered;
}

handleKeyDown(event: KeyboardEvent) {
  if (event.key === "Enter" || event.key === "Tab") {
      event.preventDefault();
      this.onSubmit(); 
  
  }
}

cantidad(event: any){
  console.log(event.key)
  console.log()
  this.service.getDatosPorCodigo(this.FacturaForm.get('Prod_Id').value).subscribe(countries => {
    this.FacturaForm.get('Prod_Nombre').setValue(countries[0].maqu_Nombre); 
    this.FacturaForm.get('Prod_Id').setValue(countries[0].maqu_Id); 
    this.FacturaForm.get('Prod_Producto').setValue(countries[0].maqu_Nombre); 
    this.FacturaForm.get('Faxd_Cantidad').setValue(1); 
  });

}
filterMetodo(event: any) {
  const filtered: any[] = [];
  const query = event.query;
  for (let i = 0; i < this.metodos.length; i++) {
      const metodo = this.metodos[i];
      
      if (metodo.mepa_Metodo.toLowerCase().indexOf(query.toLowerCase()) == 0) {

          filtered.push(metodo);
      }
  }
 
  this.filteredMetodoPago = filtered;
}

filterCliente(event: any) {
  const filtered: any[] = [];
  const query = event.query;
  for (let i = 0; i < this.clientes.length; i++) {
      const cliente = this.clientes[i];
      
      if (cliente.clie_DNI.toLowerCase().indexOf(query.toLowerCase()) == 0) {

          filtered.push(cliente);
      }
  }
 
  this.filteredClientes = filtered;
}
onSelectProduct(event) {
  this.FacturaForm.get('Faxd_Cantidad').setValue(1); 
  this.FacturaForm.get('Prod_Id').setValue(event.value.value); 
  this.FacturaForm.get('Prod_Nombre').setValue(event.value.text); 
}

onSelectCliente(event) {

  this.FacturaForm.get('Clie_Nombre').setValue(event.value.clie_Nombre); 
  this.FacturaForm.get('Clie_Id').setValue(event.value.clie_Id); 
  console.log(event.value.clie_Id)
}
onSelectMetodo(event) {

  this.FacturaForm.get('Mepa_Id').setValue(event.value.mepa_Id); 

}

confirmDelete(id) {
  this.submitted = false;
  this.service.EliminarDetalles(this.Fact_ID,id).subscribe({
    
    next: (response) => {
      this.submitted = false;
        if(response.message == "La accion ha sido existosa"){
          this.service.getFacturasDetalle(this.Fact_ID).subscribe((data: any)=>{
            this.FacturaDetalle = data;
            console.log(this.Fact_ID);
            console.log(data);
            const total = data.reduce((sum, item) => {
            const itemTotal = parseFloat(item.total) || 0; // Si no es un número válido, usa 0
            return sum + itemTotal;
                }, 0);
                      const impuestoString = this.FacturaForm.get('Impu_Impuesto').value.replace('%', '');
                      const impuesto = parseFloat(impuestoString) / 100 || 0;
                      const TotalFinal = (total + (total * impuesto))
                      this.Subtotal = total.toFixed(2);
                      this.Total = TotalFinal.toFixed(2);
                      
                 });
           }else{
            
            this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro eliminar', life: 3000 });
           }
        this.submitted = false;
    },
});


}




detalles(codigo){
  this.Collapse= false;
  this.DataTable = false;
  this.Agregar= false;
  this.Detalles = true;
}

Fill(codigo) {
  this.service.getFill(codigo).subscribe({

    next: (data: Fill) => {
      console.log(data);
      this.submitted = false;
      this.FacturaForm = new FormGroup({
        
        //FACTUR      this.submitted = false;
        Mepa_Id: new FormControl(data[0].mepa_Id, Validators.required),
        Empl_Id: new FormControl(data[0].empl_Id, [Validators.required]),
        Clie_Id: new FormControl(data[0].clie_Id, [Validators.required]),
        Clie_DNI: new FormControl(""),
        Impu_Impuesto: new FormControl("15%",Validators.required),
        Clie_Nombre: new FormControl(data[0].clie_Nombre, [Validators.required]),
        Empl_Nombre: new FormControl(data[0].empl_Nombre, [Validators.required]),
        Prod_Producto: new FormControl(""),
        //Detalle
        Faxd_Dif: new FormControl("1",Validators.required),
        Prod_Nombre: new FormControl("", Validators.required),
        Prod_Id: new FormControl("", Validators.required),
        Faxd_Cantidad: new FormControl("", [Validators.required]),
    });  
    this.selectMetodoPago = data[0].mepa_Id;
 
    this.submitted = false;
    if (data.clie_Id == "1") {
      this.FacturaForm.get('Clie_DNI').setValue(""); 
    }else{
      this.FacturaForm.get('Clie_DNI').setValue(data[0].clie_DNI); 
    }
    }
  });
 
  this.service.getFacturasDetalle(codigo).subscribe((data: any)=>{
    this.FacturaDetalle = data;
    const total = data.reduce((sum, item) => {
      const itemTotal = parseFloat(item.total) || 0; 
      return sum + itemTotal;
  }, 0);
  const impuestoString = this.FacturaForm.get('Impu_Impuesto').value.replace('%', '');
  const impuesto = parseFloat(impuestoString) / 100 || 0;
  const TotalFinal = (total + (total * impuesto))
  this.Subtotal = total.toFixed(2);
  this.Total = TotalFinal.toFixed(2);
  this.Collapse = true;
  this.DataTable = false;
  this.Agregar = false;
  this.Detalles = false;
  this.Fact_ID = codigo;
  this.Valor = "Agregar";
  });
 

}


   Imprimir(){
    const cliente = "Eduardo Varela"
    const DNI = "0511200500732"
    const Municipi = "Villanueva"
    const Depa = "Cortes"
    const Numero = "99482910"
    const Fecha = "2024-12-12"
    const Factura = "1"
    const Metodo = "Tarjeta Credito"
    const Impuesto = "15%"
    const Subtotal = "900"
    const Total = "1200"
    const encabezado =["Id", "Cliente", "Empleado"]
    const cuerpo=["1", "Eduardo", "Jezer"]
    const titulo= "fdsfdsfdsfdsfdsfds";
    const img = "assets/demo/images/galleria/Esmeraldas.png"
    this.facura_impresa = this.srvImprecion.Reporte1PDF(cuerpo,img,cliente,DNI,Municipi,Depa,Numero,Fecha,Factura,Impuesto,Metodo,Subtotal,Total)
 } 
 cancelar(){
  this.Collapse= false;
  this.DataTable = true;
  this.Detalles = false;
  this.submitted = false;
  this.ngOnInit();
  this.Agregar= true;
  this.MunCodigo=true;
  this.Fact_ID = "0";
  this.Valor = "";
}
validarTexto(event: KeyboardEvent) {

  if (!/^[a-zA-Z\s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
      event.preventDefault();
  }
}
onSubmit() {
  if (this.FacturaForm.valid && this.FacturaForm.get('Faxd_Cantidad').value !== '0') {
     this.viewModel = this.FacturaForm.value;
     this.viewModel.Fact_Id = this.Fact_ID;
     if (this.Valor == "Agregar") {
      this.service.EnviarFactura(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
           this.Fact_ID = data["id"];
           this.DataTable = false;
           this.submitted = false;
           this.Detalles = false;
           this.Agregar = false;
           this.service.getFacturasDetalle(this.Fact_ID).subscribe((data: any)=>{
          this.FacturaDetalle = data;
          const total = data.reduce((sum, item) => {
            const itemTotal = parseFloat(item.total) || 0; // Si no es un número válido, usa 0
            return sum + itemTotal;
        }, 0);
        const impuestoString = this.FacturaForm.get('Impu_Impuesto').value.replace('%', '');
        const impuesto = parseFloat(impuestoString) / 100 || 0;
        const TotalFinal = (total + (total * impuesto))
        this.Subtotal = total.toFixed(2);
        this.Total = TotalFinal.toFixed(2);
          });
          }else{
           this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No hay stock de este producto', life: 3000 });
          }
          
       })
     } else {
          this.service.ActualizarFactura(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
           this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
           this.Collapse= false;
           this.DataTable = true;
           this.Detalles = false;
           this.submitted = false;
           this.Agregar = false;
           this.ngOnInit();
   
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
  collapse(){
    this.Collapse= true;
    this.DataTable = false;
    this.Valor = "Agregar";
    this.Agregar= false;
    this.Detalles = false;
    this.Tabla = false;
    this.service.getFacturasDetalle(0).subscribe((data: any)=>{
      console.log(data);
      this.FacturaDetalle = data;
  },error=>{
    console.log(error);
  })
}
}

