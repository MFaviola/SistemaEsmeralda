import { Component, OnInit } from '@angular/core';
import { YService } from '../Impresion/impresion.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { BASE_URL } from 'src/app/Service/ulrsettings';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
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
@Component({
  templateUrl: './caja.component.html',
  providers: [YService,DatePipe,CookieService]
})

export class CajaComponent implements OnInit  {
  dateDay = new Date();
  conversion: string;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
  fechaInicio: string;
  fechaFinal: string;
  CajaDetalle!:CajaDetalle[];
  controllerInicio: string;
  controllerFinal: string;
  Sucu_Id: string = this.cookie.get('SucursalID');
pdfSrc: SafeResourceUrl | null = null;
  constructor(private service: ServiceService,private yService: YService, private sanitizer: DomSanitizer,private datePipe: DatePipe, private cookie: CookieService) { }

  ngOnInit(): void {
	this.fechaInicio = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd');
	this.service.GetReporteCaja(this.fechaInicio,this.Sucu_Id).subscribe((data: any)=>{

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
	},error=>{
	  console.log(error);
	});
  }

  onFechaInicioChange(event: any) {
	this.controllerInicio = event
    this.fechaInicio = this.datePipe.transform(event, 'yyyy-MM-dd');
	this.service.GetReporteCaja(this.fechaInicio,this.Sucu_Id).subscribe((data: any)=>{

		this.CajaDetalle = data;
		console.log(data);

	
	
		const total = data.reduce((sum, item) => {
		  const itemTotal = parseFloat(item.total) || 0; 
		  return sum + itemTotal;
			  }, 0);
				 
	
	
		const totales = total.toFixed(2);

		const usuario = this.cookie.get('Empleado');
		const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
		const img = "assets/demo/images/galleria/Esmeraldas.png";

		console.log("Se muestra xd");
	},error=>{
	  console.log(error);
	});
  }


}
@NgModule({
	imports: [

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
		InputGroupModule
	],
	declarations: [CajaComponent]
})
export class CajaComponenteModule { }