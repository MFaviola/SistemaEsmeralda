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
import { C, an, el } from '@fullcalendar/core/internal-common';
import { forkJoin } from 'rxjs';
import {CookieService} from 'ngx-cookie-service';
import { DatePipe } from '@angular/common';
import { CajaEnviar, Fill2, FillCajaCierre } from 'src/app/Models/DashboardViewModel';

@Component({
  templateUrl: './list-factura.component.html',
  styleUrl: '/list-factura.component.css',
  encapsulation: ViewEncapsulation.None,
  providers: [ConfirmationService, MessageService,CookieService,DatePipe]
})

export class ListFacturaComponent {
  //Region Logica PDF
  pdfSrc: SafeResourceUrl | null = null;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
  Reporte_3: boolean = false;
  //Region ViewModels
  Factura!:Factura[];
  FacturaDetalle!:FacturaDetalle[];
  MensajeViewModel!: MensajeViewModel[];
  viewModel: FacturaEnviar = new FacturaEnviar();
  viewModel2: CajaEnviar = new CajaEnviar();
  //Region FormGroup
  FacturaForm: FormGroup;
  DetalleForm: FormGroup;
  detalleForm: FormGroup;
  PagoForm: FormGroup;
  CajaCerradaForm: FormGroup;

  CajaCerrada
  //Region Collapse
  Collapse: boolean = false;
  DataTable: boolean = true;
  Tabla: boolean = true;
  Detalles: boolean = false;
  Agregar: boolean = true;
  MunCodigo: boolean = true;
  deleteProductDialog: boolean = false;
  ConfirmarPago: boolean = false;
  CajaCerradaDialog: boolean = false;

  //Region ?

  routeItems: MenuItem[] = [];
  submitted: boolean = false;
  dinero: boolean = false;
  loading: boolean = false;
  departamentos: any[] = [];
  fill: any[] = [];
  @ViewChild('cantidadInput', { static: false }) cantidadInput: ElementRef;
  @ViewChild('filter') filter!: ElementRef;
  Valor: string = "";
  staticData = [{}];
  
  
  //Region Detalles
  Esta: String = "";
  id: string="";
  UsuarioCreacion: String = "";
  UsuarioModificacion: String = "";
  FechaCreacion: String = "";
  FechaModificacion: String = "";
  TotalEfectivo: string = "";
  ID: String = "";


  //VARIABLES PARA LA CAJA
  Inicio: string = "0";
  CajaID; string = "0";

  facura_impresa: any = null;

  //Region Logica para calculado dinamico
  selectedRadio: string = '1'; 
  Venta: string = '0';
  Mayor: any = 0;
  MayorOVenta: String = '0'
  Fact_ID: string = "0";
  selectedMetodo: string = '1';
  TotalTabla: any = 0;
  Impuesto: string = "0";
  Subtotal: string = "0";
  Total: string = "0";
  pago: string = "0";
  cambio: string = "0";
  CajaForm: FormGroup;
  //Region Fecha
  dateDay = new Date();
  dateDayAnter = new Date();
  Validaciones: string = "Prueba";
  Validaciones2: string = "Prueba";
  conversion: string;
  hora = new Date().getHours;
  conversionHora: string;
  TotalCajaCerrar: string = "0";
  //Variable para manejar el estado de Actualizar
  Actualizar: string = "";
  AbrirCaja: boolean = false;
  subirCaja: boolean = false;
  //Almacenado del usuario
  Usuario: string = this.cookie.get('Usuario');
  Usua_Id: string = this.cookie.get('ID_Usuario');
  Sucu_Id: string = this.cookie.get('SucursalID');
  Empl_Id: string =  this.cookie.get('empl_Id');
 
  //AUTOCOMPLETADO

  metodos: any[] = [];
  clientes: any[] = [];
  clientesNombre: any[] = [];
  countries: any[] = [];
  listJoyas: any[] = [];
  selectedCountryAdvanced: any[] = [];
  selectedListJoya: any[] = [];
  selectedClientesAdvanced: any[] = [];
  selectedClientesNombreAdvanced: any = "Consumidor Final";
  selectedMetodoPagoAdvanced: any[] = [];
  filteredListJoya: any[] = [];
  filteredMetodoPago: any[] = [];
  filteredCountries: any[] = [];
  filteredClientes: any[] = [];
  filteredClientesNombre: any[] = [];
  constructor(private service: ServiceService, private router: Router, private srvImprecion : YService,
    private messageService: MessageService,private countryService: CountryService,private fb: FormBuilder,
    private yService: YService, private sanitizer: DomSanitizer,private cookie: CookieService, private datePipe: DatePipe
  ) { }


