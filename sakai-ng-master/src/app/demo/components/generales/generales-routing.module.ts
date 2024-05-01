import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

@NgModule({
    imports: [RouterModule.forChild([
        { path: 'departamento', data: { breadcrumb: 'Departamento' }, loadChildren: () => import('./Departamento/Departamentodemo.module').then(m => m.DepartamentoDemoModule) },
        { path: 'municipio', data: { breadcrumb: 'Municipio' }, loadChildren: () => import('./Municipio/Municipiodemo.module').then(m => m.MunicipioDemoModule) },

       
        { path: 'categoria', data: { breadcrumb: 'Categoria' }, loadChildren: () => import('./Categoria/Categoriademo.module').then(m => m.CategoriaDemoModule) },

        { path: 'estado', data: { breadcrumb: 'Estado' }, loadChildren: () => import('./EstadoCivil/EstadoCivildemo.module').then(m => m.EstadoCivilDemoModule) },
        { path: 'impuesto', data: { breadcrumb: 'Impuesto' }, loadChildren: () => import('./Impuesto/list-impuesto/Impuestodemo.module').then(m => m.ImpuestoDemoModule) },
        { path: 'cliente', data: { breadcrumb: 'Cliente' }, loadChildren: () => import('./Cliente/list-cliente/Clientedemo.module').then(m => m.ClienteDemoModule) },
        { path: 'empleado', data: { breadcrumb: 'Empleado' }, loadChildren: () => import('./Cliente/list-cliente/Clientedemo.module').then(m => m.ClienteDemoModule) },
        { path: '**', redirectTo: '/notfound' }
    ])],
    exports: [RouterModule]
})
export class GeneraleRoutingModule { }
