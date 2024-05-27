import { Component, OnInit } from '@angular/core';
import { YService } from '../../venta/Impresion/impresion.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { BASE_URL } from 'src/app/Service/ulrsettings';
import { FormGroup, FormControl,  Validators, FormBuilder  } from '@angular/forms';
import { ServiceService } from 'src/app/Service/Factura.service';
import { ReportePorTipo, Stock } from 'src/app/Models/FacturaViewModel';
import { DatePipe } from '@angular/common';
import { CookieService } from 'ngx-cookie-service';
import { Usuario } from 'src/app/Models/UsuarioVIewModel';
import { dropSucursal } from 'src/app/Models/SucursalViewModel';
import { SelectItem } from 'primeng/api';
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
@Component({
  templateUrl: './reporteportiposdepago.component.html',
  styleUrl: './reporteportiposdepago.component.css',
  providers: [YService,DatePipe,CookieService]
})

export class reportePorTipoPagoComponent implements OnInit  {
    //Region Fecha
    dateDay = new Date();
    conversion: string;

    //
    meses: SelectItem[] = [];
  sucu_id = 0
  pdfSrc: SafeResourceUrl | null = null;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
  selectedMetodo: string = '2';
  Tipos!:ReportePorTipo[];
  SelectedMes: any= "0";
  sucursales: any[] = [];
  constructor(private service:ServiceService,private yService: YService, private sanitizer: DomSanitizer,private datePipe: DatePipe, private cookie: CookieService) { }

  ngOnInit(): void {
    this.meses = [
      { label: 'Todo', value: "0" },
      { label: 'Efectivo',  value: "1" },
      { label: 'Tarjeta de Credito', value: "4"  },
      { label: 'Pago en linea',  value: "7" }
    ];
    this.service.getReporteTipoPago(0).subscribe((data: any)=>{
      let prueba = 0
      this.Tipos = data;
      const total = this.Tipos.reduce((sum, item) => sum + (parseFloat(item.total) || 0), 0);
      console.log(data);
      const cuerpo = this.Tipos.map(item => [
        item.fact_Id.toString(),
        item.total.toString(),
        item.fact_FechaFinalizado.toString(),
      ]);
      let metodo = "Todos"
      if (prueba == 0) {
        metodo  = "Todos"
      }else{
        metodo  = data[0].mepa_Metodo
      }
      const usuario = this.cookie.get('Empleado');
      const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
      const img = "assets/demo/images/galleria/Esmeraldas.png";
      const blob = this.yService.ReportePorTipoPago(cuerpo, img,usuario,fechaC,total,metodo);
      const url = URL.createObjectURL(blob);
      this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
      console.log("Se muestra xd");
  },error=>{
    console.log(error);
  });
  }


onselectMes(event){
  this.service.getReporteTipoPago(event.value).subscribe((data: any)=>{
    this.Tipos = data;
    const total = this.Tipos.reduce((sum, item) => sum + (parseFloat(item.total) || 0), 0);
    console.log(data);
    const cuerpo = this.Tipos.map(item => [
      item.fact_Id.toString(),
      item.total.toString(),
      item.fact_FechaFinalizado.toString(),
    ]);
    let metodo = "Todos"
    if (event.value == 0) {
      metodo  = "Todos"
    }else{
      metodo  = data[0].mepa_Metodo
    }

    const usuario = this.cookie.get('Empleado');
    const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
    const img = "assets/demo/images/galleria/Esmeraldas.png";
    const blob = this.yService.ReportePorTipoPago(cuerpo, img,usuario,fechaC,total,metodo);
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
	declarations: [reportePorTipoPagoComponent]
})
export class ReportePorTipoPagoDemoModule { }