import { Component, OnInit, ViewChild, ElementRef,ViewEncapsulation  } from '@angular/core';
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
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { FormGroup, FormControl,  Validators, FormBuilder  } from '@angular/forms';
import { CountryService } from 'src/app/demo/service/country.service';
import { an } from '@fullcalendar/core/internal-common';

@Component({
  templateUrl: './list-factura.component.html',
  styleUrl: '/list-factura.component.css',
  encapsulation: ViewEncapsulation.None,
  providers: [ConfirmationService, MessageService]
})
export class ListFacturaComponent {
  pdfSrc: SafeResourceUrl | null = null;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
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
  Venta: string = '0';
  Mayor: any = 0;
  MayorOVenta: String = '0'
  Fact_ID: string = "0";
  selectedMetodo: string = '1';
  TotalTabla: any = 0;
  

  //SUBTOTAL
  Subtotal: string = "0";
  Total: string = "0";
  //AUTOCOMPLETADO
  detalleForm: FormGroup;
  metodos: any[] = [];
  clientes: any[] = [];
  countries: any[] = [];
  listJoyas: any[] = [];
  selectedCountryAdvanced: any[] = [];
  selectedListJoya: any[] = [];
  selectedClientesAdvanced: any[] = [];
  selectedMetodoPagoAdvanced: any[] = [];
  filteredListJoya: any[] = [];
  filteredMetodoPago: any[] = [];
  filteredCountries: any[] = [];
  filteredClientes: any[] = [];
  constructor(private service: ServiceService, private router: Router, private srvImprecion : YService,
    private messageService: MessageService,private countryService: CountryService,private fb: FormBuilder,
    private yService: YService, private sanitizer: DomSanitizer
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
        Prod_Producto: new FormControl("", [Validators.required]),
        //Detalle
        Faxd_Dif: new FormControl("1",Validators.required),
        Prod_Nombre: new FormControl("", Validators.required),
        Prod_Id: new FormControl("", Validators.required),
        Faxd_Cantidad: new FormControl('', [Validators.required, Validators.min(1)]),
    });  


      //AUTOCOMPLETADO
      this.service.getAutoCompletadoJoya().subscribe(countries => {
        this.countries = countries;
    });
    this.service.getAutoCompletadoJoyaLista().subscribe(countries => {
      this.listJoyas = countries;
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
    console.log(metodo);
}
   onRadioChange(event: Event) {
    const target = event.target as HTMLInputElement;
    const value = target.value;
    this.selectedRadio = target.value;
    this.submitted = false;
    if (value === "1") {
      this.service.getAutoCompletadoJoyaLista().subscribe(countries => {
        this.listJoyas = countries;
      });
      this.service.getAutoCompletadoJoya().subscribe(countries => {
      this.countries = countries;
      this.FacturaForm.get('Faxd_Dif').setValue(value); 
      this.FacturaForm.get('Prod_Nombre').setValue(""); 
      this.FacturaForm.get('Prod_Id').setValue("", {emitEvent: false}); 
      this.submitted = false;
      this.FacturaForm.get('Prod_Producto').setValue(""); 
      this.FacturaForm.get('Faxd_Cantidad').setValue(""); 
     
    });

    } else {
      this.service.getAutoCompletadoListaMaquillaje().subscribe(countries => {
        this.listJoyas = countries;
      });
      this.service.getAutoCompletadoMaquillaje().subscribe(countries => {
      this.countries = countries;
      
      this.FacturaForm.get('Faxd_Dif').setValue(value); 
      this.FacturaForm.get('Prod_Nombre').setValue(""); 
      this.FacturaForm.get('Prod_Producto').setValue(""); 
      this.FacturaForm.get('Prod_Id').setValue("", {emitEvent: false}); 
     
      this.FacturaForm.get('Faxd_Cantidad').setValue(""); 
    
    });
    
    }
  }

filterCountry(event: any) {
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

handleKeyDown(event: KeyboardEvent) {
  if (event.key === "Enter" || event.key === "Tab") {
      event.preventDefault();
      this.onSubmit(); 
  
  }
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
  this.FacturaForm.get('Prod_Id').setValue(event.value.id); 
  this.FacturaForm.get('Prod_Nombre').setValue(event.value.nombre); 
  this.Venta = event.value.venta;
  this.Mayor = event.value.mayor;
  this.MayorOVenta = event.value.venta;
  this.TotalTabla = event.value.venta;
}
onCantidadChange() {
  console.log(this.FacturaForm.get('Faxd_Cantidad').value );
  if (parseFloat(this.FacturaForm.get('Faxd_Cantidad').value) > 5) {
    this.MayorOVenta = this.Mayor;
    const total = parseFloat(this.Mayor) * parseFloat(this.FacturaForm.get('Faxd_Cantidad').value);
    this.TotalTabla = total.toFixed(2);
  }else{
    this.MayorOVenta = this.Venta;
    const total = parseFloat(this.Venta) * parseFloat(this.FacturaForm.get('Faxd_Cantidad').value);
    this.TotalTabla = total.toFixed(2);
    if (this.FacturaForm.get('Faxd_Cantidad').value == 0 || this.FacturaForm.get('Faxd_Cantidad').value == null) {
      this.TotalTabla = "0";
    }
  }
}
onSelectJoyaList(event) {
  console.log(event);
  this.FacturaForm.get('Faxd_Cantidad').setValue(1); 
  this.FacturaForm.get('Prod_Id').setValue(event.value.id); 
  this.FacturaForm.get('Prod_Nombre').setValue(event.value.nombre); 
  this.FacturaForm.get('Prod_Producto').setValue(event.value.nombre); 
  this.MayorOVenta = event.value.venta;
  this.TotalTabla = event.value.venta;
  this.Venta = event.value.venta;
  this.Mayor = event.value.mayor;
}

onSelectCliente(event) {

  this.FacturaForm.get('Clie_Nombre').setValue(event.value.clie_Nombre); 
  this.FacturaForm.get('Clie_Id').setValue(event.value.clie_Id); 

}
onSelectMetodo(event) {

  this.FacturaForm.get('Mepa_Id').setValue(event.value.mepa_Id); 

}

confirmDelete(id,dif) {
  this.service.EliminarDetalles(this.Fact_ID,id,dif).subscribe({
    next: (response) => {
      this.submitted = false;
        if(response.message == "La accion ha sido existosa"){
            this.service.getFacturasDetalle(this.Fact_ID).subscribe((data: any)=>{
            this.FacturaDetalle = data;
            console.log(this.Fact_ID);
            console.log(data);
            const total = data.reduce((sum, item) => {
            const itemTotal = parseFloat(item.total) || 0; 
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

deleteSelectedProducts(codigo) {
  this.deleteProductDialog = true;
  this.ID = codigo;
  console.log("El codigo es" + codigo);
}

ConfirmFactura() {
  console.log(this.ID)
  this.service.ConfirmarFactura(this.ID).subscribe((data: MensajeViewModel[]) => {
    if(data["message"] == "La accion ha sido existosa"){
    this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Confirmado con Exito', life: 3000 });
     this.ngOnInit();
     this.deleteProductDialog = false;
    }else{
     this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro actualizar', life: 3000 });
    }
  })


}


detalles(){
  const cuerpo = [
    ['1', 'Diamante', '12', 'No'],
    ['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],['2', 'Joya', '8', 'Sí'],
  ];

  const img = "assets/demo/images/galleria/Esmeraldas.png"
  const blob = this.yService.Reporte2PDF(cuerpo,img);
  const url = URL.createObjectURL(blob);
  this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
  this.Reporte_2 = true
  this.Collapse= false;
  this.DataTable = false;
  this.Agregar= false;


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
        Clie_DNI: new FormControl("ss"),
        Impu_Impuesto: new FormControl("15%",Validators.required),
        Clie_Nombre: new FormControl(data[0].clie_Nombre, [Validators.required]),
        Empl_Nombre: new FormControl(data[0].empl_Nombre, [Validators.required]),
        Prod_Producto: new FormControl(""),
        //Detalle
        Faxd_Dif: new FormControl("1",Validators.required),
        Prod_Nombre: new FormControl("", Validators.required),
        Prod_Id: new FormControl("", Validators.required),
        Faxd_Cantidad: new FormControl('', [Validators.required, Validators.min(1)]),
    });  
    this.MayorOVenta = "0";
    this.TotalTabla = "0";
    this.submitted = false;
    this.selectMetodoPago(data[0].mepa_Id.toString());

    if (data[0].clie_Id == "1") {
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
  this.MayorOVenta = "0";
  this.TotalTabla = "0";
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
          this.Fact_ID = data["id"];
          const stock = data["stock"];
           this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Stock disponible:' + stock, life: 3000 });
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
    this.submitted = false;
    this.Collapse= true;
    this.DataTable = false;
    this.Valor = "Agregar";
    this.Agregar= false;
    this.Detalles = false;
    this.Tabla = false;
    this.Subtotal = "0";
    this.Total = "0";
    this.selectedMetodo = "1";
    this.service.getFacturasDetalle(0).subscribe((data: any)=>{
      console.log(data);
      this.FacturaDetalle = data;
  },error=>{
    console.log(error);
  })
}
}

