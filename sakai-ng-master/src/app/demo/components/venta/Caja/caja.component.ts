import { Component, OnInit } from '@angular/core';
import { YService } from '../Impresion/impresion.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { BASE_URL } from 'src/app/Service/ulrsettings';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ToastModule } from 'primeng/toast';
import { DialogModule } from 'primeng/dialog';
import { FormControl, FormGroup, FormsModule, Validators } from '@angular/forms';
import { AutoCompleteModule } from "primeng/autocomplete";
import { CalendarModule } from "primeng/calendar";
import { ChipsModule } from "primeng/chips";
import { ChipModule } from "primeng/chip";
import { DropdownModule } from "primeng/dropdown";
import { InputMaskModule } from "primeng/inputmask";
import { InputNumberModule } from "primeng/inputnumber";
import { CascadeSelectModule } from "primeng/cascadeselect";
import { MultiSelectModule } from "primeng/multiselect";
import { InputTextareaModule } from "primeng/inputtextarea";
import { InputTextModule } from "primeng/inputtext";
import { RatingModule } from 'primeng/rating';
import { KnobModule } from 'primeng/knob';
import { ListboxModule } from 'primeng/listbox';
import { SelectButtonModule } from 'primeng/selectbutton';
import { CheckboxModule } from 'primeng/checkbox';
import { ButtonModule } from 'primeng/button';
import { InputSwitchModule } from 'primeng/inputswitch';
import { RadioButtonModule } from 'primeng/radiobutton';
import { ColorPickerModule } from 'primeng/colorpicker';
import { ToggleButtonModule } from 'primeng/togglebutton';
import { SliderModule } from 'primeng/slider';
import { InputGroupAddonModule } from 'primeng/inputgroupaddon';
import { InputGroupModule } from 'primeng/inputgroup';
import { ServiceService } from 'src/app/Service/Factura.service';
import { DatePipe } from '@angular/common';
import { CajaDetalle, FacturaDetalle } from 'src/app/Models/FacturaViewModel';
import { CookieService } from 'ngx-cookie-service';
import { C } from '@fullcalendar/core/internal-common';
import { dropSucursal } from 'src/app/Models/SucursalViewModel';
import { MessageService, SelectItem } from 'primeng/api';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { CajaEnviar } from 'src/app/Models/DashboardViewModel';
@Component({
  templateUrl: './caja.component.html',
  providers: [YService,DatePipe,CookieService,MessageService]
})

export class CajaComponent implements OnInit  {

viewModel2: CajaEnviar = new CajaEnviar();
PagoForm: FormGroup;
  dateDay = new Date();
  conversion: string;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
  fechaInicio: string;
  fechaFinal: string;
  CajaDetalle!:CajaDetalle[];
  controllerInicio: string;
  Usua_Id: string = this.cookie.get('ID_Usuario');
  meses: SelectItem[] = [];
  controllerFinal: string;
  Sucu_Id: string = this.cookie.get('SucursalID');
pdfSrc: SafeResourceUrl | null = null;
SelectedMes: any= this.cookie.get('SucursalID');
sucursales: any[] = [];
Collapse: boolean = false;
Editar: boolean = false;
CajaForm: FormGroup;
Cerrar: boolean = false;
Reportes:  boolean = false;
Reportes2:  boolean = false;
ConfirmarPago: boolean = false;
subirCaja: boolean = false;
AbrirCaja: boolean = false;
  constructor(private messageService: MessageService,private service: ServiceService,private yService: YService, private sanitizer: DomSanitizer,private datePipe: DatePipe, private cookie: CookieService) { }

  ngOnInit(): void {

	this.service.getDropDownsSucursales().subscribe((data: dropSucursal[]) => {
	
		
	
		this.sucursales = data.map(sucursal => ({
		  value: sucursal.value.toString(), 
		  label: sucursal.text 
		}));
		this.meses = this.sucursales; 
	  });

	this.fechaInicio = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd');
	this.service.GetReporteCaja(this.fechaInicio,this.Sucu_Id).subscribe((data: any)=>{
	if (data.length > 0) {
		this.Collapse = false;
		this.Editar = true;

		this.Reportes2 = false;
		this.Cerrar = true;
		this.Reportes = true;
		this.CajaDetalle = data;
		console.log(data)

	
	
		const total = data.reduce((sum, item) => {
		  const itemTotal = parseFloat(item.total) || 0; 
		  return sum + itemTotal;
			  }, 0);
				 
		const MontoInicial =data[0].caja_MontoFinal.toString()
		const MontoFinal = data[0].caja_MontoFinal.toString()
		const Ganancias = data[0].caja_MontoSistema.toString()
		const Apertura =data[0].apertura.toString()
		const Cierre =data[0].cierre.toString()
		const FechaApertura =  this.datePipe.transform(data[0].caja_FechaApertura.toString(), 'yyyy-MM-dd')
		const FechaCiere =  this.datePipe.transform(data[0].caja_FechaCierre.toString(), 'yyyy-MM-dd')
		const Sucursal =  data[0].sucu_Nombre.toString()
		console.log(this.CajaDetalle[0].caja_MontoSistema)



		const usuario = this.cookie.get('Empleado');
		const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
		const img = "assets/demo/images/galleria/Esmeraldas.png";
		const blob = this.yService.ReportesCaja(img,usuario,fechaC,MontoInicial,MontoFinal,Ganancias,Apertura,FechaApertura,Cierre,FechaCiere,Sucursal);
		const url = URL.createObjectURL(blob);
		this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
		console.log("Se muestra xd");
		
		} else {
			this.Collapse = true;
			this.Editar = false;
			this.Reportes2 = false;
			this.Cerrar = false;
			this.Reportes = true;
		}
		
	},error=>{
	  console.log(error);
	});
  }

