import { Component, OnInit } from '@angular/core';
import { YService } from '../../venta/Impresion/impresion.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { BASE_URL } from 'src/app/Service/ulrsettings';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
@Component({
  templateUrl: './reportepormes.component.html',
  providers: [YService]
})

export class reportepormesComponent implements OnInit  {
  pdfSrc: SafeResourceUrl | null = null;
  Reporte_1: boolean = false;
  Reporte_2: boolean = false;
  municipioForm: FormGroup;
  selectedYear: number;
  constructor(private yService: YService, private sanitizer: DomSanitizer) { }

  ngOnInit(): void {

  }

  

  
}
