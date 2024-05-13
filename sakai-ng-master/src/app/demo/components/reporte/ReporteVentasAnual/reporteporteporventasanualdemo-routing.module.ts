import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { reportepormesComponent } from './reporteporteporventasanual.component';

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: reportepormesComponent }
	])],
	exports: [RouterModule]
})
export class ReportePorStockDemoRoutingModule { }
