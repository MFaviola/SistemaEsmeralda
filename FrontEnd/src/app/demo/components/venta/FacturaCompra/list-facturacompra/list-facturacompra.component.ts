import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Fill, FacturaCompraEncabezado, CrearFacturaCompraEncabezado, FacturaCompraDetalleTabla } from 'src/app/Models/FacturaCompraViewModel';
import { FacturaCompraService } from 'src/app/Service/factura-compra.service'; 
import { YService } from '../../Impresion/impresion.service';
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
@Component({
  selector: 'app-list-facturacompra',
  templateUrl: './list-facturacompra.component.html',
  styleUrl: './list-facturacompra.component.css',
  providers: [ConfirmationService,CookieService,DatePipe, MessageService]
})
export class ListFacturacompraComponent {
 
 //#region variables
  Factura!:FacturaCompraEncabezado[];
  FacturaDetalle?: FacturaCompraDetalleTabla[];
  @ViewChild('fileUpload') fileUpload: FileUpload;
  viewModel: FacturaCompraEncabezado = new FacturaCompraEncabezado();
  viewModelenviar: CrearFacturaCompraEncabezado = new CrearFacturaCompraEncabezado();
  viewModelMaquillaje: MaquillajeEnviar = new MaquillajeEnviar();
  MensajeViewModel!: MensajeViewModel[];
  viewModelJoya: JoyaEnviar = new JoyaEnviar();
  selectedMetodo: string = '4';

  routeItems: MenuItem[] = [];
  submitted: boolean = false;
  loading: boolean = false;
  departamentos: any[] = [];
  fill: any[] = [];
  FacturaForm: FormGroup;
  // DetalleForm: FormGroup;
  MaquillajeForm: FormGroup;


  //Region Fecha
  dateDay = new Date();
  conversion: string;


  //Variable para manejar el estado de Actualizar
  Actualizar: string = "";


  //Almacenado del usuario
  Usuario: string = this.cookie.get('Usuario');
  Usua_Id: string = this.cookie.get('ID_Usuario');


  @ViewChild('filter') filter!: ElementRef;

  pdfSrc: SafeResourceUrl | null = null;
  Collapse: boolean = false;
  Reporte_2 : boolean = false;
  CollapseMaquillaje: boolean = false;
  CollapseJoyas: boolean = false;
  DataTable: boolean = true;
  Tabla: boolean = false;
  Detalles: boolean = false;
  Agregar: boolean = true;
  MunCodigo: boolean = true;
  Valor: string = "";
  staticData = [{}];
  FormularioJoya: boolean = false;
  MaquiJoyabtn: boolean = false;
  FormularioMaquillaje: boolean = false;
  deleteProductDialog: boolean = false;
  //Detalle
  id: string="";
  UsuarioCreacion: String = "";
  UsuarioModificacion: String = "";
  FechaCreacion: String = "";
  FechaModificacion: String = "";
  ID: String = "";
  facura_impresa: any = null;
  Joya!:Joya[];
  proveedor: any[] = [];
  material: any[] = [];
  categoria: any[] = [];
  marca: any[] = [];
  selectedRadio: string = '1'; 

  JoyaForm: FormGroup;
  faCE_Id: string = "0";


  //AUTOCOMPLETADO
  detalleForm: FormGroup;
  metodos: any[] = [];
  joyas: any[] = [];
  maquillajes: any[] = [];
  sucursales: any[] = [];
  countries: any[] = [];
  selectedCountryAdvanced: any[] = [];
  selectedProductosAdvanced: any[] = [];
  selectedProveedoresAdvanced: any[] = [];
  selectedSucursalesAdvanced: any[] = [];
  selectedMetodoPagoAdvanced: any[] = [];
  filteredMetodoPago: any[] = [];
  filteredCountries: any[] = [];
  filteredProveedores: any[] = [];
  filteredSucursales: any[] = [];
  //#endregion
 
  constructor(private service: FacturaCompraService, private router: Router, private srvImprecion : YService, private messageService: MessageService,private fb: FormBuilder, private sservice: ServiceService, private maquillajeservice: MaquillajeService, private joyaService : JoyaService, private yService: YService, private sanitizer: DomSanitizer,private cookie: CookieService, private datePipe: DatePipe) { }