  ngOnInit(): void {
  this.verifyCajaState()


    this.dateDayAnter.setDate(this.dateDayAnter.getDate() - 1);
    const fechaA = this.datePipe.transform(this.dateDayAnter, 'yyyy-MM-dd');
    this.service.getValidacion(fechaA, this.cookie.get('SucursalID')).subscribe((data: FillCajaCierre[]) => {
        
      if (data.length >= 0 ) {
        if (data[0].caja_Finalizado == "True") {
          this.CajaID = data[0].caja_Id;
          this.Inicio = data[0].caja_MontoInicial
          this.Validaciones = "Ayer"
          this.CajaCerradaDialog = true
        }
        
      }
     

         
        } 
           
      
        )

        this.service.getFacturasVentas(fechaA).subscribe(
          (ventasData: any) => {
            console.log('Ventas Data:', ventasData);
            if (ventasData && ventasData.length > 0) {
              const total = parseFloat(ventasData[0].total); 
              this.TotalCajaCerrar = total.toFixed(2);
              console.log('Total Caja Cerrar:', this.TotalCajaCerrar);
            } 
          },
        );

    

    this.CajaCerradaForm = new FormGroup({
      caja_MontoFinal: new FormControl("", Validators.required),
      caja_Observacion: new FormControl("", Validators.required),
  });  

    this.CajaForm = new FormGroup({
      caja_MontoInicial: new FormControl("", Validators.required),
    });  
      this.service.getFacturas().subscribe((data: any)=>{
          console.log(data);
          this.Factura = data;
      });
      this.service.getFacturasDetalle(this.Fact_ID).subscribe((data: any)=>{
        console.log(data);
        this.FacturaDetalle = data;
      });

      this.PagoForm = new FormGroup({
        Pago: new FormControl("", Validators.required),
        PagoT: new FormControl("", Validators.required)
    });  


      this.FacturaForm = new FormGroup({
        Mepa_Id: new FormControl("1", Validators.required),
        Empl_Id: new FormControl(this.Empl_Id, [Validators.required]),
        Clie_Id: new FormControl("1", [Validators.required]),
        Clie_DNI: new FormControl(""),
        Impu_Impuesto: new FormControl("15%",Validators.required),
        Clie_Nombre: new FormControl("Consumidor Final", [Validators.required]),
        Empl_Nombre: new FormControl("Eduardo Varela", [Validators.required]),
        Prod_Producto: new FormControl("", [Validators.required]),
        //Detalle
        Faxd_Dif: new FormControl("1",Validators.required),
        Prod_Nombre: new FormControl("", Validators.required),
        Prod_Id: new FormControl("", Validators.required),
        Faxd_Cantidad: new FormControl('', [Validators.required, Validators.min(1)]),
    });  


      //AUTOCOMPLETADO
      this.service.getAutoCompletadoJoya(this.Sucu_Id).subscribe(countries => {
        this.countries = countries;
      });
     this.service.getAutoCompletadoJoyaLista(this.Sucu_Id).subscribe(countries => {
      this.listJoyas = countries;
      });
    this.service.getMetodo().subscribe(meto => {
      this.metodos = meto;
    });
    this.service.getClientes().subscribe(client => {
    this.clientes = client;
    this.clientesNombre = client;
    });

    this.yService.cajaStateSource.subscribe(state => {
      if (state == 'Cerrada') {
        this.CajaCerradaForm = new FormGroup({
          caja_MontoFinal: new FormControl("", Validators.required),
          caja_Observacion: new FormControl("", Validators.required),
      });  
    
        this.CajaForm = new FormGroup({
          caja_MontoInicial: new FormControl("", Validators.required),
        });  
        this.Validaciones = "Hoy"
        this.Validaciones2 = "Hoy"

      }
    });
   } 

   verifyCajaState(): void {
    this.dateDayAnter.setDate(this.dateDayAnter.getDate());
    const fechaAS = this.datePipe.transform(this.dateDayAnter, 'yyyy-MM-dd');
    this.service.getValidacion(fechaAS, this.cookie.get('SucursalID')).subscribe((data: FillCajaCierre[]) => {
      if (data.length <= 0) {
        this.yService.changeCajaState('Cerrada');
      } else {
        const cajaSinCerrar = data.some(item => item.caja_Finalizado == "False");
        this.yService.changeCajaState(cajaSinCerrar ? 'Cerrada' : 'Abrir');
  
    

      }
    });
  }


