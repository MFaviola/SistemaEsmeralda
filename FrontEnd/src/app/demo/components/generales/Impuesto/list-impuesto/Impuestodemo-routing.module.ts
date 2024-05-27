import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ListImpuestoComponent } from './list-impuesto.component';

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: ListImpuestoComponent }
	])],
	exports: [RouterModule]
})
export class ListImpuestoRoutingModule { }