  ngOnInit(): void {
    
    this.service.getFacturaCompra().subscribe((data: any)=>{
      console.log(data);
      this.Factura = data;
    },error=>{
      console.log(error);
    });
    
    this.FacturaForm = new FormGroup({
      mepa_Id: new FormControl('7', Validators.required),
      prov_Id: new FormControl('0', Validators.required),
      nombreProveedor: new FormControl("", [Validators.required]),
      sucu_Id: new FormControl('0', Validators.required),
      sucu_Nombre: new FormControl('', Validators.required),

      //detalle
      radio: new FormControl("1",Validators.required),
      faCD_Dif: new FormControl("1",Validators.required),
      // prod_Producto: new FormControl("", Validators.required),
      nombreProducto: new FormControl("", Validators.required),
      faCD_Cantidad: new FormControl("", [Validators.required]),
      precioCompra: new FormControl("", [Validators.required]),
      precioVenta: new FormControl("", [Validators.required]),
      precioMayor: new FormControl("", [Validators.required]),

    });

    this.MaquillajeForm = new FormGroup({
      Maqu_Nombre: new FormControl("",Validators.required),
      Maqu_PrecioCompra: new FormControl(null, Validators.required),
      Maqu_PrecioVenta: new FormControl(null, [Validators.required]),
      Maqu_PrecioMayor: new FormControl(null, [Validators.required]),
      Maqu_Stock: new FormControl("", [Validators.required]),
      Maqu_Imagen: new FormControl("", [Validators.required]),
      Prov_Id: new FormControl('0', [Validators.required]),
      Marc_Id: new FormControl('0', [Validators.required]),
    });

    this.JoyaForm = new FormGroup({
      Joya_Nombre: new FormControl("",Validators.required),
      Joya_PrecioCompra: new FormControl(null, Validators.required),
      Joya_PrecioVenta: new FormControl(null, [Validators.required]),
      Joya_PrecioMayor: new FormControl(null, [Validators.required]),
      Joya_Stock: new FormControl("", [Validators.required]),
      Joya_Imagen: new FormControl("", [Validators.required]),
      Prov_Id: new FormControl('0', [Validators.required]),
      Mate_Id: new FormControl('0', [Validators.required]),
      Cate_Id: new FormControl('0', [Validators.required]),
    });

    
    //#region ddls
    this.sservice.getDropDownMaterial().subscribe((data: dropMaterial[]) => {
      this.material = data;
    });

    this.sservice.getDropDownCategoria().subscribe((data: dropCategoria[]) => {
      this.categoria = data;
    });
    this.maquillajeservice.getDropDownsMarcas().subscribe((data: dropMarca[]) => {
      this.marca = data;
    });
    
    //#endregion

    //#region AUTOCOMPLETADO
    this.service.getAutoCompletadoJoya().subscribe(countries => {
      this.countries = countries;
    });

    this.service.getAutoCompletadoProveedor().subscribe(proveedo => {
      this.proveedor = proveedo;
    });

    this.service.getMetodo().subscribe(meto => {
      this.metodos = meto;
    });

    this.service.getAutoCompletadoJoya().subscribe(joya => {
      this.countries = joya;
    });

    this.service.getAutoCompletadoMaquillaje().subscribe(maqu => {
      this.maquillajes = maqu;
    });

    this.service.getAutoCompletadoSucursal().subscribe(sucu => {
      this.sucursales = sucu;
    });
    //#endregion
 } 

