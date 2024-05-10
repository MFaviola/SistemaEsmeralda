import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { FacturaCompraEncabezado, FacturaCompraDetalle } from 'src/app/Models/FacturaCompraViewModel';
import { FacturaCompraService } from 'src/app/Service/factura-compra.service'; 
import { YService } from '../../Impresion/impresion.service';
import { Cliente } from 'src/app/Models/ClienteViewModel';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { MegaMenuItem, MenuItem } from 'primeng/api';
import { FormGroup, FormControl,  Validators, FormBuilder  } from '@angular/forms';
import { CountryService } from 'src/app/demo/service/country.service';
import { ServiceService } from 'src/app/Service/Joya.service';

@Component({
  selector: 'app-list-facturacompra',
  templateUrl: './list-facturacompra.component.html',
  styleUrl: './list-facturacompra.component.scss',
  providers: [ConfirmationService, MessageService]
})
export class ListFacturacompraComponent {
  Factura!:FacturaCompraEncabezado[];

  routeItems: MenuItem[] = [];
  MensajeViewModel!: MensajeViewModel[];
  submitted: boolean = false;
  loading: boolean = false;
  departamentos: any[] = [];
  fill: any[] = [];
  viewModel: FacturaCompraEncabezado = new FacturaCompraEncabezado();
  FacturaForm: FormGroup;
  DetalleForm: FormGroup;
  @ViewChild('filter') filter!: ElementRef;

  Collapse: boolean = false;
  CollapseMaquillaje: boolean = false;
  CollapseJoyas: boolean = false;
  DataTable: boolean = true;
  Tabla: boolean = false;
  Detalles: boolean = false;
  Agregar: boolean = true;
  MunCodigo: boolean = true;
  Valor: string = "";
  staticData = [{}];

  deleteProductDialog: boolean = false;
  //Detalle
  id: string="";
  UsuarioCreacion: String = "";
  UsuarioModificacion: String = "";
  FechaCreacion: String = "";
  FechaModificacion: String = "";
  ID: String = "";
  facura_impresa: any = null;

  selectedRadio: string = '1'; 

  material: any[] = [];
  JoyaForm: FormGroup;
  categoria: any[] = [];


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

  constructor(private service: FacturaCompraService, private router: Router, private srvImprecion : YService,
    private messageService: MessageService,private countryService: CountryService,private fb: FormBuilder, private sservice: ServiceService
  ) { }


  ngOnInit(): void {
    
    this.service.getFacturaCompra().subscribe((data: any)=>{
      console.log(data);
      this.Factura = data;
    },error=>{
      console.log(error);
    });
    
    this.FacturaForm = new FormGroup({
      Mepa_Metodo: new FormControl("", Validators.required),
      Mepa_Id: new FormControl("", Validators.required),
      Empl_Id: new FormControl("3", [Validators.required]),
      Clie_Id: new FormControl("1", [Validators.required]),
      Clie_DNI: new FormControl(""),
      Impu_Impuesto: new FormControl("15%",Validators.required),
      Clie_Nombre: new FormControl("Usuario Final", [Validators.required]),
      Empl_Nombre: new FormControl("Eduardo Varela", [Validators.required]),
    });

    this.DetalleForm = new FormGroup({
      radio: new FormControl("1",Validators.required),
      Faxd_Dif: new FormControl("1",Validators.required),
      Prod_Producto: new FormControl("", Validators.required),
      Prod_Id: new FormControl("", Validators.required),
      Faxd_Cantidad: new FormControl("", [Validators.required]),
      Fact_Id: new FormControl("",Validators.required),
    });


    //AUTOCOMPLETADO
    this.service.getAutoCompletadoJoya().subscribe(countries => {
      this.countries = countries;
    });
    this.service.getMetodo().subscribe(meto => {
      this.metodos = meto;
    });
 } 

  onRadioChange(event: Event) {
    const target = event.target as HTMLInputElement;
    const value = target.value;
    this.selectedRadio = target.value;

    if (value === "1") {
      this.service.getAutoCompletadoJoya().subscribe(countries => {
        this.countries = countries;
        this.DetalleForm = new FormGroup({
          Faxd_Dif: new FormControl(value,Validators.required),
          Prod_Producto: new FormControl("", Validators.required),
          Prod_Id: new FormControl("", Validators.required),
          Faxd_Cantidad: new FormControl("", [Validators.required]),
          Fact_Id: new FormControl("",Validators.required),
        });
      });
    } else {
      this.service.getAutoCompletadoMaquillaje().subscribe(countries => {
        this.countries = countries;
        this.DetalleForm = new FormGroup({
          Faxd_Dif: new FormControl(value,Validators.required),
          Prod_Producto: new FormControl("", Validators.required),
          Prod_Id: new FormControl("", Validators.required),
          Faxd_Cantidad: new FormControl("", [Validators.required]),
          Fact_Id: new FormControl("",Validators.required),
        });
      });
    }
  }

  onUpload(event) {
    const file: File = event.files[0];
    if (file) {
      const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
      const uniqueFileName = uniqueSuffix + '-' + file.name;

      this.JoyaForm.get('Joya_Imagen').setValue(uniqueFileName); 
      const formData: FormData = new FormData();

      formData.append('file', file, uniqueFileName);
      this.sservice.EnviarImagen(formData).subscribe(
        response => {
          console.log('Upload successful', response);
          if (response.message === "Exito") {
            this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Imagen Subida', life: 3000 });
          } else {
            this.messageService.add({ severity: 'success', summary: 'Error', detail: 'Suba una imagen', life: 3000 });
          }
        },
        error => {
          console.error('Error uploading image', error);
        }
      );
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
  
    this.DetalleForm.get('Faxd_Cantidad').setValue(1); 
    this.filteredCountries = filtered;
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

    this.DetalleForm.get('Prod_Id').setValue(event.value.value); 

  }

  onSelectCliente(event) {

    this.FacturaForm.get('Clie_Nombre').setValue(event.value.clie_Nombre); 

  }
  onSelectMetodo(event) {

    this.FacturaForm.get('Mepa_Id').setValue(event.value.mepa_Id); 

  }



  subir() {
    if (this.DetalleForm.valid) {
      // Procesa los datos del formulario aquí
      console.log('Formulario enviado:', this.DetalleForm.value);
    } else {
      console.log('Formulario no válido');
    }
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
    this.ngOnInit();
    this.submitted = false;
    this.Agregar= true;
    this.MunCodigo=true;
    this.Valor = "";
  }
  validarTexto(event: KeyboardEvent) {
    if (!/^[a-zA-Z\s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
        event.preventDefault();
    }
  }
  ValidarNumeros(event: KeyboardEvent) {
    if (!/[0-9]/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab') {
        event.preventDefault();
    }
  }
onSubmit() {
  if (this.FacturaForm.valid) {
   this.viewModel = this.FacturaForm.value;
   if (this.Valor == "Agregar") {
    this.service.insertarFacturaCom(this.viewModel).subscribe((data: MensajeViewModel[]) => {
        if(data["message"] == "Operación completada exitosamente."){
         this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
         this.Collapse= false;
         this.DataTable = true;
         this.submitted = false;
         this.Detalles = false;
         this.Agregar = true;
         this.ngOnInit();
 
        }else{
         this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
        }
        
     })
   } else {
        this.service.editarFacturaEnca(this.viewModel).subscribe((data: MensajeViewModel[]) => {
        if(data["message"] == "Operación completada exitosamente."){
         this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
         this.Collapse= false;
         this.DataTable = true;
         this.Detalles = false;
         this.submitted = false;
         this.Agregar = true;
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
  }
}
