import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

@NgModule({
    imports: [RouterModule.forChild([
        { path: 'departamento', data: { breadcrumb: 'Departamento' }, loadChildren: () => import('./Departamento/list-departamento/Departamentodemo.module').then(m => m.DepartamentoDemoModule) },
        { path: 'municipio', data: { breadcrumb: 'Municipio' }, loadChildren: () => import('./Municipio/list-municipio/Municipiodemo.module').then(m => m.MunicipioDemoModule) },

       
        { path: 'categoria', data: { breadcrumb: 'Categoria' }, loadChildren: () => import('./Categoria/list-categoria/Categoriademo.module').then(m => m.CategoriaDemoModule) },

        { path: 'estado', data: { breadcrumb: 'Estado' }, loadChildren: () => import('./EstadoCivil/list-estadocivil/EstadoCivildemo.module').then(m => m.EstadoCivilDemoModule) },
        { path: 'impuesto', data: { breadcrumb: 'Impuesto' }, loadChildren: () => import('./Impuesto/list-impuesto/Impuestodemo.module').then(m => m.ImpuestoDemoModule) },
        { path: 'cliente', data: { breadcrumb: 'Cliente' }, loadChildren: () => import('./Cliente/list-cliente/Clientedemo.module').then(m => m.ClienteDemoModule) },
        { path: 'empleado', data: { breadcrumb: 'Empleado' }, loadChildren: () => import('./Empleado/list-empleado/empleadodemo.module').then(m => m.EmpleadoDemoModule) },
        { path: '**', redirectTo: '/notfound' }
    ])],
    exports: [RouterModule]
})
export class GeneraleRoutingModule { }
