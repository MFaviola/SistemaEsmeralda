import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription, debounceTime } from 'rxjs';
import { LayoutService } from 'src/app/layout/service/app.layout.service';
import { Productos, MaquillajeMes, JoyaMes, MaqJoyaMes,totalJo,totalMa, totalanual,totalcate} from 'src/app/Models/GraficosViewModel';
import { ServiceService } from 'src/app/Service/Graficos.service';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';




@Component({
    templateUrl: './chartsanualesdemo.component.html'
})
export class ChartsDemoComponent implements OnInit, OnDestroy {

    lineData: any;
    cForm: FormGroup;

    barData: any;
    submitted: boolean = false;
    pieData: any;
    pieData2: any;
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
   año : number;

   Top4:string;
   Catidad4: string;
   Top5:string;
   Catidad5: string;
    radarOptions: any;
fechi: string;
    Fecha: string;
    fechaInicio: string;
    fechaFin: string;
    subscription: Subscription;



    availableYears: number[] = [];
    selectedYear: number | null = null;


    constructor(public service: ServiceService, private layoutService: LayoutService) {
        this.subscription = this.layoutService.configUpdate$
            .pipe(debounceTime(25))
            .subscribe((config) => {
                this.actualizarGrafico();
                this.initCharts();
               

            });

    }
    actualizarGrafico() {

        if (!this.selectedYear) {
            return;
        }

        this.service.getcategoriatotal(this.selectedYear.toString()).subscribe(
            (data: totalcate[]) => {
                console.log("Datos recibidos:", data);

                if (Array.isArray(data) && data.length >= 12) {
                    const totalj = [];
                    const totalm = [];

                    for (let i = 0; i < 12; i++) {
                        totalj.push(data[i].ventasJoyas);
                        totalm.push(data[i].ventasMaquillaje);
                    }

                    const documentStyle = getComputedStyle(document.documentElement);
                    this.barData = {
                        labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                        datasets: [
                            {
                                label: 'Joyas',
                                backgroundColor: documentStyle.getPropertyValue('--primary-500'),
                                borderColor: documentStyle.getPropertyValue('--primary-500'),
                                data: totalj
                            },
                            {
                                label: 'Maquillaje',
                                backgroundColor: documentStyle.getPropertyValue('--purple-500'),
                                borderColor: documentStyle.getPropertyValue('--primary-200'),
                                data: totalm
                            }
                        ]
                    };
                } else {
                    console.error("La respuesta no contiene suficientes datos o no es un arreglo.");
                }
            },
            (error) => {
                console.error("Error al obtener los datos:", error);
            }
        );







        this.service.getventasporcategoria(this.selectedYear.toString()).subscribe(
            (data: totalanual[]) => {
                console.log("Datos recibidos:", data);
                const documentStyle = getComputedStyle(document.documentElement);

                if (Array.isArray(data) && data.length >= 12) {
                    this.totalanual = data;
        
                    const total = [];
        
                    for (let i = 0; i < 12; i++) {
                        total.push(data[i].totalVentas);
                    }
                            this.lineData = {
                        labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                        datasets: [
                            {
                                label: 'Total',
                                data: total,
                                fill: false,
                                backgroundColor: documentStyle.getPropertyValue('--primary-500'),
                                borderColor: documentStyle.getPropertyValue('--primary-500'),
                                tension: 0.4
                            }
                        ]
                    };
                } else {
                    console.error("La respuesta no contiene suficientes datos o no es un arreglo.");
                }
            },
            (error) => {
                console.error("Error al obtener los datos:", error);
            }
        );





        this.service.getcantidadvendidaanio(this.fechi, this.fechi).subscribe((data: any) => {
          
            this.MaqJoyaMes = data;
            console.log("Jos",this.MaqJoyaMes)
            const totalVendidoe1 = data[0].cantidad;
            const totalVendido2e = data[1].cantidad;
   
            const documentStyle = getComputedStyle(document.documentElement);

        this.pieData = {
            labels: ['Maquillaje', 'Joyas'],
            datasets: [
                {
                    
                    data: [ totalVendidoe1 ,  totalVendido2e ],
                    backgroundColor: [
                        documentStyle.getPropertyValue('--primary-500'),
                        documentStyle.getPropertyValue('--purple-400'),
                    ],
                    hoverBackgroundColor: [
                        documentStyle.getPropertyValue('--primary-500'),
                        documentStyle.getPropertyValue('--purple-400'),
                    ]
                }]
        };
    }) 






        
    }





    
    ngOnInit() {
        const fechaActual = new Date().toISOString().slice(0, 10);
        this.año=2024;
        this.fechaInicio = fechaActual;
        
        this.fechaFin = fechaActual;


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

        const startYear = 2015;
        const endYear = new Date().getFullYear();
        for (let year = startYear; year <= endYear; year++) {
            this.availableYears.push(year);
        }

        this.selectedYear = endYear; 
        this.actualizarGrafico(); 



        this.initCharts();


        
    }

    fehca(event: Event){
        // this.fechi = (<HTMLInputElement>event.target).value
        this.fechi = (event.target as HTMLInputElement).value
        console.log("fecha",this.fechi)

    }









    initCharts() {
        const documentStyle = getComputedStyle(document.documentElement);
        const textColor = documentStyle.getPropertyValue('--text-color');
        const textColorSecondary = documentStyle.getPropertyValue('--text-color-secondary');
        const surfaceBorder = documentStyle.getPropertyValue('--surface-border');
        


     
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




        this.service.getventasporcategoria(this.año.toString()).subscribe(
            (data: totalanual[]) => {
                console.log("Datos recibidos:", data);
        
                if (Array.isArray(data) && data.length >= 12) {
                    this.totalanual = data;
        
                    const total = [];
        
                    for (let i = 0; i < 12; i++) {
                        total.push(data[i].totalVentas);
                    }
                            this.lineData = {
                        labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                        datasets: [
                            {
                                label: 'Total',
                                data: total,
                                fill: false,
                                backgroundColor: documentStyle.getPropertyValue('--primary-500'),
                                borderColor: documentStyle.getPropertyValue('--primary-500'),
                                tension: 0.4
                            }
                        ]
                    };
                } else {
                    console.error("La respuesta no contiene suficientes datos o no es un arreglo.");
                }
            },
            (error) => {
                console.error("Error al obtener los datos:", error);
            }
        );


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