   refrescar(){
    this.service.getFacturasDetalle(0).subscribe((data: any)=>{
      this.FacturaDetalle = data;
    })
    this.selectedClientesNombreAdvanced = "Consumidor Final";
    this.FacturaForm.get('Mepa_Id').setValue("1")
    this.selectedRadio = '1';
    this.Validaciones = "Prueba";
    this.selectedMetodo = '1';
    this.FacturaForm.get('Faxd_Dif').setValue("1")
    this.FacturaForm.get('Clie_Id').setValue("1")
    this.FacturaForm.get('Clie_DNI').setValue("")
    this.FacturaForm.get('Faxd_Cantidad').setValue("")
    this.FacturaForm.get('Prod_Nombre').setValue("")
    this.FacturaForm.get('Prod_Producto').setValue("")
    this.FacturaForm.get('Prod_Id').setValue("");
    this.Fact_ID = "0";
    this.Valor = "";
    this.MayorOVenta = "0";
    this.Subtotal = "0"
    this.TotalTabla = "0";

    this.service.getAutoCompletadoJoya(this.Sucu_Id).subscribe(countries => {
      this.countries = countries;
    });
   this.service.getAutoCompletadoJoyaLista(this.Sucu_Id).subscribe(countries => {
    this.listJoyas = countries;
    });
    this.submitted = false;
      this.Collapse= true;
      this.DataTable = false;
      this.Valor = "Agregar";
      this.Agregar= false;
      this.Detalles = false;
      this.Tabla = false;
      this.Subtotal = "0";
      this.Impuesto = "0"
      this.Total = "0";
      this.selectedMetodo = "1";
      this.Actualizar = ""
    this.Impuesto = "0"
    this.Total = "0";
    this.submitted = false;
  }


