import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { AuthGuardVenta } from 'src/app/authVenta.guard';

@NgModule({
    imports: [RouterModule.forChild([
        { path: 'maquillajes', data: { breadcrumb: 'Maquillaje' }, loadChildren: () => import('./Maquillaje/list-maquillaje/Maquillajedemo.module').then(m => m.MaquillajeDemoModule),canActivate: [AuthGuardVenta] },
        { path: 'joyas', data: { breadcrumb: 'Joya' }, loadChildren: () => import('./Joya/list-joya/Joyademo.module').then(m => m.JoyaDemoModule),canActivate: [AuthGuardVenta]},
        { path: 'facturas', data: { breadcrumb: 'Factura' }, loadChildren: () => import('./Factura/list-factura/Facturademo.module').then(m => m.FacturaDemoModule),canActivate: [AuthGuardVenta]},
        { path: 'facturasdecompra', data: { breadcrumb: 'FacturaCompra' }, loadChildren: () => import('./FacturaCompra/list-facturacompra/list-facturacompra.module').then(m => m.FacturaCompraModule),canActivate: [AuthGuardVenta]},
        { path: 'reporte', data: { breadcrumb: 'Reporte' }, loadChildren: () => import('./reporte/reportedemo.module').then(m => m.ReporteDemoModule)},
        { path: '**', redirectTo: '/dash' }
    ])],
    exports: [RouterModule]
})
export class VentaRoutingModule { }
