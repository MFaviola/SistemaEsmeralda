import { Component, OnInit, OnDestroy } from '@angular/core';
import { MenuItem, MessageService } from 'primeng/api';
import { Product } from '../../api/product';
import { ProductService } from '../../service/product.service';
import { Subscription, debounceTime } from 'rxjs';
import { LayoutService } from 'src/app/layout/service/app.layout.service';
import { ServiceService } from 'src/app/Service/Graficos.service';

import { Productos, MaquillajeMes, JoyaMes, MaqJoyaMes,totalJo,totalMa,totalanual} from 'src/app/Models/GraficosViewModel';
import { dA } from '@fullcalendar/core/internal-common';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { CookieService } from 'ngx-cookie-service';
import { DatePipe } from '@angular/common';
import { CajaEnviar, Fill } from 'src/app/Models/DashboardViewModel';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';

@Component({
    templateUrl: './dashboard.component.html',
    providers: [CookieService,DatePipe, MessageService]
})
export class DashboardComponent implements OnInit, OnDestroy {

    items!: MenuItem[];
    CajaForm: FormGroup;
    products!: Product[];
    maquillajeMes:MaquillajeMes[];
    JoyaMes:JoyaMes[];
    MaqJoyaMes:MaqJoyaMes[];
    totalMa:totalMa[];
    totalJo: totalJo[];
    viewModel: CajaEnviar = new CajaEnviar();
   Top1:string;
   Catidad1:string ="";
   Top2:string;
   Catidad2: string;
   Top3:string;
   Catidad3: string ="";
   Top4:string;
   Catidad4: string;
   Top5:string;
   Catidad5: string;
   CantTop3: boolean = true;
porcentaje1: number;
totalanual: totalanual[];

 totalVendido1 : string;
 totalVendido2 : string;
totalfinalma: string;
totalfinaljo : string;
   Topm1:string;
   Catidadm1: string;
   Topm2:string;
   Catidadm2: string;
   Topm3:string;
   Catidadm3: string;
   Topm4:string;
   Catidadm4: string;
   Topm5:string;
   Catidadm5: string;

total1:string;
total2:string;
total3:string;
total4:string;
total5:string;
total6:string;
total7:string;
total8:string;
total9:string;
total10:string;
total11:string;
total12:string;
total13:string;
    pieData: any;
    Productos: Productos[];
    chartData: any;
    pieOptions: any;
    chartOptions: any;

    subscription!: Subscription;
    top1: String = "arreglo[0]";
    cantidadTop1: Number = 30;
    ConfirmarPago: boolean = false;

    dateDay = new Date();
    conversion: string;
    Total = "0";
    Inicio = "0";
    CajaID = "0";
    Usua_Id: string = this.cookie.get('ID_Usuario');

    Actualizar: string = "";
  
    submitted: boolean = false;


    Sucu_Id: string = this.cookie.get('SucursalID');





    constructor(private messageService: MessageService,private productService: ProductService, public service:ServiceService,private cookie: CookieService, private datePipe: DatePipe,public layoutService: LayoutService) {
        this.subscription = this.layoutService.configUpdate$
        .pipe(debounceTime(25))
        .subscribe((config) => {
            this.initChart();
        });
    }

    ngOnInit() {
        this.CajaForm = new FormGroup({
            caja_MontoFinal: new FormControl("", Validators.required),
            caja_Observacion: new FormControl("", Validators.required),
        });  
        this.dateDay.setDate(this.dateDay.getDate() - 1);
        const fechaC = this.datePipe.transform(this.dateDay, 'yyyy-MM-dd')
        this.service.getValidacion(fechaC, this.Sucu_Id).subscribe((data: Fill[]) => {
            this.Inicio = data[0].caja_MontoInicial;
            this.CajaID = data[0].caja_Id;
            if (data.length > 2) {
                const cajaSinCerrar = data.some(item => item.caja_FechaCierre === null);
                this.ConfirmarPago = cajaSinCerrar;
            } else {
              
                this.ConfirmarPago = false;
            }
           

        })


        this.service.getFacturasDetalle(fechaC).subscribe((data: any)=>{
            const total = data.reduce((sum, item) => {
              const itemTotal = parseFloat(item.total) || 0; 
              return sum + itemTotal;
          }, 0);
            this.Total = total;
            console.log("El total eees" + this.Total);
            });
            




        this.initChart();
        this.productService.getProductsSmall().then(data => this.products = data);

        this.service.getproducto().subscribe((data: Productos[]) => {
            console.log(data);
            this.Productos = data;


            
        });

      


        
        this.service.getMaquillajemes().subscribe({
            next: (data: MaquillajeMes[]) => {
               this.Top1 = data[0].nombreProducto,
               this.Catidad1 = data[0].totalVendido,
               this.Top2 = data[1].nombreProducto,
               this.Catidad2 = data[1].totalVendido,
               this.Top3 = data[2].nombreProducto,
               this.Catidad3 = data[2].totalVendido,
               this.Top4 = data[3].nombreProducto,
               this.Catidad4 = data[3].totalVendido,
               this.Top5 = data[4].nombreProducto,
               this.Catidad5 = data[4].totalVendido
           
            }
          
         
        });
        console.log("estaaa"+this.Catidad1)
        if(this.Catidad3  == null){
          this.CantTop3 = false;
         }
          this.porcentaje1 = (parseInt(this.Catidad1) /100)* 100;







          this.service.getJoyas().subscribe({
            next: (data: JoyaMes[]) => {
               this.Topm1 = data[0].nombreProducto,
               this.Catidadm1 = data[0].totalVendido,
               this.Topm2 = data[1].nombreProducto,
               this.Catidadm2 = data[1].totalVendido,
               this.Topm3 = data[2].nombreProducto,
               this.Catidadm3 = data[2].totalVendido,
               this.Topm4 = data[3].nombreProducto,
               this.Catidadm4 = data[3].totalVendido,
               this.Topm5 = data[4].nombreProducto,
               this.Catidadm5 = data[4].totalVendido
               
            }
          });

     








          this.service.getto().subscribe({
            next: (data: totalanual[]) => {
               this.total1 = data[0].totalVentas,
               this.total2 = data[1].totalVentas,
               this.total3 = data[2].totalVentas,
               this.total4 = data[3].totalVentas,
               this.total5 = data[4].totalVentas,
               this.total6 = data[5].totalVentas,
               this.total7 = data[6].totalVentas,
               this.total8 = data[7].totalVentas,
               this.total9 = data[8].totalVentas,
               this.total10 = data[9].totalVentas,
               this.total11 = data[10].totalVentas,
               this.total12 = data[11].totalVentas,
               this.total13 = data[12].totalVentas
               
            }
          });










        // this.service.getMaquioJoya().subscribe((data: MaqJoyaMes[]) => {
        //     console.log(data);
        //     this.MaqJoyaMes = data;


            
        // });




        
        this.service.getMaquioJoya().subscribe((data: MaqJoyaMes[]) => {
            console.log(data);
            this.MaqJoyaMes = data;

            this.totalVendido1 = data[0].cantidad;
            this.totalVendido2 = data[1].cantidad;
            
   
        });
   






        
        this.service.gettm().subscribe((data: totalMa[]) => {
            console.log(data);
            this.totalMa = data;

         
            this.totalfinalma = data[0].totalFinal
   
        });
   
  
        this.service.gettj().subscribe((data: totalJo[]) => {
          
            this.totalJo = data;

         
            this.totalfinaljo = data[0].totalFinal
            console.log("el total"+this.totalfinaljo)

        });
   




    }


