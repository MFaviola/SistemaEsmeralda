import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

@NgModule({
    imports: [RouterModule.forChild([
        { path: 'maquillaje', data: { breadcrumb: 'Maquillaje' }, loadChildren: () => import('./Maquillaje/list-maquillaje/Maquillajedemo.module').then(m => m.MaquillajeDemoModule) },
        { path: 'joya', data: { breadcrumb: 'Joya' }, loadChildren: () => import('./Joya/list-joya/Joyademo.module').then(m => m.JoyaDemoModule)},
        { path: 'factura', data: { breadcrumb: 'Factura' }, loadChildren: () => import('./Factura/list-factura/Facturademo.module').then(m => m.FacturaDemoModule)},
        { path: '**', redirectTo: '/notfound' }
    ])],
    exports: [RouterModule]
})
export class VentaRoutingModule { }
