import { Component, OnInit } from '@angular/core';
import { YService } from '../../venta/Impresion/impresion.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { BASE_URL } from 'src/app/Service/ulrsettings';
import { FormGroup, FormControl,  Validators, FormBuilder  } from '@angular/forms';
import { ServiceService } from 'src/app/Service/Factura.service';
import { Stock } from 'src/app/Models/FacturaViewModel';
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
  templateUrl: './reporteporstock.component.html',
  styleUrl: './reporteporstock.component.css',
  providers: [YService,DatePipe,CookieService]
})

export class reporteComponent implements OnInit  {
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
  Stock!:Stock[];
  SelectedMes: any= "0";
  sucursales: any[] = [];
  constructor(private service:ServiceService,private yService: YService, private sanitizer: DomSanitizer,private datePipe: DatePipe, private cookie: CookieService) { }

  ngOnInit(): void {
    this.service.getDropDownsSucursales().subscribe((data: dropSucursal[]) => {
      console.log(data);
      this.sucursales = data.map(sucursal => ({
        value: sucursal.value.toString(), 
        label: sucursal.text 
      }));
      this.meses = this.sucursales; 
    });
    this.service.getControlStock(2,this.sucu_id).subscribe((data: any)=>{
      this.Stock = data;
      console.log(data);
      const cuerpo = this.Stock.map(item => [
        item.categoria.toString(),
        item.producto.toString(),
        item.stock.toString(),
      ]);

      const usuario = this.cookie.get('Empleado');
      const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
      const img = "assets/demo/images/galleria/Esmeraldas.png";
      const blob = this.yService.ReporteStock(cuerpo, img,usuario,fechaC);
      const url = URL.createObjectURL(blob);
      this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
      console.log("Se muestra xd");
  },error=>{
    console.log(error);
  });
  }

  
  selectMetodoPago(metodo: string) {
    this.selectedMetodo = metodo;
    this.service.getControlStock(this.selectedMetodo,this.sucu_id).subscribe((data: any)=>{
      this.Stock = data;
      console.log(data);
      const cuerpo = this.Stock.map(item => [
        item.categoria.toString(),
        item.producto.toString(),
        item.stock.toString(),
      ]);
      const usuario = this.cookie.get('Empleado');
      const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
      const img = "assets/demo/images/galleria/Esmeraldas.png";
      const blob = this.yService.ReporteStock(cuerpo, img,usuario,fechaC);
      const url = URL.createObjectURL(blob);
      this.pdfSrc = this.sanitizer.bypassSecurityTrustResourceUrl(url);
      console.log("Se muestra xd");
  },error=>{
    console.log(error);
  });

   
    console.log(metodo);
}
onselectMes(event){
	console.log(event.value);
  this.sucu_id = event.value;
  this.service.getControlStock(this.selectedMetodo,this.sucu_id).subscribe((data: any)=>{
    this.Stock = data;
    console.log(data);
    const cuerpo = this.Stock.map(item => [
      item.categoria.toString(),
      item.producto.toString(),
      item.stock.toString(),
    ]);
    const usuario = this.cookie.get('Empleado');
    const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
    const img = "assets/demo/images/galleria/Esmeraldas.png";
    const blob = this.yService.ReporteStock(cuerpo, img,usuario,fechaC);
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
	declarations: [reporteComponent]
})
export class ReportePorMesDemoModule { }