  refrescarCancelar(){
    this.service.getFacturasDetalle(0).subscribe((data: any)=>{
      this.FacturaDetalle = data;
    })
    this.selectedClientesNombreAdvanced = "Consumidor Final";
    this.FacturaForm.get('Mepa_Id').setValue("1")
    this.selectedRadio = '1';
    this.Validaciones = "Prueba";
    this.selectedMetodo = '1';
    this.FacturaForm.get('Faxd_Dif').setValue("1")
    this.FacturaForm.get('Clie_Id').setValue("1")
    this.FacturaForm.get('Clie_DNI').setValue("")
    this.FacturaForm.get('Faxd_Cantidad').setValue("")
    this.FacturaForm.get('Prod_Nombre').setValue("")
    this.FacturaForm.get('Prod_Producto').setValue("")
    this.FacturaForm.get('Prod_Id').setValue("");
    this.Fact_ID = "0";
    this.Valor = "";
    this.MayorOVenta = "0";
    this.Subtotal = "0"
    this.TotalTabla = "0";

    this.service.getAutoCompletadoJoya(this.Sucu_Id).subscribe(countries => {
      this.countries = countries;
    });
   this.service.getAutoCompletadoJoyaLista(this.Sucu_Id).subscribe(countries => {
    this.listJoyas = countries;
    });
    this.submitted = false;
      this.Valor = "Agregar";
      this.Subtotal = "0";
      this.Impuesto = "0"
      this.Total = "0";
      this.selectedMetodo = "1";
      this.Actualizar = ""
    this.Impuesto = "0"
    this.Total = "0";
    this.submitted = false;
  }
  
//Seleccionar el metodo
   selectMetodoPago(metodo: string) {
    this.selectedMetodo = metodo;
    this.FacturaForm.controls['Mepa_Id'].setValue(metodo);
    console.log(metodo);
  }

//Cambio de Radio 
   onRadioChange(event: Event) {
    const target = event.target as HTMLInputElement;
    const value = target.value;
    this.selectedRadio = target.value;
    this.submitted = false;
    if (value === "1") {
      this.service.getAutoCompletadoJoyaLista(this.Sucu_Id).subscribe(countries => {
        this.listJoyas = countries;
      });
      this.service.getAutoCompletadoJoya(this.Sucu_Id).subscribe(countries => {
      this.countries = countries;
      this.FacturaForm.get('Faxd_Dif').setValue(value); 
      this.FacturaForm.get('Prod_Nombre').setValue(""); 
      this.FacturaForm.get('Prod_Id').setValue("", {emitEvent: false}); 
      this.submitted = false;
      this.FacturaForm.get('Prod_Producto').setValue(""); 
      this.FacturaForm.get('Faxd_Cantidad').setValue(""); 
      this.MayorOVenta = "";
    });
    } else {
      this.service.getAutoCompletadoListaMaquillaje(this.Sucu_Id).subscribe(countries => {
        this.listJoyas = countries;
      });
      this.service.getAutoCompletadoMaquillaje(this.Sucu_Id).subscribe(countries => {
      this.countries = countries;
      this.FacturaForm.get('Faxd_Dif').setValue(value); 
      this.FacturaForm.get('Prod_Nombre').setValue(""); 
      this.FacturaForm.get('Prod_Producto').setValue(""); 
      this.FacturaForm.get('Prod_Id').setValue("", {emitEvent: false});      
      this.FacturaForm.get('Faxd_Cantidad').setValue(""); 
      this.MayorOVenta = "0";
    });
    }
  }

//Region Filtros
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
filterClienteNombre(event: any) {
  const filtered: any[] = [];
  const query = event.query;
  for (let i = 0; i < this.clientesNombre.length; i++) {
      const cliente = this.clientesNombre[i];
      if (cliente.clie_Nombre.toLowerCase().indexOf(query.toLowerCase()) == 0) {
          filtered.push(cliente);
      }
  }
  this.filteredClientesNombre = filtered;
}
onSelectClienteNombre(event) {

  this.FacturaForm.get('Clie_DNI').setValue(event.value.clie_DNI); 
  this.FacturaForm.get('Clie_Id').setValue(event.value.clie_Id); 

}
//Seleccionado del filtro
onSelectCliente(event) {

  this.FacturaForm.get('Clie_Nombre').setValue(event.value.clie_Nombre); 
  this.FacturaForm.get('Clie_Id').setValue(event.value.clie_Id); 

}
onSelectMetodo(event) {

  this.FacturaForm.get('Mepa_Id').setValue(event.value.mepa_Id); 

}
onSelectProduct(event) {
  this.FacturaForm.get('Faxd_Cantidad').setValue(1); 
  this.FacturaForm.get('Prod_Id').setValue(event.value.id); 
  this.FacturaForm.get('Prod_Nombre').setValue(event.value.nombre); 
  this.Venta = event.value.venta;
  this.Mayor = event.value.mayor;
  this.MayorOVenta = event.value.venta;
  this.TotalTabla = event.value.venta;
  this.cantidadInput.nativeElement.focus();
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

  setTimeout(() => {
    this.cantidadInput.nativeElement.focus();
  }, 0); 
}


//Uso del Tab
handleKeyDown(event: KeyboardEvent, fieldName: string) {
  if (event.key === "Enter" || event.key === "Tab") {
    event.preventDefault(); // Prevenir el comportamiento predeterminado

    if (fieldName === 'Prod_Producto' || fieldName === 'Prod_Id') {
      if (!event.shiftKey && this.FacturaForm.get('Prod_Producto').value) {
        // Enfocar al campo de cantidad si hay un valor seleccionado
        setTimeout(() => {
          this.cantidadInput.nativeElement.focus();
        }, 0);
      }
    } else if (fieldName === 'Faxd_Cantidad') {
      // Enviar el formulario cuando se esté en el campo de cantidad y se presione Enter/Tab
      this.onSubmit();
    }
  }
}

//Funcion para el cambio dinamico del subtotal y total
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
//Cancelar Y Collapse
cancelar(){
  this.Actualizar = "Actualizar"
  this.FacturaForm.get('Faxd_Cantidad').setValue("1")
  this.FacturaForm.get('Prod_Nombre').setValue("Pro")
  this.FacturaForm.get('Prod_Id').setValue("1")
  this.Validaciones = "Prueba";
  this.onSubmit();
  this.Collapse= false;
  this.DataTable = true;
  this.Detalles = false;
  this.submitted = false;
  this.refrescarCancelar();
  this.Agregar= true;
  this.MunCodigo=true;
  this.Fact_ID = "0";
  this.Valor = "";
  this.MayorOVenta = "0";
  this.TotalTabla = "0";
}

confirmar(){
  if(this.FacturaForm.get('Mepa_Id').value == "1"){
    this.deleteProductDialog = true;
  }else{
    this.Actualizar = "Confirmar"
    this.FacturaForm.get('Faxd_Cantidad').setValue("1")
    this.FacturaForm.get('Prod_Nombre').setValue("Pro")
    this.FacturaForm.get('Prod_Id').setValue("1");
    this.Validaciones = "Prueba";
    this.onSubmit();
  }
}
ConfirmarEditado(){
    this.Actualizar = "Confirmar"
    this.FacturaForm.get('Faxd_Cantidad').setValue("1")
    this.FacturaForm.get('Prod_Nombre').setValue("Pro")
    this.FacturaForm.get('Prod_Id').setValue("1");
    this.PagoForm.get('Pago').value;
    this.Validaciones = "Prueba";
    const valor =parseFloat(this.Total) - parseFloat( this.PagoForm.get('Pago').value);
    console.log(valor);
    if (valor > 0) {
      this.dinero = true; 
    } else {

      this.pago = this.PagoForm.get('Pago').value
      const cambio = parseFloat( this.PagoForm.get('Pago').value) - parseFloat(this.Total) ;
      this.cambio =  cambio.toString();
      this.PagoForm.get('Pago').setValue("");
      this.onSubmit();
      this.deleteProductDialog = false;
      this.dinero = false; 
    }

 
}
//SUBIR

onSubmitCajaCerrada() {
  if (this.CajaCerradaForm.valid) {
     this.viewModel2 = this.CajaCerradaForm.value;
     this.viewModel2.caja_UsuarioCierre = this.cookie.get('ID_Usuario');
     this.viewModel2.caja_Id = this.CajaID;
     const total = parseFloat(this.CajaCerradaForm.get('caja_MontoFinal').value) + parseFloat(this.Inicio);
     this.viewModel2.caja_MontoInicial = this.Inicio;
     this.viewModel2.caja_MontoFinal = total.toFixed(2)
    this.viewModel2.caja_MontoSistema = this.TotalCajaCerrar;
     this.service.EnviarCierre(this.viewModel2).subscribe((data: MensajeViewModel[]) => {
      if(data["message"] == "Operación completada exitosamente."){
          this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Puede continuar', life: 3000 });
          this.CajaCerradaDialog = false;
        
         
        
      }else{
    
       this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se pudo cerrar:', life: 3000 });
      } 
   })
  
    
 
  }   
      else 
      {
          this.submitted = true;
      }
  }


onSubmitCaja() {
  if (this.CajaForm.valid) {
     this.viewModel2 = this.CajaForm.value;
     this.viewModel2.caja_UsuarioApertura = this.cookie.get('ID_Usuario');
     this.viewModel2.Sucu_Id = this.Sucu_Id;
     this.service.EnviarAbierto(this.viewModel2).subscribe((data: MensajeViewModel[]) => {
      if(data["message"] == "Operación completada exitosamente."){
          this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Puede continuar', life: 3000 });
          this.yService.changeCajaState('Abrir');
          this.AbrirCaja = false;
          this.submitted = false;
                this.Collapse= true;
                this.DataTable = false;
                this.Valor = "Agregar";
                this.Agregar= false;
                this.Detalles = false;
                this.Tabla = false;
                this.Subtotal = "0";
                this.Impuesto = "0"
                this.Total = "0";
                this.selectedMetodo = "1";
                this.Actualizar = ""
                this.service.getFacturasDetalle(0).subscribe((data: any)=>{
                this.FacturaDetalle = data;
              })
      }else{
    
       this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se pudo cerrar:', life: 3000 });
      } 
   })
  
    
 
  }   
      else 
      {
          this.subirCaja = true;
      }
  }


