import { Component, OnInit } from '@angular/core';
import { YService } from '../../venta/Impresion/impresion.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { BASE_URL } from 'src/app/Service/ulrsettings';
import { SelectItem } from 'primeng/api';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
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
import { FacturaDetalle, Years } from 'src/app/Models/FacturaViewModel';

@Component({
  templateUrl: './reportepormes.component.html',
  providers: [YService]
})

export class ReportesPormesComponent implements OnInit  {

  cities: SelectItem[] = [];
  meses: SelectItem[] = [];
  pdfSrc: SafeResourceUrl | null = null;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
  Fatura!:FacturaDetalle[];
  municipioForm: FormGroup;
  selectedYear: number;
  selectedDrop:any = 2024;
  SelectedMes: any= { id:5,name:'Enero'};
  mes: any = "Mayo"
  year: any = 2024
  constructor(private service: ServiceService,private yService: YService, private sanitizer: DomSanitizer) { }

  ngOnInit(): void {
	console.log(this.SelectedMes)
    this.cities = [
      { label: '2024', value: 2024 },
      { label: '2023', value: 2023 },
      { label: '2022', value: 2022 },
      { label: '2021', value: 2021 },
      { label: '2020', value: 2020 }
  ];

  this.meses = [
	{ label: 'Enero', value: { id: 1, name: 'Enero' } },
	{ label: 'Febrero',  value: { id: 2, name: 'Febrero' } },
	{ label: 'Marzo',  value: { id: 3, name: 'Marzo' } },
	{ label: 'Abril',  value: { id: 4, name: 'Abril' } },
	{ label: 'Mayo',  value: { id: 5, name: 'Mayo' } },
	{ label: 'Junio', value: { id: 6, name: 'Junio' } },
	{ label: 'Julio',  value: { id: 7, name: 'Julio' } },
	{ label: 'Agosto',  value: { id: 8, name: 'Agosto' } },
	{ label: 'Septiembre',  value: { id: 9, name: 'Septiembre' } },
	{ label: 'Octubre', value: { id: 10, name: 'Octubre' } },
	{ label: 'Noviembre', value: { id: 11, name: 'Noviembre' } },
	{ label: 'Diciembre',  value: { id: 12, name: 'Diciembre' } },


];


this.service.GetReportePorMes(2024,5).subscribe((data: any)=>{

	this.Fatura = data;
	console.log(data);
	const cuerpo = this.Fatura.map(item => [
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

	const Mes = this.mes;
	const img = "assets/demo/images/galleria/Esmeraldas.png";
	const blob = this.yService.ReportePorMes(cuerpoSinPrimerElemento, img,Mes,this.year,totales);
	const url = URL.createObjectURL(blob);
	this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
	console.log("Se muestra xd");
},error=>{
  console.log(error);
});
  }

  onselectAno(event){
	console.log(event.value);
	this.year = event.value
	this.service.GetReportePorMes(this.selectedDrop,this.SelectedMes.id).subscribe((data: any)=>{

		this.Fatura = data;
		console.log(data);
		const cuerpo = this.Fatura.map(item => [
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
	
		const Mes = this.mes;
		const img = "assets/demo/images/galleria/Esmeraldas.png";
		const blob = this.yService.ReportePorMes(cuerpoSinPrimerElemento, img,Mes,this.year,totales);
		const url = URL.createObjectURL(blob);
		this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
		console.log("Se muestra xd");
	},error=>{
	  console.log(error);
	});
  }

  onselectMes(event){
	console.log(event.value.name);
	this.mes = event.value.name;
	console.log(this.SelectedMes);
	console.log(this.SelectedMes);
	this.service.GetReportePorMes(this.selectedDrop,this.SelectedMes.id).subscribe((data: any)=>{

		this.Fatura = data;
		console.log(data);
		const cuerpo = this.Fatura.map(item => [
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
	
		const Mes = this.mes;
		const Year = this.year;
		const img = "assets/demo/images/galleria/Esmeraldas.png";
		const blob = this.yService.ReportePorMes(cuerpoSinPrimerElemento, img,Mes,Year,totales);
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
	declarations: [ReportesPormesComponent]
})
export class ReportePorMesDemoModule { }