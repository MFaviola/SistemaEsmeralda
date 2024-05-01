import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

@NgModule({
    imports: [RouterModule.forChild([
        { path: 'departamento', data: { breadcrumb: 'Departamento' }, loadChildren: () => import('./Departamento/Departamentodemo.module').then(m => m.DepartamentoDemoModule) },
        { path: 'municipio', data: { breadcrumb: 'Municipio' }, loadChildren: () => import('./Municipio/Municipiodemo.module').then(m => m.MunicipioDemoModule) },
       
        { path: 'categoria', data: { breadcrumb: 'Categoria' }, loadChildren: () => import('./Categoria/Categoriademo.module').then(m => m.CategoriaDemoModule) },

        { path: '**', redirectTo: '/notfound' }
    ])],
    exports: [RouterModule]
})
export class GeneraleRoutingModule { }
