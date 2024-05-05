import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ListMaquillajeComponent } from './list-maquillaje.component';
import { MaquillajeRoutingModule } from './Maquillajedemo-routing.module';
import { ToastModule } from 'primeng/toast';
import { DialogModule } from 'primeng/dialog';
import { ButtonModule } from 'primeng/button';
import { OverlayPanelModule } from 'primeng/overlaypanel';
import { TableModule } from 'primeng/table';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { SidebarModule } from 'primeng/sidebar';
import { RippleModule } from 'primeng/ripple';
import { ConfirmPopupModule } from 'primeng/confirmpopup';
import { TooltipModule } from 'primeng/tooltip';
import { InputTextModule } from 'primeng/inputtext';
import { DropdownModule } from "primeng/dropdown";
import { FileUploadModule } from 'primeng/fileupload';
import { ReactiveFormsModule } from '@angular/forms';
import { InputNumberModule } from 'primeng/inputnumber';
@NgModule({
	imports: [
		CommonModule,
		MaquillajeRoutingModule,
		ToastModule,
		DialogModule,
		FormsModule,
		TooltipModule,
		InputTextModule,
		DropdownModule,
		ButtonModule,
		OverlayPanelModule,
		TableModule,
		ConfirmDialogModule,
		SidebarModule,
		RippleModule,
		ConfirmPopupModule,
		FileUploadModule,
		ReactiveFormsModule,
		InputNumberModule
	],
	declarations: [ListMaquillajeComponent]
})
export class MaquillajeDemoModule { }
