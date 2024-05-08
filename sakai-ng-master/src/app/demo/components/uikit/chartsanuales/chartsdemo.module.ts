import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ChartsanualesDemoRoutingModule } from './chartsanualesdemo-routing.module';
import { ChartModule } from 'primeng/chart'
import { ChartsDemoComponent } from './chartsanualesdemo.component';
import { CalendarModule } from "primeng/calendar";
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
@NgModule({
	imports: [
		CommonModule,
		ChartsanualesDemoRoutingModule,
		ChartModule,CalendarModule,FormsModule,ReactiveFormsModule
	],
	declarations: [ChartsDemoComponent]
})
export class ChartsanualesDemoModule { }
