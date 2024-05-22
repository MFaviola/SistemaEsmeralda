import {  OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { LayoutService } from './service/app.layout.service';
import { CookieService } from 'ngx-cookie-service';
import { ServiceService } from '../Service/Roles.service';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MensajeViewModel } from '../Models/MensajeViewModel';
import { ConfirmationService, MessageService } from 'primeng/api';
import { DatePipe } from '@angular/common';
import { CajaEnviar, FillCajaCierre } from '../Models/DashboardViewModel';
import { C } from '@fullcalendar/core/internal-common';


@Component({
    selector: 'app-menu',
    templateUrl: './app.menu.component.html',
    providers: [ConfirmationService, MessageService,CookieService,DatePipe]
})
export class AppMenuComponent implements OnInit {
    dateDay = new Date();
    dateDayAnter = new Date();
    abrirCajaDialog: boolean = false;
    cerrarCajaDialog: boolean = false;
    model: any[] = [];
    viewModel2: CajaEnviar = new CajaEnviar();
    permisosPermitidos: Set<string> = new Set();
    prueba: boolean = false;
    subirCaja: boolean = false;
    CajaForm: FormGroup;
    MensajeViewModel!: MensajeViewModel[];
    CajaCerradaForm: FormGroup;
    TotalCajaCerrar: string = "0";
    Inicio: string = "0";
    CajaID : string = "0";
    submitted: boolean = false;
    validacion: string = "False";
    constructor(private datePipe: DatePipe,private servicioLogin: ServiceService, public layoutService: LayoutService, private cookieService: CookieService, private messageService: MessageService) { }

    ngOnInit() {
        this.dateDayAnter.setDate(this.dateDayAnter.getDate());
        const fechaA = this.datePipe.transform(this.dateDayAnter, 'yyyy-MM-dd');
        this.servicioLogin.getValidacion(fechaA, this.cookieService.get('SucursalID')).subscribe((data: FillCajaCierre[]) => {
        
        if (data.length <= 0 ) {
            this.validacion = "False"
        }else{
            this.validacion = data[0].caja_Finalizado;
        }
       

           
          } 
             
        
          )
        this.CajaCerradaForm = new FormGroup({
            caja_MontoFinal: new FormControl("", Validators.required),
            caja_Observacion: new FormControl("", Validators.required),
        });  
      
          this.CajaForm = new FormGroup({
            caja_MontoInicial: new FormControl("", Validators.required),
          });  

            this.crearMapeo();

       
    }

