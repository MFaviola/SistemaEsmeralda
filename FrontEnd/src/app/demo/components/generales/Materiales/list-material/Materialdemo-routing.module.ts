import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ListMaterialComponent } from './list-material.component';

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: ListMaterialComponent }
	])],
	exports: [RouterModule]
})
export class ListMaterialRoutingModule { }
