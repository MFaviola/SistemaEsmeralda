import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { reportepormesComponent } from './ReporteTop10/reporteporteportop10.component';
import { reporteVentasAnual } from './ReporteVentasAnual/reporteporteporventasanual.component';
import { reporteMayorista } from './ReporteVentasMayoristas/reportepormayorista.component';


@NgModule({
    imports: [RouterModule.forChild([
        { path: 'mayorista', component: reporteMayorista},
        { path: 'anual', component: reporteVentasAnual},
        { path: 'top', component: reportepormesComponent},
        { path: 'empleado', data: { breadcrumb: 'Empleado' }, loadChildren: () => import('./ReportePorEmpleadoTotal/reporteporempleadockdemo.module').then(m => m.ReportePorEmpleadoDemoModule)},
        { path: 'stock', data: { breadcrumb: 'Stock' }, loadChildren: () => import('./ReportePorControlStock/reporteporstockdemo-routing.module').then(m => m.ReportePorStockDemoRoutingModule)},
        { path: '**', redirectTo: '/notfound' }
    ])],
    exports: [RouterModule]
})
export class ReporteRoutingModule { }
