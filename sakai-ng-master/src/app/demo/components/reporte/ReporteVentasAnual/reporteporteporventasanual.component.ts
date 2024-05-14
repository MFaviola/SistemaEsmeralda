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
import { SelectItem } from 'primeng/api';
import { ServiceService } from 'src/app/Service/Factura.service';
import { FacturaDetalle } from 'src/app/Models/FacturaViewModel';
@Component({
  templateUrl: './reporteporteporventasanual.component.html',
  providers: [YService]
})

export class reporteVentasAnual implements OnInit  {
  pdfSrc: SafeResourceUrl | null = null;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
  selectedDrop:any;
  cities: SelectItem[] = [];
  Factura!:FacturaDetalle[];
  constructor(private service: ServiceService,private yService: YService, private sanitizer: DomSanitizer) { }

  ngOnInit(): void {
	this.cities = [
		{ label: '2024', value: 2024 },
		{ label: '2023', value: 2023 },
		{ label: '2022', value: 2022 },
		{ label: '2021', value: 2021 },
		{ label: '2020', value: 2020 }
	];


  }

  onselectAno(event){

	this.service.GetReporteVentasAnual(event.value).subscribe((data: any)=>{

		this.Factura = data;
		console.log(data);
		const cuerpo = this.Factura.map(item => [
		  item.categoria.toString(),
		  item.producto.toString(),
		  item.cantidad.toString(),
		  item.precio_Unitario.toString(),
		  item.total.toString(),
		]);
		const cuerpoSinPrimerElemento = cuerpo.slice(1);
	
		const total = data.reduce((sum, item) => {
		  const itemTotal = parseFloat(item.total) || 0; 
		  return sum + itemTotal;
			  }, 0);
				 
	
	
			   const totales = total.toFixed(2);
	
		const Año = event.value
		const img = "assets/demo/images/galleria/Esmeraldas.png";
		const blob = this.yService.ReportesVentaAnual(cuerpo, img,Año,totales);
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
	declarations: [reporteVentasAnual]
})
export class ReportePorTop10DemoModule { }