  collapse(){
    if (this.Validaciones == "Prueba") {
                this.submitted = false;
                this.Collapse= true;
                this.DataTable = false;
                this.Valor = "Agregar";
                this.Agregar= false;
                this.Detalles = false;
                this.Tabla = false;
                this.Subtotal = "0";
                this.Impuesto = "0"
                this.Total = "0";
                this.selectedMetodo = "1";
                this.Actualizar = ""
                this.service.getFacturasDetalle(0).subscribe((data: any)=>{
                this.FacturaDetalle = data;
              })
    }else if(this.Validaciones == "Ayer"){
        this.CajaCerradaDialog = true;
    }else if(this.Validaciones == "Hoy"){
      this.AbrirCaja = true;
  }
     
    }

comprobarSistema(){
  this.dateDayAnter.setDate(this.dateDayAnter.getDate());
  const fechaA = this.datePipe.transform(this.dateDayAnter, 'yyyy-MM-dd');
  this.service.getValidacion(fechaA, this.cookie.get('SucursalID')).subscribe((data: FillCajaCierre[]) => {
  

 

     
    } 
       
  
    )
}
//Envio tanto para insertar como para actualizar
onSubmit() {



  if (this.FacturaForm.valid && this.FacturaForm.get('Faxd_Cantidad').value !== '0') {
     this.viewModel = this.FacturaForm.value;
     this.viewModel.Fact_Id = this.Fact_ID;
     this.viewModel.Pago = this.pago;
     this.pago = "0";
     this.viewModel.PagoCambio = this.cambio;
     this.cambio = "0";
     this.viewModel.Actualizar = this.Actualizar;
     this.viewModel.Sucu_Id = this.Sucu_Id;
     this.viewModel.Usua_Id = this.Usua_Id;
     if (this.Valor == "Agregar") {
      if (this.Actualizar == "Actualizar" ) {
        this.service.EnviarFactura(this.viewModel).subscribe((data: MensajeViewModel[]) => {
       })
      }else if(this.Actualizar == "Confirmar"){
        this.service.EnviarFactura(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "La accion ha sido existosa"){
            this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Confirmado con Exito', life: 3000 });
            const detalles$ = this.service.getFacturasDetalle(this.Fact_ID);
            const fill$ = this.service.getFill(this.Fact_ID);
          
            forkJoin([detalles$, fill$]).subscribe({
              next: ([detallesData, fillData]) => {
                const cuerpo = detallesData.map(item => [
                  item.producto.toString(),
                  item.cantidad.toString(),
                  item.total.toString()
                ]);
          
                console.log(cuerpo);
                const total = detallesData.reduce((sum, item) => sum + (parseFloat(item.total) || 0), 0);
                const impuestoString = "15%";
                const impuesto = parseFloat(impuestoString) / 100;
                const impuestoSubtotal = (total * impuesto);
                const EnviarImpuesto = impuestoSubtotal.toFixed(2);
                const TotalFinal = total + (total * impuesto);
                const Subtotal = total.toFixed(2);
                const Total = TotalFinal.toFixed(2);
                const cliente = fillData[0].clie_Nombre;
                console.log("SU ID" + fillData[0].clie_Id);
                const DNI = fillData[0].clie_Id == "1" ? "Consumidor Final" : fillData[0].clie_DNI;
                const Municipio = fillData[0].muni_Municipio;
                const Departamento = fillData[0].depa_Departamento;
                const Fecha = fillData[0].fechaCreacion;
                const Factura = fillData[0].fact_Id;
                const Metodo = fillData[0].mepa_Metodo;
                const Impuesto = "15%";
                const img = "assets/demo/images/galleria/Esmeraldas.png";
                const usuario = this.cookie.get('Empleado');
               const hgora = this.datePipe.transform(this.dateDay, 'HH:mm');
                const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
                console.log("El usuario es" + usuario)
                const TotalCancelado = fillData[0].fact_Pago
                const Cambio = fillData[0].fact_Cambio
                const largoo = 506
                const largo = this.yService.ReporteFacturaNumero(cuerpo, img, cliente, DNI, Municipio, Departamento, Fecha, Factura, EnviarImpuesto, Metodo, Subtotal, Total,fechaC,usuario,largoo,hgora,TotalCancelado,Cambio);
                const blob = this.yService.ReporteFactura(cuerpo, img, cliente, DNI, Municipio, Departamento, Fecha, Factura, EnviarImpuesto, Metodo, Subtotal, Total,fechaC,usuario,largo,hgora,TotalCancelado,Cambio);
                const url = URL.createObjectURL(blob);
          
          
                this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
          
                
               
          
                setTimeout(() => {
                  const iframe = document.querySelector('iframe');
                  if (iframe) {
                    iframe.contentWindow.print();
                  } else {
                    console.error('No se encontró el iframe.');
                  }
                }, 1000);
              },
              error: err => {
                console.error('Error al cargar los datos', err);
              }
            }); 
            this.Collapse= false;
            this.DataTable = true;
            this.Detalles = false;
            this.submitted = false;
            this.refrescar();
            this.Agregar= true;
            this.MunCodigo=true;
            this.Fact_ID = "0";
            this.Valor = "";
            this.MayorOVenta = "0";
            this.TotalTabla = "0";
            }
       })
      }
        else{
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
            const itemTotal = parseFloat(item.total) || 0; 
            return sum + itemTotal;
        }, 0);
        const impuestoString = this.FacturaForm.get('Impu_Impuesto').value.replace('%', '');
        const impuesto = parseFloat(impuestoString) / 100 || 0;
        const TotalFinal = (total + (total * impuesto))
        const TotalImpuesto =total * impuesto
        this.Impuesto =  TotalImpuesto.toFixed(2)
        this.Subtotal = total.toFixed(2);
        this.Total = TotalFinal.toFixed(2);
          });
          }else{
          this.Fact_ID = data["id"];
          const stock = data["stock"];
           this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Stock disponible:' + stock, life: 3000 });
          } 
       })
      }
    
     } 
  }   
      else 
      {
          this.submitted = true;
      }
  }


