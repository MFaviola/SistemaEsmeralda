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
                                routerLink: ['/auth/error']
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
