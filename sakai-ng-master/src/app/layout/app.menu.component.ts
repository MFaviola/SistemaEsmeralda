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
                                label: 'Empleado',
                                icon: 'pi pi-fw pi-times-circle',
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
                        icon: 'pi pi-fw pi-user',
                        items: [
                            {
                                label: 'Joyas',
                                icon: 'pi pi-fw pi-sign-in',
                                routerLink: ['/venta/joya']
                            },
                            {
                                label: 'Maquillajes',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/venta/maquillaje']
                            },
                            {
                                label: 'Facturas',
                                icon: 'pi pi-fw pi-times-circle',
                                routerLink: ['/venta/factura']
                            },
                        ]
                    },
                    
                 

                ]
            },
        ];
    }
}