  onSubmitCaja() {
	if (this.CajaForm.valid) {
	   this.viewModel2 = this.CajaForm.value;
	   this.viewModel2.caja_UsuarioApertura = this.Usua_Id;
	   this.viewModel2.Sucu_Id = this.Sucu_Id;
	   this.service.EnviarAbierto(this.viewModel2).subscribe((data: MensajeViewModel[]) => {
		if(data["message"] == "Operación completada exitosamente."){
			this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Caja abierta', life: 3000 });
			this.Collapse = false;
			this.Editar = true;
			this.Reportes2 = true;
			this.Cerrar = true;
			this.Reportes = true;
			this.AbrirCaja  = false;
		
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
	AbrirModal(
	  ){this.AbrirCaja = true
	  }
  onFechaInicioChange(event: any) {
	this.controllerInicio = event

    this.fechaInicio = this.datePipe.transform(event, 'yyyy-MM-dd');
	this.service.GetReporteCaja(this.fechaInicio,this.Sucu_Id).subscribe((data: any)=>{
			this.Collapse = true;
		if (data.length > 0) {
			this.Collapse = false;
			this.CajaDetalle = data;
			console.log(data)
	
		
		
			const total = data.reduce((sum, item) => {
			  const itemTotal = parseFloat(item.total) || 0; 
			  return sum + itemTotal;
				  }, 0);
					 
			const MontoInicial =data[0].caja_MontoFinal.toString()
			const MontoFinal = data[0].caja_MontoFinal.toString()
			const Ganancias = data[0].caja_MontoSistema.toString()
			const Apertura =data[0].apertura.toString()
			const Cierre =data[0].cierre.toString()
			const FechaApertura =  this.datePipe.transform(data[0].caja_FechaApertura.toString(), 'yyyy-MM-dd')
			const FechaCiere =  this.datePipe.transform(data[0].caja_FechaCierre.toString(), 'yyyy-MM-dd')
			const Sucursal =  data[0].sucu_Nombre.toString()
			console.log(this.CajaDetalle[0].caja_MontoSistema)
	
	
	
			const usuario = this.cookie.get('Empleado');
			const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
			const img = "assets/demo/images/galleria/Esmeraldas.png";
			const blob = this.yService.ReportesCaja(img,usuario,fechaC,MontoInicial,MontoFinal,Ganancias,Apertura,FechaApertura,Cierre,FechaCiere,Sucursal);
			const url = URL.createObjectURL(blob);
			this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
			console.log("Se muestra xd");
			
			} else {
			console.log("ENTRO AQUIII");
			this.Collapse = true;
			}
	},error=>{
	  console.log(error);
	});
  }
  onselectMes(event){
console.log(event.value);
  this.Sucu_Id = event.value;
  this.service.GetReporteCaja(this.fechaInicio,this.Sucu_Id).subscribe((data: any)=>{

	if (data.length > 0) {
		this.CajaDetalle = data;
		console.log(data)

	
	
		const total = data.reduce((sum, item) => {
		  const itemTotal = parseFloat(item.total) || 0; 
		  return sum + itemTotal;
			  }, 0);
				 
		const MontoInicial =data[0].caja_MontoFinal.toString()
		const MontoFinal = data[0].caja_MontoFinal.toString()
		const Ganancias = data[0].caja_MontoSistema.toString()
		const Apertura =data[0].apertura.toString()
		const Cierre =data[0].cierre.toString()
		const FechaApertura =  this.datePipe.transform(data[0].caja_FechaApertura.toString(), 'yyyy-MM-dd')
		const FechaCiere =  this.datePipe.transform(data[0].caja_FechaCierre.toString(), 'yyyy-MM-dd')
		const Sucursal =  data[0].sucu_Nombre.toString()
		console.log(this.CajaDetalle[0].caja_MontoSistema)



		const usuario = this.cookie.get('Empleado');
		const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
		const img = "assets/demo/images/galleria/Esmeraldas.png";
		const blob = this.yService.ReportesCaja(img,usuario,fechaC,MontoInicial,MontoFinal,Ganancias,Apertura,FechaApertura,Cierre,FechaCiere,Sucursal);
		const url = URL.createObjectURL(blob);
		this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
		console.log("Se muestra xd");
		
		} else {
		  
			
		}
},error=>{
  console.log(error);
});
  }
 
}
@NgModule({
	imports: [
		ToastModule,
		DialogModule,
		CommonModule,
		FormsModule,
		AutoCompleteModule,
		CalendarModule,
		ChipsModule,
		ChipModule,
		DropdownModule,
		InputMaskModule,
		InputNumberModule,
		CascadeSelectModule,
		MultiSelectModule,
		InputTextareaModule,
		InputTextModule,
		RatingModule,
		KnobModule,
		ListboxModule,
		SelectButtonModule,CheckboxModule,
		ButtonModule,InputSwitchModule,
		RadioButtonModule,
		ColorPickerModule,
		ToggleButtonModule,
		SliderModule,
		InputGroupAddonModule,
		InputGroupModule,
		FormsModule,
		ReactiveFormsModule
	],
	declarations: [CajaComponent]
})
export class CajaComponenteModule { }