import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription, debounceTime } from 'rxjs';
import { LayoutService } from 'src/app/layout/service/app.layout.service';
import { ServiceService } from 'src/app/Service/Graficos.service';
import { MaqJoyaMes, totalcate, MaquillajeMes } from 'src/app/Models/GraficosViewModel';
import ChartDataLabels from 'chartjs-plugin-datalabels';
import { Chart } from 'chart.js';
Chart.register(ChartDataLabels);

@Component({
    templateUrl: './chartsdemo.component.html'
})
export class ChartsDemoComponent implements OnInit, OnDestroy {
    pieData: any;
    pieData2: any;
    polarData: any;
    polarData2: any;

    polarOptions: any;
    MaqJoyaMes: MaqJoyaMes[];
    totalcate: totalcate[];

    fechaInicio: string = '';
    fechaFin: string = '';

    pieOptions: any;
    subscription: Subscription;

    constructor(public service: ServiceService, private layoutService: LayoutService) {
        this.subscription = this.layoutService.configUpdate$
            .pipe(debounceTime(25))
            .subscribe((config) => {
                this.actualizarGraficos();
            });
    }

    ngOnInit() {
        const fechaActual = new Date();
        const añoActual = fechaActual.getFullYear();
        this.fechaInicio = `${añoActual}-01-01`; 
        this.fechaFin = fechaActual.toISOString().slice(0, 10); 

        this.actualizarGraficos();

        const documentStyle = getComputedStyle(document.documentElement);
        const textColor = documentStyle.getPropertyValue('--text-color');

        this.pieOptions = {
            plugins: {
                legend: {
                    labels: {
                        usePointStyle: true,
                        color: textColor
                    }
                },
                datalabels: {
                    anchor: 'end',
                    align: 'start',
                    color: textColor,
                    formatter: (value, ctx) => ` ${value}`
                }
            }
        };
        this.polarOptions = {
            plugins: {
                legend: {
                    labels: {
                        color: textColor
                    }
                },
                datalabels: {
                    anchor: 'center',
                    align: 'center',
                    color: textColor,
                    formatter: (value, ctx) => `${value}`
                }
            },
            scales: {
                r: {
                    grid: {
                      
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

    actualizarGraficos() {
        const documentStyle = getComputedStyle(document.documentElement);

this.service.getcantidadvendidaanio(this.fechaInicio, this.fechaFin).subscribe(
    (data: totalcate[]) => {
        console.log("Datos recibidos para gráfico de dona:", data);

        const etiquetasPredeterminadas = ['Maquillaje', 'Joyas'];
        const cantidadesPredeterminadas: number[] = [0, 0];

        if (Array.isArray(data) && data.length >= 2) {
            cantidadesPredeterminadas[0] = Number(data[0].ventasMaquillaje) || 0;
            cantidadesPredeterminadas[1] = Number(data[1].ventasJoyas) || 0;
        }

        this.pieData = {
            labels: etiquetasPredeterminadas,
            datasets: [
                {
                    data: cantidadesPredeterminadas,
                    backgroundColor: [
                        documentStyle.getPropertyValue('--primary-500'),
                        documentStyle.getPropertyValue('--purple-400')
                    ],
                    hoverBackgroundColor: [
                        documentStyle.getPropertyValue('--primary-500'),
                        documentStyle.getPropertyValue('--purple-400')
                    ]
                }
            ]
        };
    },
    (error) => {
        console.error("Error al obtener los datos:", error);
    }
);


this.service.getotalmesescategorias(this.fechaInicio, this.fechaFin).subscribe(
    (data: MaqJoyaMes[]) => {
        console.log("Datos recibidos para gráfico de pastel:", data);

        const etiquetasPredeterminadas = ['Maquillaje', 'Joyas'];
        const cantidadesPredeterminadas: number[] = [0, 0];

        if (Array.isArray(data) && data.length >= 2) {
            cantidadesPredeterminadas[0] = Number(data[0].cantidad) || 0;
            cantidadesPredeterminadas[1] = Number(data[1].cantidad) || 0;
        }

        this.pieData2 = {
            labels: etiquetasPredeterminadas,
            datasets: [
                {
                    data: cantidadesPredeterminadas,
                    backgroundColor: [
                        documentStyle.getPropertyValue('--primary-500'),
                        documentStyle.getPropertyValue('--purple-400')
                    ],
                    hoverBackgroundColor: [
                        documentStyle.getPropertyValue('--primary-500'),
                        documentStyle.getPropertyValue('--purple-400')
                    ]
                }
            ]
        };
    },
    (error) => {
        console.error("Error al obtener los datos:", error);
    }
);


        this.service.top5maquillaje(this.fechaInicio, this.fechaFin).subscribe((data: MaquillajeMes[]) => {
            console.log("Datos recibidos para gráfico polar de maquillaje:", data);

            const etiquetasPredeterminadas = ["Producto 1", "Producto 2", "Producto 3", "Producto 4", "Producto 5"];
            const cantidadesPredeterminadas = [0, 0, 0, 0, 0];

            for (let i = 0; i < Math.min(data.length, 5); i++) {
                etiquetasPredeterminadas[i] = data[i].nombreProducto || `Producto ${i + 1}`;
                cantidadesPredeterminadas[i] = parseInt(data[i].totalVendido) || 0;
            }

            this.polarData = {
                datasets: [{
                    data: cantidadesPredeterminadas,
                    backgroundColor: [
                        documentStyle.getPropertyValue('--primary-500'),
                        documentStyle.getPropertyValue('--indigo-500'),
                        documentStyle.getPropertyValue('--purple-500'),
                        documentStyle.getPropertyValue('--teal-500'),
                        documentStyle.getPropertyValue('--orange-500')
                    ],
                    label: 'Datos'
                }],
                labels: etiquetasPredeterminadas
            };
        });

        this.service.top5joyas(this.fechaInicio, this.fechaFin).subscribe((data: MaquillajeMes[]) => {
            console.log("Datos recibidos para gráfico polar de joyas:", data);

            const etiquetasPredeterminadas = ["Producto 1", "Producto 2", "Producto 3", "Producto 4", "Producto 5"];
            const cantidadesPredeterminadas = [0, 0, 0, 0, 0];

            for (let i = 0; i < Math.min(data.length, 5); i++) {
                etiquetasPredeterminadas[i] = data[i].nombreProducto || `Producto ${i + 1}`;
                cantidadesPredeterminadas[i] = parseInt(data[i].totalVendido) || 0;
            }

            this.polarData2 = {
                datasets: [{
                    data: cantidadesPredeterminadas,
                    backgroundColor: [
                        documentStyle.getPropertyValue('--primary-500'),
                        documentStyle.getPropertyValue('--indigo-500'),
                        documentStyle.getPropertyValue('--purple-500'),
                        documentStyle.getPropertyValue('--teal-500'),
                        documentStyle.getPropertyValue('--orange-500')
                    ],
                    label: 'Datos'
                }],
                labels: etiquetasPredeterminadas
            };
        });
    }
}
