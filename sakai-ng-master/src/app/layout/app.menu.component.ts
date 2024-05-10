import { OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { LayoutService } from './service/app.layout.service';

@Component({
    selector: 'app-menu',
    templateUrl: './app.menu.component.html'
})
export class AppMenuComponent implements OnInit {

    model: any[] = [];
    prueba: boolean = false;
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
                                routerLink: ['/generales/departamento'],
                             
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
                                icon: 'pi pi-fw pi-key',
                                routerLink: ['/generales/cargo']

                            },
                            {
                                label: 'Marca',
                                icon: 'pi pi-fw pi-truck',
                                routerLink: ['/generales/marca']

                            },

                            {
                                label: 'Material',
                                icon: 'pi pi-fw pi-inbox',
                                routerLink: ['/generales/material']

                            },
                            {
                                label: 'Metodo Pago',
                                icon: 'pi pi-fw pi-wallet',
                                routerLink: ['/generales/metodo']

                            },

                            {
                                label: 'Proveedor',
                                icon: 'pi pi-fw pi-truck',
                                routerLink: ['/generales/proveedor']

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
                            {
                                label: 'Facturas de Compra',
                                icon: 'pi pi-fw pi-cart-plus',
                                routerLink: ['/venta/facturacompra']
                            },
                            {
                                label: 'Reportes',
                                icon: 'pi pi-fw pi-download',
                                routerLink: ['/venta/reporte']
                            },
                        ]
                    },
                ]


                




                














            },
            // {
            //     items: [
            //         {
            //             label: 'Graficos',
            //             icon: 'pi pi-fw pi-chart-bar',
            //             routerLink: ['/uikit/charts']
                        
            //         },
            //     ]


                



            // },

            {
                items: [
                    {
                        label: 'Graficos',
                        icon: 'pi pi-fw pi-chart-bar',
                        items: [
                            {
                                label: 'Mesuales',
                                icon: 'pi pi-fw pi-dollar',
                                routerLink: ['/uikit/charts']
                            },
                            {
                                label: 'Anuales',
                                icon: 'pi pi-fw pi-pencil',
                                routerLink: ['/uikit/chartsanuales']
                            },
                         
                         
                        ]
                    },
                ]


                






            },






        ];
    }






}
