import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ListSucursalComponent } from './list-sucursal.component';

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: ListSucursalComponent }
	])],
	exports: [RouterModule]
})
export class ListSucursalRoutingModule { }
