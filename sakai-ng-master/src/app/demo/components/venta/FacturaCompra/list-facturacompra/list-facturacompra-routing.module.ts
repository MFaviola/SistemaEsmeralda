import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ListFacturacompraComponent } from './list-facturacompra.component'; 

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: ListFacturacompraComponent }
	])],
	exports: [RouterModule]
})
export class FacturaCompraRoutingModule { }