import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ChartsDemoRoutingModule } from './chartsdemo-routing.module';
import { ChartModule } from 'primeng/chart'
import { ChartsDemoComponent } from './chartsdemo.component';
import { CalendarModule } from "primeng/calendar";
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
@NgModule({
	imports: [
		CommonModule,
		ChartsDemoRoutingModule,
		ChartModule,CalendarModule,FormsModule,ReactiveFormsModule
	],
	declarations: [ChartsDemoComponent]
})
export class ChartsDemoModule { }
