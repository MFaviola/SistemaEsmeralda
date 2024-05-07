import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription, debounceTime } from 'rxjs';
import { LayoutService } from 'src/app/layout/service/app.layout.service';
import { Productos, MaquillajeMes, JoyaMes, MaqJoyaMes,totalJo,totalMa, totalanual,totalcate} from 'src/app/Models/GraficosViewModel';
import { ServiceService } from 'src/app/Service/Graficos.service';




@Component({
    templateUrl: './chartsdemo.component.html'
})
export class ChartsDemoComponent implements OnInit, OnDestroy {

    lineData: any;

    barData: any;

    pieData: any;
    pieData2: any;
    maquillajeMes:MaquillajeMes[];
    JoyaMes:JoyaMes[];
    polarData: any;
    polarData2: any;
    totalfinalma: string ="";
    totalfinaljo : string="";
    radarData: any;
    totalanual: totalanual[];
    lineOptions: any;
    totalcate:totalcate[];
    barOptions: any;
    MaqJoyaMes:MaqJoyaMes[];
    pieOptions: any;
    totalMa:totalMa[];
    totalJo: totalJo[];
    totalVendido1 : string;
    totalVendido2 : string;
    polarOptions: any;
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
    radarOptions: any;


    subscription: Subscription;
    constructor(public service:ServiceService,private layoutService: LayoutService) {
        this.subscription = this.layoutService.configUpdate$
            .pipe(debounceTime(25))
            .subscribe((config) => {
                this.initCharts();
            });
    }

    ngOnInit() {


        this.service.gettm().subscribe((data: totalMa[]) => {
        
            this.totalMa = data;

         
            this.totalfinalma = data[0].totalFinal
   
        });
   



        this.service.getMaquillajemes().subscribe((data: MaquillajeMes[]) => {
            // this.service.getMaquillajemes().subscribe({
            //     next: (data: MaquillajeMes[]) => {
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


                });
  
        this.service.gettj().subscribe((data: totalJo[]) => {
          
            this.totalJo = data;

         
            this.totalfinaljo = data[0].totalFinal
          
        });
        this.initCharts();


        
    }

