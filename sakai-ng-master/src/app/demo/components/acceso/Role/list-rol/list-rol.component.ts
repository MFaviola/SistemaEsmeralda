import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Rol } from 'src/app/Models/RolViewModel';
import { NodeService } from 'src/app/demo/service/node.service';
import { ServiceService } from 'src/app/Service/Roles.service';
import { TreeNode} from 'primeng/api';
@Component({
  templateUrl: './list-rol.component.html',
  styleUrl: './list-rol.component.scss',
  providers: [ConfirmationService, MessageService]
})
export class ListRolComponent implements OnInit{
  Rol!:Rol[];
  files1: TreeNode[] = [];
  selectedFiles1: TreeNode[] = [];
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
  Collapse: boolean = false;
  DataTable: boolean = true;
  Detalles: boolean = false;
  Agregar: boolean = true;
  Contrasenas: boolean = true;
  Valor: string = "";
  staticData = [{}];
  selectedKeys: string[] = []; 
  constructor(private service: ServiceService, private router: Router,private nodeService: NodeService
  
  ) { }


  ngOnInit(): void {
    this.nodeService.getFiles().then(files => this.files1 = files);





      this.service.getRol().subscribe((data: any)=>{
          console.log(data);
          this.Rol = data;
      },error=>{
        console.log(error);
      });
   }

  onNodeSelect(event: any) {
    this.updateSelectedKeys();
  }

  onNodeUnselect(event: any) {
    this.updateSelectedKeys();
  }

  updateSelectedKeys() {
    const excludedKeys = ['0', '100', '101', '102']; 
    this.selectedKeys = this.selectedFiles1
      .map(node => node.key) 
      .filter(key => !excludedKeys.includes(key)); 
  
    console.log('Selected keys:', this.selectedKeys);
  }
   collapse(){
    this.Collapse= true;
    this.DataTable = false;
    this.Valor = "Agregar";
    this.Agregar= false;
    this.Detalles = false;
}
cancelar(){
  this.Collapse= false;
  this.DataTable = true;
  this.Detalles = false;
  this.ngOnInit();
  this.submitted = false;
  this.Agregar= true;
  this.Valor = "";
}

llenar(){
  this.nodeService.getFiles().then(treeFiles => {
    this.files1 = treeFiles;
    this.nodeService.datos().subscribe(
      addedScreens => {
        this.markAddedScreens(treeFiles, addedScreens);
      },
    );
  },
  
);

  this.Collapse= true;
  this.DataTable = false;
  this.Agregar= false;
  this.Detalles = false;

}
markAddedScreens(treeNodes: TreeNode[], addedScreens: any[]) {
  const addedKeys = addedScreens.map(screen => screen.pant_Id);
  this.selectedFiles1 = this.findNodesByKey(treeNodes, addedKeys);
  this.updateSelectedKeys();
}

findNodesByKey(nodes: TreeNode[], keys: string[], parent: TreeNode | null = null): TreeNode[] {
  let selected: TreeNode[] = [];
  nodes.forEach(node => {
    const isSelected = keys.includes(node.key);
    if (isSelected) {
      selected.push(node);
      node.expanded = true;  


      if (parent) {
        parent.partialSelected = true;
        parent.expanded = true;
      }
    }

    if (node.children && node.children.length > 0) {
      const childrenSelected = this.findNodesByKey(node.children, keys, node);
      selected = selected.concat(childrenSelected);


      if (childrenSelected.length > 0) {
        node.partialSelected = childrenSelected.some(child => child.expanded);
        node.expanded = true;
      } else {
        node.partialSelected = false;  
      }
    }
  });


  if (parent && selected.length > 0 && !parent.children.every(child => child.expanded)) {
    parent.partialSelected = true;
  }
  return selected;
}

}
