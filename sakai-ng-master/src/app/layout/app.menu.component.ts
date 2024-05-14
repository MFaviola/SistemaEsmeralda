import { OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { LayoutService } from './service/app.layout.service';
import { CookieService } from 'ngx-cookie-service';
import { ServiceService } from '../Service/Roles.service';

@Component({
    selector: 'app-menu',
    templateUrl: './app.menu.component.html'
})
export class AppMenuComponent implements OnInit {

    model: any[] = [];
    permisosPermitidos: Set<string> = new Set();
    prueba: boolean = false;
    constructor(private servicioLogin: ServiceService,public layoutService: LayoutService,private cookieService: CookieService) { }


    modelo = [
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


                




                














            },   {
                items: [
                    {
                        label: 'Reportes',
                        icon: 'pi pi-fw pi-chart-bar',
                        items: [
                            {
                                label: 'Control de stock',
                                icon: 'pi pi-fw pi-dollar',
                                routerLink: ['/reportes/stock']
                            },
                            {
                                label: 'Ventas por empleado',
                                icon: 'pi pi-fw pi-pencil',
                                routerLink: ['/reportes/empleado']
                            },
                            {
                                label: 'Ventas por mes',
                                icon: 'pi pi-fw pi-cart-plus',
                                routerLink: ['/mes']
                            },
                            {
                                label: 'Top 10 productos',
                                icon: 'pi pi-fw pi-download',
                                routerLink: ['/reportes/top']
                            },
                            {
                                label: 'Ventas Anuales',
                                icon: 'pi pi-fw pi-download',
                                routerLink: ['/reportes/anual']
                            },
                            {
                                label: 'Ventas mayoristas',
                                icon: 'pi pi-fw pi-download',
                                routerLink: ['/reportes/mayorista']
                            },
                        ]
                    },
                ]


            },
       

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
        ngOnInit() {
            const admin = this.cookieService.get('esAdmin').toString()
            console.log("AVEER")
            console.log(admin)
            if (admin != "true")
            {
                console.log("Ento AQUII LOCOOOOO")
                const roleId = Number.parseInt(this.cookieService.get('roleID'));
    
                this.servicioLogin.getPantallasDeRol(roleId).subscribe(pantallasPermitidas => {
                    console.log('ENTRO?')
                    const nombresPermitidos = new Set(pantallasPermitidas.map(pant => pant.pant_Descripcion.toLowerCase().trim()));
                    console.log('Los NOMBRES SON')
                    console.log(nombresPermitidos)
                    const filtrarSubitems = (subitems) => {
                        return subitems.filter(opcion => {
                            const nombreLowerCase = opcion.label.toLowerCase().trim();
                            return nombresPermitidos.has(nombreLowerCase);
                        });
                    };
    
                    this.model = this.menuCompleto
                        .map(section => {
                            const itemsFiltrados = section.items.map(subSection => {
                                const subItemsFiltrados = filtrarSubitems(subSection.items || []);
                                return {
                                    ...subSection,
                                    items: subItemsFiltrados
                                };
                            }).filter(subSection => subSection.items.length > 0);
    
                            return {
                                ...section,
                                items: itemsFiltrados
                            };
                        })
                        .filter(section => section.items.length > 0);
                });
    
    
            }
            else
            {
                this.model = this.menuCompleto;
    
            }
    
    
            }
        menuCompleto = [
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
                                routerLink: ['/generales/departamentos'],
                             
                            },
                            {
                                label: 'Municipios',
                                icon: 'pi pi-fw pi-directions',
                                routerLink: ['/generales/municipio']
                            },
                            {
                                label: 'Categorias',
                                icon: 'pi pi-fw pi-list',
                                routerLink: ['/generales/categoria']

                            },
                            {
                                label: 'Estados Civiles',
                                icon: 'pi pi-fw pi-heart',
                                routerLink: ['/generales/estado']
                            },
                            {
                                label: 'Clientes',
                                icon: 'pi pi-fw pi-users',
                                routerLink: ['/generales/cliente']

                            },
                            {

                                label: 'Cargos',
                                icon: 'pi pi-fw pi-key',
                                routerLink: ['/generales/cargo']

                            },
                            {
                                label: 'Marcas',
                                icon: 'pi pi-fw pi-truck',
                                routerLink: ['/generales/marca']

                            },

                            {
                                label: 'Materiales',
                                icon: 'pi pi-fw pi-inbox',
                                routerLink: ['/generales/material']

                            },

                            {
                                label: 'Proveedores',
                                icon: 'pi pi-fw pi-truck',
                                routerLink: ['/generales/proveedor']

                            },
                            {
                                label: 'Empleados',
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
                        ]
                    },
                ]

            },   {
                items: [
                    {
                        label: 'Reportes',
                        icon: 'pi pi-fw pi-chart-bar',
                        items: [
                            {
                                label: 'Control de stock',
                                icon: 'pi pi-fw pi-dollar',
                                routerLink: ['/reportes/stock']
                            },
                            {
                                label: 'Ventas por empleado',
                                icon: 'pi pi-fw pi-pencil',
                                routerLink: ['/reportes/empleado']
                            },
                            {
                                label: 'Ventas por mes',
                                icon: 'pi pi-fw pi-cart-plus',
                                routerLink: ['/mes']
                            },
                            {
                                label: 'Productos vendidos',
                                icon: 'pi pi-fw pi-download',
                                routerLink: ['/reportes/top']
                            },
                            {
                                label: 'Ventas Anuales',
                                icon: 'pi pi-fw pi-download',
                                routerLink: ['/reportes/anual']
                            },
                            {
                                label: 'Ventas mayoristas',
                                icon: 'pi pi-fw pi-download',
                                routerLink: ['/reportes/mayorista']
                            },
                        ]
                    },
                ]


            },
       

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

    



