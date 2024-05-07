import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ChartsDemoRoutingModule } from './chartsdemo-routing.module';
import { ChartModule } from 'primeng/chart'
import { ChartsDemoComponent } from './chartsdemo.component';
import { CalendarModule } from "primeng/calendar";
@NgModule({
	imports: [
		CommonModule,
		ChartsDemoRoutingModule,
		ChartModule,CalendarModule
	],
	declarations: [ChartsDemoComponent]
})
export class ChartsDemoModule { }
