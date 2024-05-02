import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ListUsuarioComponent } from './list-usuario.component';

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: ListUsuarioComponent }
	])],
	exports: [RouterModule]
})
export class ListUsuarioRoutingModule { }
