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
                        icon: 'pi pi-fw pi-user',
                        items: [
                            {
                                label: 'Usuarios',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/generales/departamento']
                            },
                            {
                                label: 'Roles',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/auth/error']
                            },
                        ]
                    },
                    
                 

                ]
            },
            {
                items: [
                    {
                        label: 'Generales',
                        icon: 'pi pi-fw pi-user',
                        items: [
                            {
                                label: 'Departamentos',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/generales/departamento']
                            },
                            {
                                label: 'Municipios',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/generales/municipio']
                            },
                            {
                                label: 'Categoria',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/generales/categoria']

                            },
                            {
                                label: 'Estado Civil',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/generales/estado']
                            },
                            {
                                label: 'Impuesto',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/generales/impuesto']
                            },
                            {
                                label: 'Cliente',
                                icon: 'pi pi-fw pi-times-circle',
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


                        ]
                    },
                    
                 

                ]
            },
            {
                items: [
                    {
                        label: 'Ventas',
                        icon: 'pi pi-fw pi-user',
                        items: [
                            {
                                label: 'Joyas',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/auth/login']
                            },
                            {
                                label: 'Maquillajes',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/auth/error']
                            },
                        ]
                    },
                    
                 

                ]
            },
        ];
    }
}
