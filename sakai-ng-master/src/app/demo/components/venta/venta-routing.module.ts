import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

@NgModule({
    imports: [RouterModule.forChild([
        { path: 'maquillaje', data: { breadcrumb: 'Maquillaje' }, loadChildren: () => import('./Maquillaje/list-maquillaje/Maquillajedemo.module').then(m => m.MaquillajeDemoModule) },
        { path: 'joya', data: { breadcrumb: 'Joya' }, loadChildren: () => import('./Joya/list-joya/Joyademo.module').then(m => m.JoyaDemoModule)},
        { path: 'factura', data: { breadcrumb: 'Factura' }, loadChildren: () => import('./Factura/list-factura/Facturademo.module').then(m => m.FacturaDemoModule)},
        { path: 'facturacompra', data: { breadcrumb: 'FacturaCompra' }, loadChildren: () => import('./FacturaCompra/list-facturacompra/list-facturacompra.module').then(m => m.FacturaCompraModule)},
        { path: 'reporte', data: { breadcrumb: 'Reporte' }, loadChildren: () => import('./reporte/reportedemo.module').then(m => m.ReporteDemoModule)},
        { path: '**', redirectTo: '/notfound' }
    ])],
    exports: [RouterModule]
})
export class VentaRoutingModule { }