    crearMapeo(){
        const admin = this.cookieService.get('esAdmin').toString();
        if (admin != "true") {
            const roleId = Number.parseInt(this.cookieService.get('roleID'));
            this.servicioLogin.getPantallasDeRol(roleId).subscribe(pantallasPermitidas => {
                const nombresPermitidos = new Set(pantallasPermitidas.map(pant => pant.pant_Descripcion.toLowerCase().trim()));

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
                            const esEspecial = ['facturas', 'cerrar caja', 'abrir caja'].includes(subSection.label.toLowerCase().trim());

                            if (esEspecial) {
                                if (subSection.label.toLowerCase().trim() == 'facturas') {
                                    return  {
                                        ...subSection
                                    };
                                }
                              
                                 
                              
                               
                            }
                            if (subSection.label.toLowerCase().trim() == 'abrir caja' && this.validacion == "False") {
                                if (nombresPermitidos.has(subSection.label.toLowerCase().trim())) {
                                    return {
                                        ...subSection,
                                        command: () => this.openDialog(subSection.label.toLowerCase().trim())
                                    };
                                }
                                return null;
                            }
                            if (subSection.label.toLowerCase().trim() == 'cerrar caja' && this.validacion == "True") {
                                if (nombresPermitidos.has(subSection.label.toLowerCase().trim())) {
                                    return {
                                        ...subSection,
                                        command: () => this.openDialog(subSection.label.toLowerCase().trim())
                                    };
                                }
                                return null;
                            }
                            if (subItemsFiltrados.length > 0) {
                                return {
                                    ...subSection,
                                    items: subItemsFiltrados
                                };
                            }
                            return null;
                        }).filter(subSection => subSection !== null);

                        return {
                            ...section,
                            items: itemsFiltrados
                        };
                    })
                    .filter(section => section.items.length > 0);
            });
        } else {
            this.model = this.menuCompleto;
        }
    }
    openDialog(type: string) {
        if (type === 'abrir caja') {
            this.abrirCajaDialog = true;
        } else if (type === 'cerrar caja') {
            this.cerrarCajaDialog = true;
            this.dateDayAnter.setDate(this.dateDayAnter.getDate());
            const fechaA = this.datePipe.transform(this.dateDayAnter, 'yyyy-MM-dd');
            this.servicioLogin.getValidacion(fechaA, this.cookieService.get('SucursalID')).subscribe((data: FillCajaCierre[]) => {

                this.Inicio = data[0].caja_MontoInicial;
                this.CajaID = data[0].caja_Id;
                this.servicioLogin.getFacturasVentas(fechaA).subscribe(
                  (ventasData: any) => {
                    console.log('Ventas Data:', ventasData);
                    if (ventasData && ventasData.length > 0) {
                      const total = parseFloat(ventasData[0].total); 
                      this.TotalCajaCerrar = total.toFixed(2);
                      console.log('Total Caja Cerrar:', this.TotalCajaCerrar);
                    } 
                  },
                
                );
            
               
              } 
                 
            
              )
        }
    }


    onSubmitCaja() {
        if (this.CajaForm.valid) {
           this.viewModel2 = this.CajaForm.value;
           this.viewModel2.caja_UsuarioApertura = this.cookieService.get('ID_Usuario');
           this.viewModel2.Sucu_Id = this.cookieService.get('SucursalID');
           this.servicioLogin.EnviarAbierto(this.viewModel2).subscribe((data: MensajeViewModel[]) => {
            if(data["message"] == "Operación completada exitosamente."){
                this.ngOnInit();
                this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Puede continuar', life: 3000 });
                this.abrirCajaDialog = false;
                this.validacion = "True";
                this.crearMapeo();
            }else{
          
             this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se pudo cerrar:', life: 3000 });
            } 
         })
        
          
       
        }   
            else 
            {
                this.subirCaja = true;
            }
        }



        onSubmitCajaCerrada() {
           
            if (this.CajaCerradaForm.valid) {
               this.viewModel2 = this.CajaCerradaForm.value;
               this.viewModel2.caja_UsuarioCierre = this.cookieService.get('ID_Usuario');
               this.viewModel2.caja_Id = this.CajaID;
               const total = parseFloat(this.CajaCerradaForm.get('caja_MontoFinal').value) + parseFloat(this.Inicio);
               this.viewModel2.caja_MontoInicial = this.Inicio;
               this.viewModel2.caja_MontoFinal = total.toFixed(2)
               this.viewModel2.caja_MontoSistema = this.TotalCajaCerrar;
               this.servicioLogin.EnviarCierre(this.viewModel2).subscribe((data: MensajeViewModel[]) => {
                if(data["message"] == "Operación completada exitosamente."){
                    this.validacion = "False";
                    this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Puede operar', life: 3000 });
                    this.cerrarCajaDialog = false;
                    this.crearMapeo();
                
                }else{
              
                 this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se pudo cerrar:', life: 3000 });
                } 
             })
            
              
           
            }   
                else 
                {
                    this.submitted = true;
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
                            routerLink: ['/acceso/usuarios']
                        },
                        {
                            label: 'Roles',
                            icon: 'pi pi-fw pi-times-circle',
                            routerLink: ['/acceso/roles']
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
                            routerLink: ['/generales/municipios']
                        },
                        {
                            label: 'Categorias',
                            icon: 'pi pi-fw pi-list',
                            routerLink: ['/generales/categorias']
                        },
                        {
                            label: 'Estados Civiles',
                            icon: 'pi pi-fw pi-heart',
                            routerLink: ['/generales/estadosciviles']
                        },
                        {
                            label: 'Clientes',
                            icon: 'pi pi-fw pi-users',
                            routerLink: ['/generales/clientes']
                        },
                        {
                            label: 'Cargos',
                            icon: 'pi pi-fw pi-key',
                            routerLink: ['/generales/cargos']
                        },
                        {
                            label: 'Marcas',
                            icon: 'pi pi-fw pi-bookmark-fill',
                            routerLink: ['/generales/marcas']
                        },
                        {
                            label: 'Materiales',
                            icon: 'pi pi-fw pi-inbox',
                            routerLink: ['/generales/materiales']
                        },
                        {
                            label: 'Proveedores',
                            icon: 'pi pi-fw pi-truck',
                            routerLink: ['/generales/proveedores']
                        },
                        {
                            label: 'Empleados',
                            icon: 'pi pi-fw pi-user',
                            routerLink: ['/generales/empleados']
                        },
                        {
                            label: 'Sucursales',
                            icon: 'pi pi-fw pi-building',
                            routerLink: ['/generales/sucursales']
                        },
                    ]
                },
            ]
        },
        {
            items: [
                {
                    label: 'Ventas',
                    icon: 'pi pi-fw pi-shopping-bag',
                    items: [
                        {
                            label: 'Joyas',
                            icon: 'pi pi-fw pi-dollar',
                            routerLink: ['/venta/joyas']
                        },
                        {
                            label: 'Maquillajes',
                            icon: 'pi pi-fw pi-pencil',
                            routerLink: ['/venta/maquillajes']
                        },
                        {
                            label: 'Facturas',
                            icon: 'pi pi-fw pi-cart-plus',
                            routerLink: ['/venta/facturas']
                        },
                        {
                            label: 'Facturas de Compra',
                            icon: 'pi pi-fw pi-calculator',
                            routerLink: ['/venta/facturasdecompra']
                        },
                        {
                            label: 'Transferencias',
                            icon: 'pi pi-fw pi-sort-alt',
                            routerLink: ['/venta/transferencias']
                        },
                    ]
                },
            ]
        },
        {
            items: [
                {
                    label: 'Reportes',
                    icon: 'pi pi-fw pi-chart-bar',
                    items: [
                        {
                            label: 'Reporte de caja',
                            icon: 'pi pi-fw pi-inbox',
                            routerLink: ['/reportes/reportedecaja']
                        },
                        {
                            label: 'Ventas por pago',
                            icon: 'pi pi-fw pi-money-bill',
                            routerLink: ['/reportes/ventasporpago']
                        },
                        {
                            label: 'Control de stock',
                            icon: 'pi pi-fw pi-bars',
                            routerLink: ['/reportes/controldestock']
                        },
                        {
                            label: 'Ventas por empleado',
                            icon: 'pi pi-fw pi-user-plus',
                            routerLink: ['/reportes/ventasporempleado']
                        },
                        {
                            label: 'Ventas por mes',
                            icon: 'pi pi-fw pi-shopping-bag',
                            routerLink: ['/reportes/ventaspormes']
                        },
                        {
                            label: 'Productos vendidos',
                            icon: 'pi pi-fw pi-percentage',
                            routerLink: ['/reportes/productosvendidos']
                        },
                        {
                            label: 'Ventas Anuales',
                            icon: 'pi pi-fw pi-wallet',
                            routerLink: ['/reportes/ventasanuales']
                        },
                        {
                            label: 'Ventas mayoristas',
                            icon: 'pi pi-fw pi-dollar',
                            routerLink: ['/reportes/ventasmayoristas']
                        },
                    ]
                },
            ]
        },
        {
            items: [
                {
                    label: 'Graficos',
                    icon: 'pi pi-fw pi-chart-pie',
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
        {
            items: [
                {
                    label: 'Facturas',
                    icon: 'pi pi-fw pi-shopping-cart',
                    routerLink: ['/facturas']
                },
            ]
        },
        {
            items: [
                {
                    label: 'Cerrar Caja',
                    icon: 'pi pi-fw pi-briefcase',
                    command: () => this.openDialog('cerrar caja')
                },
            ]
        },
        {
            items: [
                {
                    label: 'Abrir Caja',
                    icon: 'pi pi-fw pi-inbox',
                    command: () => this.openDialog('abrir caja')
                },
            ]
        },
    ];
}

