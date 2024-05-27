import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { DashboardComponent } from './dashboard.component';
import { ChartModule } from 'primeng/chart';
import { MenuModule } from 'primeng/menu';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { StyleClassModule } from 'primeng/styleclass';
import { PanelMenuModule } from 'primeng/panelmenu';
import { DashboardsRoutingModule } from './dashboard-routing.module';
import { ReactiveFormsModule } from '@angular/forms';
import { InputGroupAddonModule } from 'primeng/inputgroupaddon';
import { InputGroupModule } from 'primeng/inputgroup';
import { DialogModule } from 'primeng/dialog';


import { ToastModule } from 'primeng/toast';

import { OverlayPanelModule } from 'primeng/overlaypanel';

import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { SidebarModule } from 'primeng/sidebar';
import { RippleModule } from 'primeng/ripple';
import { ConfirmPopupModule } from 'primeng/confirmpopup';
import { TooltipModule } from 'primeng/tooltip';
import { InputTextModule } from 'primeng/inputtext';
import { DropdownModule } from "primeng/dropdown";
import { InputNumberModule } from 'primeng/inputnumber';
@NgModule({
    imports: [ToastModule,
        OverlayPanelModule,
        ConfirmDialogModule,
        SidebarModule,
        RippleModule,
        ConfirmPopupModule,
        TooltipModule,
        InputTextModule,
        DropdownModule,
        InputNumberModule,
        CommonModule,
        FormsModule,
        ChartModule,
        MenuModule,
        TableModule,
        StyleClassModule,
        PanelMenuModule,
        ButtonModule,
        DashboardsRoutingModule,ReactiveFormsModule,
        InputGroupAddonModule,
        InputGroupModule,
        DialogModule
    ],
    declarations: [DashboardComponent]
})
export class DashboardModule { }
