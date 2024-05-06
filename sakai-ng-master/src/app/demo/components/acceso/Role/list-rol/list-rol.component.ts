import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Fill, Rol, RolEnviar } from 'src/app/Models/RolViewModel';
import { NodeService } from 'src/app/demo/service/node.service';
import { ServiceService } from 'src/app/Service/Roles.service';
import { TreeNode} from 'primeng/api';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
@Component({
  templateUrl: './list-rol.component.html',
  styleUrl: './list-rol.component.scss',
  providers: [ConfirmationService, MessageService]
})
export class ListRolComponent implements OnInit{
  Rol!:Rol[];
  files1: TreeNode[] = [];
  selectedFiles1: TreeNode[] = [];
  MensajeViewModel!: MensajeViewModel[];
  submitted: boolean = false;
  loading: boolean = false;
  empleados: any[] = [];
  rol: any[] = [];
  fill: any[] = [];
  viewModel: RolEnviar = new RolEnviar();
  rolForm: FormGroup;

 
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
  deleteProductDialog: boolean = false;
    //Detalle
    Detalle_Rol: String = "";
    UsuarioCreacion: String = "";
    UsuarioModificacion: String = "";
    FechaCreacion: String = "";
    FechaModificacion: String = "";
    ID: String = "";
  constructor(private service: ServiceService, private router: Router,private nodeService: NodeService,private messageService: MessageService
  
  ) { }


  ngOnInit(): void {
    this.nodeService.getFiles().then(files => this.files1 = files);
    this.rolForm = new FormGroup({
      Rol_Rol: new FormControl("",Validators.required),
    });




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
detalles(codigo){
  this.Collapse= false;
  this.DataTable = false;
  this.Agregar= false;
  this.Detalles = true;
  this.service.getFill(codigo).subscribe({
      next: (data: Fill) => {
        this.ID = data.role_Id,
        this.Detalle_Rol = data.role_Rol,
         this.UsuarioCreacion = data.usuarioCreacion,
         this.UsuarioModificacion = data.usuarioModificacion
         this.FechaCreacion = data.fechaCreacion,
         this.FechaModificacion = data.fechaModificacion
      }
    });
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
validarTexto(event: KeyboardEvent) {

  if (!/^[a-zA-Z\s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
      event.preventDefault();
  }
}onSubmit() {
  if (this.rolForm.valid) {
     this.viewModel = this.rolForm.value;
     if (this.Valor == "Agregar") {
      this.service.EnviarRol(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
          this.ngOnInit();
           this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
           this.Collapse= false;
           this.DataTable = true;
           this.submitted = false;
           this.Detalles = false;
           this.Agregar= true;
          }else{
           this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
          }
          
       })
     } else {
          this.viewModel.Role_Id = this.ID;
          this.service.ActualizarRol(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
            this.ngOnInit();
           this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
           this.Collapse= false;
           this.DataTable = true;
           this.Detalles = false;
           this.submitted = false;
           this.Agregar= true;
          }else{
           this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro actualizar', life: 3000 });
          }
          
       })
     }  
     
  }   
      else 
      {
          this.submitted = true;
      }
  }

  deleteSelectedProducts(codigo) {
    this.deleteProductDialog = true;
    this.ID = codigo;
    console.log("El codigo es" + codigo);
}
confirmDelete() {
    this.service.EliminarRol(this.ID).subscribe({
        next: (response) => {
            if(response.message == "La accion ha sido existosa"){
               this.ngOnInit();
                this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Eliminado con Exito', life: 3000 });
                this.Collapse= false;
                this.DataTable = true;
                this.Detalles = false;
                this.submitted = false;
                this.deleteProductDialog = false;
               }else{
                this.deleteProductDialog = false;
                this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro eliminar', life: 3000 });
               }
        },
    });

}
Fill(codigo) {
    this.service.getFill(codigo).subscribe({
        next: (data: Fill) => {
          this.rolForm = new FormGroup({
            Rol_Rol: new FormControl("",Validators.required),
          });
            this.ID = data.role_Id;
            this.Collapse= true;
            this.DataTable = false;
            this.Agregar = false;
            this.Detalles = false;
            this.Contrasenas = false;
            this.Valor = "Editar";
        }
      });

}
}
