import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { AuthGuard } from 'src/app/auth.guard';
import { AuthGuardAccess } from 'src/app/authAcess.guard';

@NgModule({
    imports: [RouterModule.forChild([
        { path: 'roles', data: { breadcrumb: 'Rol' }, loadChildren: () => import('./Role/list-rol/roldemo.module').then(m => m.RolDemoModule),canActivate: [AuthGuardAccess] },
        { path: 'usuarios', data: { breadcrumb: 'Usuario' }, loadChildren: () => import('./Usuario/list-usuario/usuariodemo.module').then(m => m.UsuarioDemoModule),canActivate: [AuthGuardAccess]  },
        { path: 'login', data: { breadcrumb: 'Login' }, loadChildren: () => import('./login/login.module').then(m => m.LoginModule) },

        { path: '**', redirectTo: '/dash' }
    ])],
    exports: [RouterModule]
})
export class AccesoRoutingModule { }
