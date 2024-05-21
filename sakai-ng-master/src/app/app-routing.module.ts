import { RouterModule } from '@angular/router';
import { Component, NgModule } from '@angular/core';
import { NotfoundComponent } from './demo/components/notfound/notfound.component';
import { AppLayoutComponent } from "./layout/app.layout.component";

import { ReportesPormesComponent } from './demo/components/reporte/ReportePorMes/reporteportemes.component';
import { AuthGuard } from './auth.guard';
import { AuthGuardLogin } from './authLogin.guard';
@NgModule({
    imports: [
        RouterModule.forRoot([
            { path: 'landing', loadChildren: () => import('./demo/components/landing/landing.module').then(m => m.LandingModule) },
            { path: 'notfound', component: NotfoundComponent },
            { path: '', loadChildren: () => import('./demo/components/auth/login/login.module').then(m => m.LoginModule) }, // Esta es tu página de inicio de sesión
            {
                path: '', component: AppLayoutComponent,
                children: [
                    { path: 'dash', loadChildren: () => import('./demo/components/dashboard/dashboard.module').then(m => m.DashboardModule), canActivate: [AuthGuardLogin]},
                    { path: 'uikit', loadChildren: () => import('./demo/components/uikit/uikit.module').then(m => m.UIkitModule) },
                    { path: 'utilities', loadChildren: () => import('./demo/components/utilities/utilities.module').then(m => m.UtilitiesModule) },
                    { path: 'documentation', loadChildren: () => import('./demo/components/documentation/documentation.module').then(m => m.DocumentationModule) },
                    { path: 'blocks', loadChildren: () => import('./demo/components/primeblocks/primeblocks.module').then(m => m.PrimeBlocksModule) },
                    { path: 'generales', loadChildren: () => import('./demo/components/generales/generales.module').then(m => m.GeneraleModule) },
                    { path: 'acceso', loadChildren: () => import('./demo/components/acceso/acesso.module').then(m => m.AccesoModule) },
                    { path: 'venta', loadChildren: () => import('./demo/components/venta/venta.module').then(m => m.VentaModule) },
                    { path: 'pages', loadChildren: () => import('./demo/components/pages/pages.module').then(m => m.PagesModule) },
                    { path: 'reportes', loadChildren: () => import('./demo/components/reporte/reporte.module').then(m => m.ReporteModule) },
                    { path: 'usuario', loadChildren: () => import('./demo/components/auth/usuario/usuario.module').then(m => m.UsuarioModule) },
                    { path: 'facturas', loadChildren: () => import('./demo/components/Factura/list-factura/Facturademo.module').then(m => m.FacturaDemoModule) },
                  
                ]
            },
            { path: '**', redirectTo: '/dash' },
        ], { scrollPositionRestoration: 'enabled', anchorScrolling: 'enabled', onSameUrlNavigation: 'reload' })
    ],
    exports: [RouterModule]
})
export class AppRoutingModule {
}
