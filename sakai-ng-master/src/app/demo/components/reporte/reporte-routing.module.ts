import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

@NgModule({
    imports: [RouterModule.forChild([
        { path: 'mayorista', data: { breadcrumb: 'Mayorista' }, loadChildren: () => import('./ReporteVentasMayoristas/reportepormayoristademo-routing.module').then(m => m.ReportePorStockDemoRoutingModule)},
        { path: 'anual', data: { breadcrumb: 'Anual' }, loadChildren: () => import('./ReporteVentasAnual/reporteporteporventasanualdemo-routing.module').then(m => m.ReportePorStockDemoRoutingModule)},
        { path: 'top', data: { breadcrumb: 'Top' }, loadChildren: () => import('./ReporteTop10/reporteporteportop10demo-routing.module').then(m => m.ReportePorStockDemoRoutingModule)},
        { path: 'mes', data: { breadcrumb: 'Mes' }, loadChildren: () => import('./ReportePorMes/reportepormesdemo-routing.module').then(m => m.ReportePorMesDemoRoutingModule)},
        { path: 'empleado', data: { breadcrumb: 'Empleado' }, loadChildren: () => import('./ReportePorEmpleadoTotal/reporteporempleadockdemo.module').then(m => m.ReportePorEmpleadoDemoModule)},
        { path: 'stock', data: { breadcrumb: 'Stock' }, loadChildren: () => import('./ReportePorControlStock/reporteporstockdemo-routing.module').then(m => m.ReportePorStockDemoRoutingModule)},
        { path: '**', redirectTo: '/notfound' }
    ])],
    exports: [RouterModule]
})
export class ReporteRoutingModule { }
