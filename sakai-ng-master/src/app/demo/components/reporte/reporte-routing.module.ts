import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { reportepormesComponent } from './ReporteTop10/reporteporteportop10.component';
import { reporteVentasAnual } from './ReporteVentasAnual/reporteporteporventasanual.component';
import { reporteMayorista } from './ReporteVentasMayoristas/reportepormayorista.component';
import {CookieService} from 'ngx-cookie-service';
import { AuthGuard } from 'src/app/auth.guard';

@NgModule({
    imports: [RouterModule.forChild([
        { path: 'ventasmayoristas', component: reporteMayorista ,canActivate: [AuthGuard]},
        { path: 'ventasanuales', component: reporteVentasAnual ,canActivate: [AuthGuard]},
        { path: 'productosvendidos', component: reportepormesComponent ,canActivate: [AuthGuard]},
        { path: 'ventasporempleado', data: { breadcrumb: 'Empleado' }, loadChildren: () => import('./ReportePorEmpleadoTotal/reporteporempleadockdemo.module').then(m => m.ReportePorEmpleadoDemoModule) ,canActivate: [AuthGuard]},
        { path: 'controldestock', data: { breadcrumb: 'Stock' }, loadChildren: () => import('./ReportePorControlStock/reporteporstockdemo-routing.module').then(m => m.ReportePorStockDemoRoutingModule) ,canActivate: [AuthGuard]},
        { path: '**', redirectTo: '/notfound' }
    ])],
    exports: [RouterModule]
})
export class ReporteRoutingModule { }
