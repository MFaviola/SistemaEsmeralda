import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UsuarioRoutingModule } from './usuario-routing.module';
import { UsuarioComponent } from './usuario.component';
import { ButtonModule } from 'primeng/button';
import { CheckboxModule } from 'primeng/checkbox';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { PasswordModule } from 'primeng/password';
import { OverlayPanelModule } from 'primeng/overlaypanel';
import { InputTextModule } from 'primeng/inputtext';
import { ToastModule } from 'primeng/toast';
import { DialogModule } from 'primeng/dialog';
import { TableModule } from 'primeng/table';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { SidebarModule } from 'primeng/sidebar';
import { RippleModule } from 'primeng/ripple';
import { ConfirmPopupModule } from 'primeng/confirmpopup';
import { TooltipModule } from 'primeng/tooltip';
import { DropdownModule } from "primeng/dropdown";

@NgModule({
    imports: [
        CommonModule,
        UsuarioRoutingModule,
        ReactiveFormsModule,
        ButtonModule,
        CheckboxModule,
        InputTextModule,
        FormsModule,
        PasswordModule,
        OverlayPanelModule,

        CommonModule,
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
		ReactiveFormsModule
    ],
    declarations: [UsuarioComponent]
})
export class UsuarioModule { }
