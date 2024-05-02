import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ListJoyaComponent } from './list-joya.component';

@NgModule({
	imports: [RouterModule.forChild([
		{ path: '', component: ListJoyaComponent }
	])],
	exports: [RouterModule]
})
export class JoyaRoutingModule { }
