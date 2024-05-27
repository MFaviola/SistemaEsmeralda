import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ListMaquillajeComponent } from './list-maquillaje.component';

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: ListMaquillajeComponent }
	])],
	exports: [RouterModule]
})
export class MaquillajeRoutingModule { }