    initCharts() {
        const documentStyle = getComputedStyle(document.documentElement);
        const textColor = documentStyle.getPropertyValue('--text-color');
        const textColorSecondary = documentStyle.getPropertyValue('--text-color-secondary');
        const surfaceBorder = documentStyle.getPropertyValue('--surface-border');
        




        
         
        this.service.gettc().subscribe((data: totalcate[]) => {
       
            this.totalcate = data;
console.log("estaaaa necesito",data)
            const totalj1 = data[0].ventasJoyas;
            const totalm1 = data[0].ventasMaquillaje;
            
            const totalj2 = data[1].ventasJoyas;
            const totalm2 = data[1].ventasMaquillaje;

            const totalj3 = data[2].ventasJoyas;
            const totalm3 = data[2].ventasMaquillaje;

            const totalj4 = data[3].ventasJoyas;
            const totalm4 = data[3].ventasMaquillaje;

            const totalj5 = data[4].ventasJoyas;
            const totalm5 = data[4].ventasMaquillaje;

            const totalj6 = data[5].ventasJoyas;
            const totalm6 = data[5].ventasMaquillaje;

            const totalj7 = data[6].ventasJoyas;
            const totalm7 = data[6].ventasMaquillaje;

            const totalj8 = data[7].ventasJoyas;
            const totalm8 = data[7].ventasMaquillaje;

            const totalj9 = data[8].ventasJoyas;
            const totalm9 = data[8].ventasMaquillaje;

            const totalj10 = data[9].ventasJoyas;
            const totalm10 = data[9].ventasMaquillaje;

            const totalj11 = data[10].ventasJoyas;
            const totalm11 = data[10].ventasMaquillaje;

            const totalj12 = data[11].ventasJoyas;
            const totalm12= data[11].ventasMaquillaje;

       
       

        
        this.barData = {
            labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre',],
            datasets: [
                {
                    label: 'Joyas',
                    backgroundColor: documentStyle.getPropertyValue('--primary-500'),
                    borderColor: documentStyle.getPropertyValue('--primary-500'),
                    data: [totalj1, totalj2, totalj3, totalj4, totalj5, totalj6, totalj7,totalj8,totalj9,totalj10,totalj11,totalj12]
                },
                {
                    label: 'Maquillaje',
                    backgroundColor: documentStyle.getPropertyValue('--purple-500'),
                    borderColor: documentStyle.getPropertyValue('--primary-200'),
                    data: [totalm1, totalm2, totalm3, totalm4, totalm5, totalm6, totalm7,totalm8,totalm9,totalm10,totalm11,totalm12]
                }
            ]
        };
        });
        this.barOptions = {
            plugins: {
                legend: {
                    labels: {
                        fontColor: textColor
                    }
                }
            },
            scales: {
                x: {
                    ticks: {
                        color: textColorSecondary,
                        font: {
                            weight: 500
                        }
                    },
                    grid: {
                        display: false,
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
                },
            }
        };

        this.service.getMaquioJoya().subscribe((data: MaqJoyaMes[]) => {
          
            this.MaqJoyaMes = data;

            const totalVendidoe1 = data[0].cantidad;
            const totalVendido2e = data[1].cantidad;
   

 
 




   

        this.pieData = {
            labels: ['Maquillaje', 'Joyas'],
            datasets: [
                {
                    
                    data: [ this.totalfinaljo ,  this.totalfinalma ],
                    backgroundColor: [
                        documentStyle.getPropertyValue('--primary-500'),
                        documentStyle.getPropertyValue('--purple-400'),
                        documentStyle.getPropertyValue('--teal-500')
                    ],
                    hoverBackgroundColor: [
                        documentStyle.getPropertyValue('--primary-500'),
                        documentStyle.getPropertyValue('--purple-400'),
                        documentStyle.getPropertyValue('--teal-400')
                    ]
                }]
        };
    }) 


















    this.service.getMaquioJoya().subscribe((data: MaqJoyaMes[]) => {
  
        this.MaqJoyaMes = data;

        const totalVendidoe1 = data[0].cantidad;
        const totalVendido2e = data[1].cantidad;

    this.pieData2 = {
        labels: ['Maquillaje', 'Joyas'],
        datasets: [
            {
                
                data: [ totalVendidoe1 , totalVendido2e ],
                backgroundColor: [
                    documentStyle.getPropertyValue('--primary-500'),
                    documentStyle.getPropertyValue('--purple-500'),
                    documentStyle.getPropertyValue('--teal-500')
                ],
                hoverBackgroundColor: [
                    documentStyle.getPropertyValue('--primary-500'),
                    documentStyle.getPropertyValue('--purple-400'),
                    documentStyle.getPropertyValue('--teal-400')
                ]
            }]
    };
}) 


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




         
        this.service.getto().subscribe((data: totalanual[]) => {
       
            this.totalanual = data;

            const total1 = data[0].totalVentas;
            const total2 = data[1].totalVentas;
            const total3 = data[2].totalVentas;
            const total4 = data[3].totalVentas;
            const total5 = data[4].totalVentas;
            const total6 = data[5].totalVentas;
            const total7 = data[6].totalVentas;
            const total8 = data[7].totalVentas;
            const total9 = data[8].totalVentas;
            const total10 = data[9].totalVentas;
            const total11 = data[10].totalVentas;
            const total12 = data[11].totalVentas;
            const total13 = data[12].totalVentas;

        
        this.lineData = {
            labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
            datasets: [
                {
                    label: 'Total',
                    data: [total1, total2, total3, total4, total5, total6, total7,total8,total9,total10,total11,total12],
                    fill: false,
                    backgroundColor: documentStyle.getPropertyValue('--primary-500'),
                    borderColor: documentStyle.getPropertyValue('--primary-500'),
                    tension: .4
                },
                //  {
                //      label: 'Second Dataset',
                //      data: [28, 48, 40, 19, 86, 27, 90],
                //      fill: false,
                //  backgroundColor: documentStyle.getPropertyValue('--primary-200'),
                //      borderColor: documentStyle.getPropertyValue('--primary-200'),
                //      tension: .4
                //  }
            ]
        };

        })


        this.lineOptions = {
            plugins: {
                legend: {
                    labels: {
                        fontColor: textColor
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
                },
            }
        };

///////////////////////////////////////////////////////////////////


this.service.getMaquillajemes().subscribe((data: MaquillajeMes[]) => {
    console.log("tops",data)
        // this.service.getMaquillajemes().subscribe({
        //     next: (data: MaquillajeMes[]) => {
         
               const Top1 = data[0].nombreProducto;
               const Catidad1 = data[0].totalVendido;
               const Top2 = data[1].nombreProducto;
               const Catidad2 = data[1].totalVendido;
               const Top3 = data[2].nombreProducto;
               const Catidad3 = data[2].totalVendido;
               const Top4 = data[3].nombreProducto;
               const Catidad4 = data[3].totalVendido;
               const Top5 = data[4].nombreProducto;
               const Catidad5 = data[4].totalVendido
  console.log("top1" +Top1)



        this.polarData = {
           
            datasets: [{
                data: [



                    Catidad1,
                    Catidad2,
                    Catidad3,
                    Catidad4,
                    Catidad5
                   
                ],
                backgroundColor: [
                    documentStyle.getPropertyValue('--primary-500'),

                    documentStyle.getPropertyValue('--indigo-500'),
                    documentStyle.getPropertyValue('--purple-500'),
                    documentStyle.getPropertyValue('--teal-500'),
                    documentStyle.getPropertyValue('--orange-500')

                ],
                label: 'Datos'
            }],
            labels: [
                Top1,
                Top2,
                Top3,
            Top4,
                Top5 
               
            ]
        };


    });










    this.service.getJoyas().subscribe((data: JoyaMes[]) => {
        console.log("tops",data)
            // this.service.getMaquillajemes().subscribe({
            //     next: (data: MaquillajeMes[]) => {
             
                   const Top1 = data[0].nombreProducto;
                   const Catidad1 = data[0].totalVendido;
                   const Top2 = data[1].nombreProducto;
                   const Catidad2 = data[1].totalVendido;
                   const Top3 = data[2].nombreProducto;
                   const Catidad3 = data[2].totalVendido;
                   const Top4 = data[3].nombreProducto;
                   const Catidad4 = data[3].totalVendido;
                   const Top5 = data[4].nombreProducto;
                   const Catidad5 = data[4].totalVendido
      console.log("top1" +Top1)
    
    
    
            this.polarData2 = {
               
                datasets: [{
                    data: [
    
    
    
                        Catidad1,
                        Catidad2,
                        Catidad3,
                        Catidad4,
                        Catidad5
                       
                    ],
                    backgroundColor: [
                        documentStyle.getPropertyValue('--primary-500'),
    
                        documentStyle.getPropertyValue('--indigo-500'),
                        documentStyle.getPropertyValue('--purple-500'),
                        documentStyle.getPropertyValue('--teal-500'),
                        documentStyle.getPropertyValue('--orange-500')
    
                    ],
                    label: 'Datos'
                }],
                labels: [
                    Top1,
                    Top2,
                    Top3,
                Top4,
                    Top5 
                   
                ]
            };
    
    
        });
    
















        this.polarOptions = {
            plugins: {
                legend: {
                    labels: {
                        color: textColor
                    }
                }
            },
            scales: {
                r: {
                    grid: {
                        color: surfaceBorder
                    }
                }
            }
        };


       
            //    this.service.getto().subscribe((data: totalanual[]) => {
       
            //     this.totalanual = data;
    
            //     const total1 = data[0].totalVentas;
            //     const total2 = data[1].totalVentas;
            //     const total3 = data[2].totalVentas;
            //     const total4 = data[3].totalVentas;
            //     const total5 = data[4].totalVentas;
            //     const total6 = data[5].totalVentas;
            //     const total7 = data[6].totalVentas;
            //     const total8 = data[7].totalVentas;
            //     const total9 = data[8].totalVentas;
            //     const total10 = data[9].totalVentas;
            //     const total11 = data[10].totalVentas;
            //     const total12 = data[11].totalVentas;
            //     const total13 = data[12].totalVentas;




        this.radarData = {
            labels: ['Eating', 'Drinking', 'Sleeping', 'Designing', 'Coding', 'Cycling', 'Running'],
            datasets: [
                {
                    label: 'My First dataset',
                    borderColor: documentStyle.getPropertyValue('--indigo-400'),
                    pointBackgroundColor: documentStyle.getPropertyValue('--indigo-400'),
                    pointBorderColor: documentStyle.getPropertyValue('--indigo-400'),
                    pointHoverBackgroundColor: textColor,
                    pointHoverBorderColor: documentStyle.getPropertyValue('--indigo-400'),
                    data: [65, 59, 90, 81, 56, 55, 40]
                },
                {
                    label: 'My Second dataset',
                    borderColor: documentStyle.getPropertyValue('--purple-400'),
                    pointBackgroundColor: documentStyle.getPropertyValue('--purple-400'),
                    pointBorderColor: documentStyle.getPropertyValue('--purple-400'),
                    pointHoverBackgroundColor: textColor,
                    pointHoverBorderColor: documentStyle.getPropertyValue('--purple-400'),
                    data: [28, 48, 40, 19, 96, 27, 100]
                }
            ]
        };





        this.radarOptions = {
            plugins: {
                legend: {
                    labels: {
                        fontColor: textColor
                    }
                }
            },
            scales: {
                r: {
                    grid: {
                        color: textColorSecondary
                    }
                }
            }
        };
    }

    ngOnDestroy() {
        if (this.subscription) {
            this.subscription.unsubscribe();
        }
    }
    
}
