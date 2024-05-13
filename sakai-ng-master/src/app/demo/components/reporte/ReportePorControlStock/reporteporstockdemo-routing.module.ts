import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { reporteComponent } from './reporteporstock.component';

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: reporteComponent }
	])],
	exports: [RouterModule]
})
export class ReportePorStockDemoRoutingModule { }
