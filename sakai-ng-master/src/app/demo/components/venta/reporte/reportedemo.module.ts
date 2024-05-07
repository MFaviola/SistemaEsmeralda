import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { reporteComponent } from './reporte.component';
import { reporteDemoRoutingModule } from './reportedemo-routing.module';
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
@NgModule({
	imports: [
		CommonModule,
		reporteDemoRoutingModule,
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
		ConfirmPopupModule
	],
	declarations: [reporteComponent]
})
export class ReporteDemoModule { }