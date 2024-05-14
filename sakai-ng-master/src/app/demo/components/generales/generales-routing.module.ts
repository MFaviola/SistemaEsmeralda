import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { AuthGuard } from 'src/app/auth.guard';

@NgModule({
    imports: [RouterModule.forChild([
        { path: 'departamentos', data: { breadcrumb: 'Departamentos' }, loadChildren: () => import('./Departamento/list-departamento/Departamentodemo.module').then(m => m.DepartamentoDemoModule),canActivate: [AuthGuard]  },
        { path: 'municipios', data: { breadcrumb: 'Municipio' }, loadChildren: () => import('./Municipio/list-municipio/Municipiodemo.module').then(m => m.MunicipioDemoModule),canActivate: [AuthGuard] },

       
        { path: 'categorias', data: { breadcrumb: 'Categoria' }, loadChildren: () => import('./Categoria/list-categoria/Categoriademo.module').then(m => m.CategoriaDemoModule),canActivate: [AuthGuard] },
        { path: 'cargos', data: { breadcrumb: 'Cargo' }, loadChildren: () => import('./Cargo/list-cargo/Cargodemo.module').then(m => m.CargoDemoModule),canActivate: [AuthGuard] },
        { path: 'materiales', data: { breadcrumb: 'Material' }, loadChildren: () => import('./Materiales/list-material/Materialdemo.module').then(m => m.MaterialDemoModule),canActivate: [AuthGuard] },
        { path: 'metodos', data: { breadcrumb: 'Metodo' }, loadChildren: () => import('./MetodoPago/list-metodopago/Metododemo.module').then(m => m.MetododemoDemoModule),canActivate: [AuthGuard] },
        { path: 'proveedores', data: { breadcrumb: 'Proveedor' }, loadChildren: () => import('./Proveedor/list-proveedor/Proveedordemo.module').then(m => m.ProveedorDemoModule),canActivate: [AuthGuard] },
        
        { path: 'estadosciviles', data: { breadcrumb: 'Estado' }, loadChildren: () => import('./EstadoCivil/list-estadocivil/EstadoCivildemo.module').then(m => m.EstadoCivilDemoModule),canActivate: [AuthGuard] },
        
        { path: 'clientes', data: { breadcrumb: 'Cliente' }, loadChildren: () => import('./Cliente/list-cliente/Clientedemo.module').then(m => m.ClienteDemoModule),canActivate: [AuthGuard] },
        { path: 'empleados', data: { breadcrumb: 'Empleado' }, loadChildren: () => import('./Empleado/list-empleado/empleadodemo.module').then(m => m.EmpleadoDemoModule),canActivate: [AuthGuard] },
        { path: 'marcas', data: { breadcrumb: 'Marca' }, loadChildren: () => import('./Marca/list-marca/marcademo.module').then(m => m.MarcaDemoModule),canActivate: [AuthGuard] },

        { path: '**', redirectTo: '/dash' }
    ])],
    exports: [RouterModule]
})
export class GeneraleRoutingModule { }
