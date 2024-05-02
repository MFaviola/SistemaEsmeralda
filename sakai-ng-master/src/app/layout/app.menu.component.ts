import { OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { LayoutService } from './service/app.layout.service';

@Component({
    selector: 'app-menu',
    templateUrl: './app.menu.component.html'
})
export class AppMenuComponent implements OnInit {

    model: any[] = [];

    constructor(public layoutService: LayoutService) { }

    ngOnInit() {
        this.model = [
            {
                items: [
                    {
                        label: 'Acceso',
                        icon: 'pi pi-fw pi-users',
                        items: [
                            {
                                label: 'Usuarios',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/acceso/usuario']
                            },
                            {
                                label: 'Roles',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/acceso/rol']
                            },
                        ]
                    },
                    
                 

                ]
            },
            {
                items: [
                    {
                        label: 'Generales',
                        icon: 'pi pi-fw pi-folder',
                        items: [
                            {
                                label: 'Departamentos',
                                icon: 'pi pi-fw pi-building',
                                routerLink: ['/generales/departamento']
                            },
                            {
                                label: 'Municipios',
                                icon: 'pi pi-fw pi-directions',
                                routerLink: ['/generales/municipio']
                            },
                            {
                                label: 'Categoria',
                                icon: 'pi pi-fw pi-list',
                                routerLink: ['/generales/categoria']

                            },
                            {
                                label: 'Estado Civil',
                                icon: 'pi pi-fw pi-heart',
                                routerLink: ['/generales/estado']
                            },
                            {
                                label: 'Impuesto',
                                icon: 'pi pi-fw pi-money-bill',
                                routerLink: ['/generales/impuesto']
                            },
                            {
                                label: 'Cliente',
                                icon: 'pi pi-fw pi-users',
                                routerLink: ['/generales/cliente']

                            },
                            {

                                label: 'Cargo',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/generales/cargo']

                            },

                            {
                                label: 'Material',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/generales/material']

                            },
                            {
                                label: 'Metodo Pago',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/generales/metodo']

                            },

                            {
                                label: 'Proveedor',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/generales/proveedor']

                            },
                            {
                                label: 'Sucursales',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/generales/sucursal']

                            },
                            {
                                label: 'Empleado',
                                icon: 'pi pi-fw pi-user',
                                routerLink: ['/generales/empleado']

                            },

                        ]
                    },
                    
                 

                ]
            },
            {
                items: [
                    {
                        label: 'Ventas',
                        icon: 'pi pi-fw pi-chart-bar',
                        items: [
                            {
                                label: 'Joyas',
                                icon: 'pi pi-fw pi-dollar',
                                routerLink: ['/venta/joya']
                            },
                            {
                                label: 'Maquillajes',
                                icon: 'pi pi-fw pi-pencil',
                                routerLink: ['/venta/maquillaje']
                            },
                            {
                                label: 'Facturas',
                                icon: 'pi pi-fw pi-cart-plus',
                                routerLink: ['/venta/factura']
                            },
                        ]
                    },
                    
                 

                ]
            },
        ];
    }
}