  onRadioChange(event: Event) {
    const target = event.target as HTMLInputElement;
    const value = target.value;
    this.selectedRadio = target.value;

    if (value === "1") {
      this.service.getAutoCompletadoJoya().subscribe(countries => {
        this.countries = countries;
        this.FacturaForm.get('faCD_Dif').setValue(value); 
        this.FacturaForm.get('nombreProducto').setValue(""); 
        this.MaquiJoyabtn = false;
    });
  } else {
      this.service.getAutoCompletadoMaquillaje().subscribe(countries => {
        this.countries = countries;
        this.FacturaForm.get('faCD_Dif').setValue(value); 
        this.FacturaForm.get('nombreProducto').setValue(""); 
        this.MaquiJoyabtn = true;
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

  //#region filtros
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

  filterProveedor(event: any) {
    const filtered: any[] = [];
    const query = event.query;
    for (let i = 0; i < this.proveedor.length; i++) {
        const proveedor = this.proveedor[i];
        
        if (proveedor.prov_Proveedor.toLowerCase().indexOf(query.toLowerCase()) == 0) {
            filtered.push(proveedor);
        }
    }

    this.filteredProveedores = filtered;
  }

  filterSucursal(event: any) {
    const filtered: any[] = [];
    const query = event.query;
    for (let i = 0; i < this.sucursales.length; i++) {
        const sucursal = this.sucursales[i];
        
        if (sucursal.sucu_Nombre.toLowerCase().indexOf(query.toLowerCase()) == 0) {
            filtered.push(sucursal);
        }
    }

    this.filteredSucursales = filtered;
  }

  //#endregion
  
  //#region  selects
  
  selectMetodoPago(metodo: string) {
    this.selectedMetodo = metodo;
    this.FacturaForm.controls['mepa_Id'].setValue(metodo);
  }
  
  SeleccionAgregar(){
    if (this.selectedRadio == "1") {
      this.Onjoya();
    }else{
      this.Onmaquillaje();
    }
   
  }

  onSelectProduct(event) {
    this.FacturaForm.get('nombreProducto').setValue(event.value.text); 
  }

  handleKeyDown(event: KeyboardEvent) {
    if (event.key === "Enter" || event.key === "Tab") {
        event.preventDefault();
        console.log("entra");
        this.onSubmit(); 
    
    }
  }

  onSelectProveedor(event) {

    this.FacturaForm.get('prov_Id').setValue(event.value.prov_Id);
    this.JoyaForm.get('Prov_Id').setValue(event.value.prov_Id);
    this.MaquillajeForm.get('Prov_Id').setValue(event.value.prov_Id);

  }

  onSelectSucursal(event) {

    this.FacturaForm.get('sucu_Id').setValue(event.value.sucu_Id);

  }
  onSelectMetodo(event) {

    this.FacturaForm.get('mepa_Id').setValue(event.value.mepa_Id); 

  }
  //#endregion

  subir() {
    if (this.FacturaForm.valid) {
      // Procesa los datos del formulario aquí
      console.log('Formulario enviado:', this.FacturaForm.value);
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

  //#region Acciones de cancelar
  cancelar(){
    this.Actualizar = "Actualizar"
    this.FacturaForm.get('precioMayor').setValue("1")
    this.FacturaForm.get('faCD_Dif').setValue("1")
    this.FacturaForm.get('precioVenta').setValue("1")
    this.FacturaForm.get('precioCompra').setValue("1")
    this.FacturaForm.get('faCD_Cantidad').setValue("1")
    this.FacturaForm.get('nombreProducto').setValue("a")
    this.FacturaForm.get('radio').setValue("1")
    this.onSubmit();
    this.Collapse= false;
    this.DataTable = true;
    this.Detalles = false;
    this.ngOnInit();
    this.submitted = false;
    this.Agregar= true;
    this.MunCodigo=true;
    this.Valor = "";
    this.faCE_Id = "0";
    this.Actualizar = "";
    console.log("El actualizar es" + this.Actualizar );
  }

  Confirmar(){
    this.Actualizar = "Confirmar"
    this.FacturaForm.get('precioMayor').setValue("1")
    this.FacturaForm.get('faCD_Dif').setValue("1")
    this.FacturaForm.get('precioVenta').setValue("1")
    this.FacturaForm.get('precioCompra').setValue("1")
    this.FacturaForm.get('faCD_Cantidad').setValue("1")
    this.FacturaForm.get('nombreProducto').setValue("xD")
    this.FacturaForm.get('radio').setValue("1")
    this.onSubmit();

  }
  cancelarJM(){
    this.FormularioJoya = false;
    this.Detalles = true;

  }
  cancelarMQ(){
    this.FormularioMaquillaje = false;
    this.Detalles = true;

  }

  //#endregion

  //#region validaciones inputs
  validarTexto(event: KeyboardEvent) {
    if (!/^[a-zñA-ZÑ\s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
        event.preventDefault();
    }
  }
  ValidarNumeros(event: KeyboardEvent) {
    if (!/[0-9]/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab') {
        event.preventDefault();
    }
  }
//#endregion


  //FacturaEncabezado
  onSubmit() {
    console.log("Esto es el OnSubmit")

    console.log(this.FacturaForm.valid)
    if (this.FacturaForm.valid) {
      this.viewModelenviar = this.FacturaForm.value;
     this.viewModelenviar.faCE_Id = this.faCE_Id;
     this.viewModelenviar.Actualizar = this.Actualizar;
     this.viewModelenviar.Usua_Id = this.Usua_Id;
     if (this.Valor == "Agregar") {
      if (this.Actualizar == "Actualizar") {
        console.log(this.FacturaForm);
        this.service.insertarFacturaCom(this.viewModelenviar).subscribe((data: MensajeViewModel[]) => {
       
      })
      }else if(this.Actualizar == "Confirmar"){
        console.log(this.FacturaForm);
        this.service.insertarFacturaCom(this.viewModelenviar).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "La accion ha sido existosa"){
            this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Confirmado con Exito', life: 3000 });
            this.Collapse= false;
            this.DataTable = true;
            this.Detalles = false;
            this.Valor = "";
            this.faCE_Id = "0";
            this.Actualizar = "";
            this.ngOnInit();
            this.submitted = false;
            this.Agregar= true;
            this.MunCodigo=true;
            console.log("El actualizar es" + this.Actualizar );
          }
        })
      }else{
      this.service.insertarFacturaCom(this.viewModelenviar).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
          this.faCE_Id = data["id"];

              this.service.tabladetalle(this.faCE_Id).subscribe((data: any)=>{
                this.FacturaDetalle = data;
                console.log(this.FacturaDetalle);
              },error=>{
                console.log(error);
              });
          }else{
          this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
          this.faCE_Id = data["id"];
          console.log("error1")
          }
          
      })
    }
    } 
    }   
    else 
    {
      console.log("Error en el porque el formgroup no es valido");
      console.log(this.FacturaForm);
      this.submitted = true;
    }
  }

  //Joya
  OnSubmitJoya() {
    if (this.JoyaForm.valid && this.JoyaForm.get('Cate_Id').value !== '0' && this.JoyaForm.get('Mate_Id').value !== '0'&& this.JoyaForm.get('Prov_Id').value !== '0') {
       this.viewModel = this.JoyaForm.value;
       if (this.Valor == "Agregar") {
        this.joyaService.EnviarJoyas(this.viewModel).subscribe((data: MensajeViewModel[]) => {
            if(data["message"] == "Operación completada exitosamente."){
            this.ngOnInit();
             this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
             this.FormularioJoya = false;
             this.Detalles = true;
             this.fileUpload.clear();
              this.submitted = false;

            }else{
             this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
            }
            
         })
       } else {
            this.viewModelJoya.Joya_Id = this.ID
            this.joyaService.ActualizarJoyas(this.viewModel).subscribe((data: MensajeViewModel[]) => {
            if(data["message"] == "Operación completada exitosamente."){
              this.ngOnInit();
             this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
             this.Detalles = false;
             this.FormularioJoya = true;
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

  //Maquillaje
  onSubmitMaquillaje() {
    if ( this.MaquillajeForm.get('Marc_Id').value !== '0') {
       this.viewModelMaquillaje = this.MaquillajeForm.value;
       console.log("entra aqui");
       if (this.Valor == "Agregar") {
        this.maquillajeservice.EnviarMaquillaje(this.viewModelMaquillaje).subscribe((data: MensajeViewModel[]) => {
       if(data["message"] == "Operación completada exitosamente."){
       console.log("no entra aqui");
       this.ngOnInit();
             this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
             this.FormularioMaquillaje = false;
             this.Detalles = true;
              this.submitted = false;
              this.fileUpload.clear();
            }else{
             this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
            }
            
         })
       } else {
       console.log("entra aqui");
       this.viewModelMaquillaje.Maqu_Id = this.ID
            this.maquillajeservice.ActualizarMaquillaje(this.viewModelMaquillaje).subscribe((data: MensajeViewModel[]) => {
            if(data["message"] == "Operación completada exitosamente."){
              this.ngOnInit();
             this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
             this.Collapse= false;
             this.DataTable = true;
             this.Detalles = false;
             this.submitted = false;
             this.Agregar= true;
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

  //#region collaps
  collapse(){
    this.FormularioJoya=false;
    this.FormularioMaquillaje=false;
    this.Collapse= true;
    this.DataTable = false;
    this.faCE_Id = "0"
    this.service.tabladetalle(this.faCE_Id).subscribe((data: any)=>{
      this.FacturaDetalle = data;
      console.log(this.FacturaDetalle);
    },error=>{
      console.log(error);
    })
    this.Valor = "Agregar";
    this.Agregar= false;
    this.Detalles = true;
    this.Tabla = false;
  }
  Onjoya(){
    this.Detalles = false;
    this.FormularioJoya = true;
    this.FormularioMaquillaje = false;
  }
  Onmaquillaje(){

    this.FormularioJoya = false;
    this.Detalles = false;
    this.FormularioMaquillaje = true;
  }

  //#endregion

  Fill(codigo) {
    this.service.fillenca1(codigo).subscribe({
      next: (data: CrearFacturaCompraEncabezado) => {
        console.log(data);
      this.submitted = false;
      this.FacturaForm = new FormGroup({
          mepa_Id: new FormControl(data[0].mepa_Id,Validators.required),
          prov_Id: new FormControl(data[0].prov_Id, [Validators.required]),
          sucu_Id: new FormControl(data[0].sucu_Id, [Validators.required]),
          sucu_Nombre: new FormControl(data[0].sucu_Nombre, [Validators.required]),    
          nombreProveedor: new FormControl(data[0].nombreProveedor, [Validators.required]),
          radio: new FormControl("0", [Validators.required]),
          faCD_Dif: new FormControl("0", [Validators.required]),
          nombreProducto: new FormControl("", [Validators.required]),
          faCD_Cantidad: new FormControl("", [Validators.required]),
          precioCompra: new FormControl("", [Validators.required]),
          precioVenta: new FormControl("", [Validators.required]),
          precioMayor: new FormControl("", [Validators.required]),
        });
        console.log(this.FacturaForm);
      }
    });

    this.service.tabladetalle(codigo).subscribe((data: any)=>{
      this.FacturaDetalle = data;
      console.log(this.FacturaDetalle);
    },error=>{
      console.log(error);
    });

  this.DataTable = false;
  this.Collapse = true;
  this.Agregar = false;
  this.faCE_Id = codigo;
  this.submitted = false;
  this.Valor = "Agregar";
  this.Detalles = true;

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

  confirmDelete(id) {
    this.service.eliminarFacturaDetalle(id).subscribe({
      next: (response) => {
        console.log(response.code);
        if(response.code == 200){
                this.service.tabladetalle(this.faCE_Id).subscribe((data: any)=>{
                  this.FacturaDetalle = data;
                  console.log("Elimina");
                },error=>{
                  console.log(error);
                });  
             }else{
              this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro eliminar', life: 3000 });
             }
          this.submitted = false;
      },
  });
  }
  
  detalles(codigo) {
  const detalles$ = this.service.tabladetalle(codigo);
  const fill$ = this.service.fillenca1(codigo);

  forkJoin([detalles$, fill$]).subscribe({
    next: ([detallesData, fillData]) => {
      // Procesar detalles de factura
      const cuerpo = detallesData.map(item => [
        item.faCD_Id.toString(),
        item.producto.toString(),
        item.cantidad.toString(),
        item.categoria.toString(),
        item.precio_Venta.toString(),
        item.precioVenta.toString(),
        item.precioMayorista.toString(),
        item.total.toString()
      ]);


      // Procesar datos de cliente
      const Fecha = fillData[0].faCE_fechafinalizacion;
      const Factura = fillData[0].faCE_Id;
      const Metodo = fillData[0].mepa_Metodo;
      const Proveedor = fillData[0].nombreProveedor;

      // Preparar para generar PDF
      const img = "assets/demo/images/galleria/Esmeraldas.png";
      const blob = this.yService.ReporteFacturaCompraPDF(cuerpo, img,Fecha, Factura, Proveedor, Metodo);
      const url = URL.createObjectURL(blob);
      this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
      
      // Actualización del estado de la interfaz de usuario
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

}