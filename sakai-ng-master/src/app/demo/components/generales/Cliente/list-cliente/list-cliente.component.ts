import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Cliente } from 'src/app/Models/ClienteViewModel';
import { ServiceService } from 'src/app/Service/Cliente.service';

@Component({
  templateUrl: './list-cliente.component.html',
  styleUrl: './list-cliente.component.scss',
  providers: [ConfirmationService, MessageService]
})
export class ListClienteComponent implements OnInit{
  Cliente!:Cliente[];
   

  statuses: any[] = [];

  products: Product[] = [];
  productDialog: boolean = false;
  rowGroupMetadata: any;
  submitted: boolean = false;

  display: boolean = false;
  activityValues: number[] = [0, 100];

  isExpanded: boolean = false;

  idFrozen: boolean = false;
  originalClienteData: any[];
  loading: boolean = false;
  fields: string[] = ['clie_Id', 'clie_Nombre', 'clie_Apellido', 'clie_FechaNac', 'clie_Sexo', 'estado_Civil', 'municipio'];

onGlobalFilter(filterValue: string) {
    console.log("Filtering for:", filterValue);
    console.log("Original data:", this.originalClienteData);
    this.Cliente = this.originalClienteData.filter(clie =>
        this.fields.some(field =>
            clie[field].toString().toLowerCase().includes(filterValue.toLowerCase())
        )
    );
    console.log("Filtered data:", this.Cliente);
}
  @ViewChild('filter') filter!: ElementRef;

  selectedState: any = null;

  states: any[] = [
      {name: 'Arizona', code: 'Arizona'},
      {name: 'California', value: 'California'},
      {name: 'Florida', code: 'Florida'},
      {name: 'Ohio', code: 'Ohio'},
      {name: 'Washington', code: 'Washington'}
  ];

  dropdownItems = [
      { name: 'Option 1', code: 'Option 1' },
      { name: 'Option 2', code: 'Option 2' },
      { name: 'Option 3', code: 'Option 3' },
      { name: 'Option 3', code: 'Option 3' },
      { name: 'Option 3', code: 'Option 3' },
      
  ];
  @ViewChild('dt1') dt1!: Table;
  clear() {

    this.Cliente = [...this.originalClienteData];


    this.dt1.filters = {}; 
    this.dt1.reset();       
}
  cities1: any[] = [];

  cities2: any[] = [];

  city1: any = null;

  city2: any = null;

  constructor(private service: ServiceService, private router: Router
  
  ) { }


  ngOnInit(): void {
    this.service.getClientes().subscribe((data: any)=>{
        console.log(data);
        this.Cliente = data;
        this.originalClienteData = [...data];  // Clonamos los datos en originalClienteData
    }, error => {
        console.log(error);
    });
}
  
}