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
        { path: 'cargo', data: { breadcrumb: 'Cargo' }, loadChildren: () => import('./Cargo/list-cargo/Cargodemo.module').then(m => m.CargoDemoModule) },
        { path: 'material', data: { breadcrumb: 'Material' }, loadChildren: () => import('./Materiales/list-material/Materialdemo.module').then(m => m.MaterialDemoModule) },
        { path: 'metodo', data: { breadcrumb: 'Metodo' }, loadChildren: () => import('./MetodoPago/list-metodopago/Metododemo.module').then(m => m.MetododemoDemoModule) },
        { path: 'proveedor', data: { breadcrumb: 'Proveedor' }, loadChildren: () => import('./Proveedor/list-proveedor/Proveedordemo.module').then(m => m.ProveedorDemoModule) },
        { path: 'sucursal', data: { breadcrumb: 'Sucursal' }, loadChildren: () => import('./Sucursales/list-sucursal/Sucursaldemo.module').then(m => m.SucursalDemoModule) },

        { path: '**', redirectTo: '/notfound' }
    ])],
    exports: [RouterModule]
})
export class GeneraleRoutingModule { }
