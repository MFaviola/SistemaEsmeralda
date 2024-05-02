import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CategoriaDemoComponent } from './Categoriademo.component';

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: CategoriaDemoComponent }
	])],
	exports: [RouterModule]
})
export class CategoriaRoutingModule { }
