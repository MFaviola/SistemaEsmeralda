import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReporteRoutingModule } from './reporte-routing.module';
import { DropdownModule } from "primeng/dropdown";
@NgModule({
	imports: [
		CommonModule,
		ReporteRoutingModule,
		DropdownModule

	]
})
export class ReporteModule { }
