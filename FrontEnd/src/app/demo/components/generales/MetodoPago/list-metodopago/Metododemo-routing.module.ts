import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ListMetodoComponent } from './list-metodopago.component';

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: ListMetodoComponent }
	])],
	exports: [RouterModule]
})
export class ListMetodoRoutingModule { }