confirmDelete(id,dif) {
  this.service.EliminarDetalles(this.Fact_ID,id,this.Sucu_Id).subscribe({
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
}
EfectivoOConfirmar(id){
  const detalles$ = this.service.getFacturasDetalle(id);
  const fill$ = this.service.getFill(id);

  forkJoin([detalles$, fill$]).subscribe({
    next: ([detallesData, fillData]) => {
      if(fillData[0].mepa_Id == "1"){
      const total = detallesData.reduce((sum, item) => sum + (parseFloat(item.total) || 0), 0);
      const impuestoString = "15%";
      const impuesto = parseFloat(impuestoString) / 100;
      const impuestoSubtotal = (total * impuesto);
      const EnviarImpuesto = impuestoSubtotal.toFixed(2);
      const TotalFinal = total + (total * impuesto);
      this.Fact_ID = id;
      this.Total = TotalFinal.toFixed();
      this.ConfirmarPago = true;
      }else{
        this.ConfirmFactura(id);
      }
      
    }
   
  });
}
ConfirmarT(){
  this.Total
  const valor = parseFloat(this.Total) - parseFloat( this.PagoForm.get('PagoT').value);

  if (valor > 0) {
    this.dinero = true; 
  } else {
    this.pago = this.PagoForm.get('PagoT').value;
    const cambio = parseFloat( this.PagoForm.get('PagoT').value) - parseFloat(this.Total) ;
    this.cambio =  cambio.toString();
    this.PagoForm.get('PagoT').setValue("");
    this.ConfirmFactura(this.Fact_ID);
    this.Fact_ID = "0"
    this.Total = "0"
    this.ConfirmarPago = false;
    this.dinero = false; 
  }
}
ConfirmFactura(id) {
  this.service.ConfirmarFactura(id,this.pago,this.cambio).subscribe((data: MensajeViewModel[]) => {
    if(data["message"] == "La accion ha sido existosa"){
    this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Confirmado con Exito', life: 3000 });
    const detalles$ = this.service.getFacturasDetalle(id);
    const fill$ = this.service.getFill(id);
  
    forkJoin([detalles$, fill$]).subscribe({
      next: ([detallesData, fillData]) => {
        const cuerpo = detallesData.map(item => [
          item.producto.toString(),
          item.cantidad.toString(),
          item.total.toString()
        ]);
  
        console.log(cuerpo);
        const total = detallesData.reduce((sum, item) => sum + (parseFloat(item.total) || 0), 0);
        const impuestoString = "15%";
        const impuesto = parseFloat(impuestoString) / 100;
        const impuestoSubtotal = (total * impuesto);
        const EnviarImpuesto = impuestoSubtotal.toFixed(2);
        const TotalFinal = total + (total * impuesto);
        const Subtotal = total.toFixed(2);
        const Total = TotalFinal.toFixed(2);
        const cliente = fillData[0].clie_Nombre;
        console.log("SU ID" + fillData[0].clie_Id);
        const DNI = fillData[0].clie_Id == "1" ? "Consumidor Final" : fillData[0].clie_DNI;
        const Municipio = fillData[0].muni_Municipio;
        const Departamento = fillData[0].depa_Departamento;
        const Fecha = fillData[0].fechaCreacion;
        const Factura = fillData[0].fact_Id;
        const Metodo = fillData[0].mepa_Metodo;
        const Impuesto = "15%";
        const img = "assets/demo/images/galleria/Esmeraldas.png";
        const usuario = this.cookie.get('Empleado');
       const hgora = this.datePipe.transform(this.dateDay, 'HH:mm');
        const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
        console.log("El usuario es" + usuario)
        const TotalCancelado = fillData[0].fact_Pago
        const Cambio = fillData[0].fact_Cambio
        const largoo = 506
        const largo = this.yService.ReporteFacturaNumero(cuerpo, img, cliente, DNI, Municipio, Departamento, Fecha, Factura, EnviarImpuesto, Metodo, Subtotal, Total,fechaC,usuario,largoo,hgora,TotalCancelado,Cambio);
        const blob = this.yService.ReporteFactura(cuerpo, img, cliente, DNI, Municipio, Departamento, Fecha, Factura, EnviarImpuesto, Metodo, Subtotal, Total,fechaC,usuario,largo,hgora,TotalCancelado,Cambio);
        const url = URL.createObjectURL(blob);
  
  
        this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
  
        
       
  
        setTimeout(() => {
          const iframe = document.querySelector('iframe');
          if (iframe) {
            iframe.contentWindow.print();
          } else {
            console.error('No se encontró el iframe.');
          }
        }, 1000);
      },
      error: err => {
        console.error('Error al cargar los datos', err);
      }
    }); 
    
     this.ngOnInit();
     this.deleteProductDialog = false;
     this.pago = "0"
     this.cambio = "0"
    }else{
     this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro actualizar', life: 3000 });
    }
  })


}


detalles(codigo) {
  const detalles$ = this.service.getFacturasDetalle(codigo);
  const fill$ = this.service.getFill(codigo);
  forkJoin([detalles$, fill$]).subscribe({
    next: ([detallesData, fillData]) => {
      const cuerpo = detallesData.map(item => [
        item.codigoRow.toString(),
        item.producto.toString(),
        item.cantidad.toString(),
        item.precio_Unitario.toString(),
        item.total.toString()

      ]);

      console.log(cuerpo);
      const total = detallesData.reduce((sum, item) => sum + (parseFloat(item.total) || 0), 0);
      const impuestoString = "15%";
      const impuesto = parseFloat(impuestoString) / 100;
      const impuestoSubtotal = (total * impuesto);
      const EnviarImpuesto = impuestoSubtotal.toFixed(2);
      const TotalFinal = total + (total * impuesto);
      const Subtotal = total.toFixed(2);
      const Total = TotalFinal.toFixed(2);
      const cliente = fillData[0].clie_Nombre;
      console.log("SU ID" + fillData[0].clie_Id);
      const DNI = fillData[0].clie_Id == "1" ? "Consumidor Final" : fillData[0].clie_DNI;
      const Municipio = fillData[0].muni_Municipio;
      const Departamento = fillData[0].depa_Departamento;
      const Fecha = fillData[0].fechaCreacion;
      const Factura = fillData[0].fact_Id;
      const Metodo = fillData[0].mepa_Metodo;
      const Impuesto = "15%";
      const img = "assets/demo/images/galleria/Esmeraldas.png";
      const usuario = this.cookie.get('Empleado');
     const hgora = this.datePipe.transform(this.dateDay, 'HH:mm');
      const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
      console.log("El usuario es" + usuario)
      const TotalCancelado = fillData[0].fact_Pago
      const Cambio = fillData[0].fact_Cambio
      const Sucursal = fillData[0].sucu_Nombre
      const largoo = 506
      const blob = this.yService.Reporte2PDF(cuerpo, img, cliente, DNI, Municipio, Departamento, Fecha, Factura, EnviarImpuesto, Metodo, Subtotal, Total,fechaC,usuario,TotalCancelado,Cambio,Sucursal);
      const url = URL.createObjectURL(blob);


      this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);

      this.Reporte_2 = true;
      this.Collapse = false;
      this.DataTable = false;
      this.Agregar = false;
     


    },
    error: err => {
      console.error('Error al cargar los datos', err);
    }
  });
}
Volver(){
  this.Reporte_2 = false;
  this.Collapse = false;
  this.DataTable = true;
  this.Agregar = true;
}
Fill(codigo) {
  this.service.getFill(codigo).subscribe({

    next: (data: Fill) => {
      console.log(data);
      this.submitted = false;
      this.FacturaForm = new FormGroup({
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
  const TotalImpuesto = total * impuesto
  this.Impuesto = TotalImpuesto.toFixed(2)
  this.Subtotal = total.toFixed(2);
  this.Total = TotalFinal.toFixed(2);
  this.Collapse = true;
  this.DataTable = false;
  this.Agregar = false;
  this.Detalles = false;
  this.Fact_ID = codigo;
  this.Valor = "Agregar";
  this.Actualizar = ""
  });
 

}



validarTexto(event: KeyboardEvent) {

  if (!/^[a-zA-Z\s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
      event.preventDefault();
  }
}

 
}

