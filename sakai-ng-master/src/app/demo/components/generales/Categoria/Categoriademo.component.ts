import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Categoria } from 'src/app/Models/CategoriaViewModel';
import { ServiceService } from 'src/app/Service/Categoria.service';
@Component({
    templateUrl: './Categoriademo.component.html',
    providers: [ConfirmationService, MessageService]
})
export class CategoriaDemoComponent implements OnInit {
    Categoria!:Categoria[];
   

    statuses: any[] = [];

    products: Product[] = [];
    productDialog: boolean = false;
    rowGroupMetadata: any;
    submitted: boolean = false;

    display: boolean = false;
    activityValues: number[] = [0, 100];

    isExpanded: boolean = false;

    idFrozen: boolean = false;

    loading: boolean = false;
   
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

    cities1: any[] = [];

    cities2: any[] = [];

    city1: any = null;

    city2: any = null;

    constructor(private service: ServiceService, private router: Router
    
    ) { }
  

    ngOnInit(): void {
        this.service.getCategoria().subscribe((data: any)=>{
            console.log(data);
            this.Categoria = data;
        },error=>{
          console.log(error);
        });
     }
    
    
      
}
