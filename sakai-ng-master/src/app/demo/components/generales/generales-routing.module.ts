import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

@NgModule({
    imports: [RouterModule.forChild([
        { path: 'departamento', data: { breadcrumb: 'Departamento' }, loadChildren: () => import('./Departamento/list-departamento/Departamentodemo.module').then(m => m.DepartamentoDemoModule) },
        { path: 'municipio', data: { breadcrumb: 'Municipio' }, loadChildren: () => import('./Municipio/list-municipio/Municipiodemo.module').then(m => m.MunicipioDemoModule) },

       
        { path: 'categoria', data: { breadcrumb: 'Categoria' }, loadChildren: () => import('./Categoria/list-categoria/Categoriademo.module').then(m => m.CategoriaDemoModule) },
        { path: 'cargo', data: { breadcrumb: 'Cargo' }, loadChildren: () => import('./Cargo/list-cargo/Cargodemo.module').then(m => m.CargoDemoModule) },
        { path: 'material', data: { breadcrumb: 'Material' }, loadChildren: () => import('./Materiales/list-material/Materialdemo.module').then(m => m.MaterialDemoModule) },
        { path: 'metodo', data: { breadcrumb: 'Metodo' }, loadChildren: () => import('./MetodoPago/list-metodopago/Metododemo.module').then(m => m.MetododemoDemoModule) },
        { path: 'proveedor', data: { breadcrumb: 'Proveedor' }, loadChildren: () => import('./Proveedor/list-proveedor/Proveedordemo.module').then(m => m.ProveedorDemoModule) },
        { path: 'sucursal', data: { breadcrumb: 'Sucursal' }, loadChildren: () => import('./Sucursales/list-sucursal/Sucursaldemo.module').then(m => m.SucursalDemoModule) },
        { path: 'estado', data: { breadcrumb: 'Estado' }, loadChildren: () => import('./EstadoCivil/list-estadocivil/EstadoCivildemo.module').then(m => m.EstadoCivilDemoModule) },
        { path: 'impuesto', data: { breadcrumb: 'Impuesto' }, loadChildren: () => import('./Impuesto/list-impuesto/Impuestodemo.module').then(m => m.ImpuestoDemoModule) },
        { path: 'cliente', data: { breadcrumb: 'Cliente' }, loadChildren: () => import('./Cliente/list-cliente/Clientedemo.module').then(m => m.ClienteDemoModule) },
        { path: 'empleado', data: { breadcrumb: 'Empleado' }, loadChildren: () => import('./Empleado/list-empleado/empleadodemo.module').then(m => m.EmpleadoDemoModule) },
        { path: 'marca', data: { breadcrumb: 'Marca' }, loadChildren: () => import('./Marca/list-marca/marcademo.module').then(m => m.MarcaDemoModule) },

        { path: '**', redirectTo: '/notfound' }
    ])],
    exports: [RouterModule]
})
export class GeneraleRoutingModule { }