    onSubmit() {
        if (this.CajaForm.valid) {
           this.viewModel = this.CajaForm.value;
           this.viewModel.caja_UsuarioCierre = this.Usua_Id;
           this.viewModel.caja_Id = this.CajaID;
           this.viewModel.caja_MontoInicial = this.Inicio
           this.viewModel.caja_MontoSistema = this.Total;
           this.service.EnviarCierre(this.viewModel).subscribe((data: MensajeViewModel[]) => {
            if(data["message"] == "Operación completada exitosamente."){
                this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Puede continuar', life: 3000 });
                this.ConfirmarPago = false;
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



   


    initChart() {
        
        const documentStyle = getComputedStyle(document.documentElement);
        const textColor = documentStyle.getPropertyValue('--text-color');
        const textColorSecondary = documentStyle.getPropertyValue('--text-color-secondary');
        const surfaceBorder = documentStyle.getPropertyValue('--surface-border');


        this.chartOptions = {
            plugins: {
                legend: {
                    labels: {
                        color: textColor
                    }
                }
            },
            scales: {
                x: {
                    ticks: {
                        color: textColorSecondary
                    },
                    grid: {
                        color: surfaceBorder,
                        drawBorder: false
                    }
                },
                y: {
                    ticks: {
                        color: textColorSecondary
                    },
                    grid: {
                        color: surfaceBorder,
                        drawBorder: false
                    }
                }
            }
        };


       
   
        this.pieData = {
            
            labels: ['Joyas', 'Maquillaje' ],
            datasets: [
                {
                    data: [this.totalfinaljo, this.totalfinalma],
                    
                    backgroundColor: [
                        documentStyle.getPropertyValue('--indigo-500'),
                        documentStyle.getPropertyValue('--bluegray-700'),
                        documentStyle.getPropertyValue('--teal-500')
                    ],
                    hoverBackgroundColor: [
                        documentStyle.getPropertyValue('--indigo-400'),
                        documentStyle.getPropertyValue('--bluegray-700'),
                        documentStyle.getPropertyValue('--teal-400')
                    ]
                    
                }]
               
        };
 

        this.pieOptions = {
            plugins: {
                legend: {
                    labels: {
                        usePointStyle: true,
                        color: textColor
                    }
                }
            }
        };

    }


    





























//     this.service.getMaquioJoya().subscribe((data: MaqJoyaMes[]) => {
       
//         this.MaqJoyaMes = data;

//         const totalVendidoe1 = data[0].cantidad;
//         const totalVendido2e = data[1].cantidad;
        

//     this.pieData = {
//         labels: ['Joyas', 'Maquillaje' ],
//         datasets: [
//             {
//                 data: [totalVendidoe1, totalVendido2e],
//                 backgroundColor: [
//                     documentStyle.getPropertyValue('--indigo-500'),
//                     documentStyle.getPropertyValue('--bluegray-700'),
//                     documentStyle.getPropertyValue('--teal-500')
//                 ],
//                 hoverBackgroundColor: [
//                     documentStyle.getPropertyValue('--indigo-400'),
//                     documentStyle.getPropertyValue('--bluegray-700'),
//                     documentStyle.getPropertyValue('--teal-400')
//                 ]
//             }]
//     };
// });

//     this.pieOptions = {
//         plugins: {
//             legend: {
//                 labels: {
//                     usePointStyle: true,
//                     color: textColor
//                 }
//             }
//         }
//     };

// }









    

    ngOnDestroy() {
        if (this.subscription) {
            this.subscription.unsubscribe();
        }
    }
}
