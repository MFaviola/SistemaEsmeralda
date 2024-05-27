import { Component, OnInit } from '@angular/core';
import { YService } from '../../venta/Impresion/impresion.service';
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
import { FacturaDetalle } from 'src/app/Models/FacturaViewModel';
import { DatePipe } from '@angular/common';
import { CookieService } from 'ngx-cookie-service';
@Component({
  templateUrl: './reporteportop10.component.html',
  providers: [YService,DatePipe,CookieService]
})

export class reportepormesComponent implements OnInit  {
fechaInicio: string;
fechaFinal: string;
dateDay = new Date();
conversion: string;
controllerInicio: string;
controllerFinal: string;
  pdfSrc: SafeResourceUrl | null = null;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
  value= new Date();
  today_date: String;
  Factura!:FacturaDetalle[];
  calendarDate: Date;
  constructor(private cookie:CookieService,private service: ServiceService,private yService: YService, private sanitizer: DomSanitizer,private datePipe: DatePipe) { }

  ngOnInit(): void {
   

  }

  onFechaInicioChange(event: any) {
	this.controllerInicio = event
    this.fechaInicio = this.datePipe.transform(event, 'yyyy-MM-dd');
	this.service.GetReporteTop10(this.fechaInicio,this.fechaFinal).subscribe((data: any)=>{

		this.Factura = data;
		console.log(data);
		const cuerpo = this.Factura.map(item => [
		  item.categoria.toString(),
		  item.producto.toString(),
		  item.cantidad.toString(),
		  item.precio_Unitario.toString(),
		  item.total.toString(),
		]);
	
	
		const total = data.reduce((sum, item) => {
		  const itemTotal = parseFloat(item.total) || 0; 
		  return sum + itemTotal;
			  }, 0);
				 
	
	
		const totales = total.toFixed(2);
		const Inicio = this.fechaInicio;
		const Final = this.fechaFinal;
		const usuario = this.cookie.get('Empleado');
		const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
		const img = "assets/demo/images/galleria/Esmeraldas.png";
		const blob = this.yService.ReportesTop10(cuerpo, img,Inicio,Final,totales,usuario,fechaC);
		const url = URL.createObjectURL(blob);
		this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
		console.log("Se muestra xd");
	},error=>{
	  console.log(error);
	});
  }

  onFechaFinalChange(event: any) {
	this.controllerFinal = event
	this.fechaFinal = this.datePipe.transform(event, 'yyyy-MM-dd');
	this.service.GetReporteTop10(this.fechaInicio,this.fechaFinal).subscribe((data: any)=>{

		this.Factura = data;
		console.log(data);
		const cuerpo = this.Factura.map(item => [
		  item.categoria.toString(),
		  item.producto.toString(),
		  item.cantidad.toString(),
		  item.precio_Unitario.toString(),
		  item.total.toString(),
		]);
	
	
		const total = data.reduce((sum, item) => {
		  const itemTotal = parseFloat(item.total) || 0; 
		  return sum + itemTotal;
			  }, 0);
				 
	
	
		const totales = total.toFixed(2);
		const Inicio = this.fechaInicio;
		const Final = this.fechaFinal;
		const usuario = this.cookie.get('Empleado');
		const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
		const img = "assets/demo/images/galleria/Esmeraldas.png";
		const blob = this.yService.ReportesTop10(cuerpo, img,Inicio,Final,totales,usuario,fechaC);
		const url = URL.createObjectURL(blob);
		this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
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
	declarations: [reportepormesComponent]
})
export class ReportePorTop10DemoModule { }