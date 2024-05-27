import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { reporteporempleadoComponent } from './reporteporempleado.component';

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: reporteporempleadoComponent }
	])],
	exports: [RouterModule]
})
export class ReportePorStockDemoRoutingModule { }
