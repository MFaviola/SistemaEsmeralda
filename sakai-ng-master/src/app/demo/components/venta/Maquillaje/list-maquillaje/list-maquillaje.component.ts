import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Fill, Maquillaje, MaquillajeEnviar } from 'src/app/Models/MaquillajeViewModel';
import { ServiceService } from 'src/app/Service/Maquillaje.service';
import { FileUpload } from 'primeng/fileupload';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { dropProveedor } from 'src/app/Models/ProveedorViewModel';
import { dropMarca } from 'src/app/Models/MarcaViewModel';

@Component({
  templateUrl: './list-maquillaje.component.html',
  providers: [ConfirmationService, MessageService]
})
export class ListMaquillajeComponent implements OnInit{
  Maquillaje!:Maquillaje[];
   
  @ViewChild('fileUpload') fileUpload: FileUpload;
  MensajeViewModel!: MensajeViewModel[];
  submitted: boolean = false;
  loading: boolean = false;
  proveedor: any[] = [];
  marca: any[] = [];
  material: any[] = [];
  categoria: any[] = [];
  fill: any[] = [];
  viewModel: MaquillajeEnviar = new MaquillajeEnviar();
  MaquillajeForm: FormGroup;
 
  @ViewChild('filter') filter!: ElementRef;

  selectedState: any = null;
  Collapse: boolean = false;
  DataTable: boolean = true;
  Detalles: boolean = false;
  Agregar: boolean = true;
  Valor: string = "";
  staticData = [{}];
  deleteProductDialog: boolean = false;
  //Detalle
  Detalle_Maquillaje: String = "";
  Detalle_Imagen: String = "";
  Detalle_Compra: String = "";
  Detalle_Mayor: String = "";
  Detalle_Venta: String = "";
  Detalle_Proveedor: String = "";
  Detalle_Marca: String = "";
  UsuarioCreacion: String = "";
  UsuarioModificacion: String = "";
  Detalle_Stock: String = "";
  FechaCreacion: String = "";
  FechaModificacion: String = "";
  ID: String = "";

  constructor(private service: ServiceService, private router: Router, private messageService: MessageService
  
  ) { }


  ngOnInit(): void {

    this.MaquillajeForm = new FormGroup({
      Maqu_Nombre: new FormControl("",Validators.required),
      Maqu_PrecioCompra: new FormControl(null, Validators.required),
      Maqu_PrecioVenta: new FormControl(null, [Validators.required]),
      Maqu_PrecioMayor: new FormControl(null, [Validators.required]),
      Maqu_Stock: new FormControl("", [Validators.required]),
      Maqu_Imagen: new FormControl("", [Validators.required]),
      Prov_Id: new FormControl('0', [Validators.required]),
      Marc_Id: new FormControl('0', [Validators.required]),
    });
    

    this.service.getDropDownProveedor().subscribe((data: dropProveedor[]) => {
      this.proveedor = data;
    });
    this.service.getDropDownsMarcas().subscribe((data: dropMarca[]) => {
      this.marca = data;
    });
    
      this.service.getMaquillaje().subscribe((data: any)=>{
          console.log(data);
          this.Maquillaje = data;
      },error=>{
        console.log(error);
      });
   }

   onUpload(event) {
    const file: File = event.files[0];
    if (file) {
      const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
      const uniqueFileName = uniqueSuffix + '-' + file.name;

      this.MaquillajeForm.get('Maqu_Imagen').setValue(uniqueFileName); 
      const formData: FormData = new FormData();

      formData.append('file', file, uniqueFileName);
      this.service.EnviarImagen(formData).subscribe(
        response => {
          console.log('Upload successful', response);
          if (response.message === "Exito") {
            this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Imagen Subida', life: 3000 });
          } else {
            this.messageService.add({ severity: 'success', summary: 'Error', detail: 'Suba una imagen', life: 3000 });
          }
        },
        error => {
          console.error('Error uploading image', error);
        }
      );
    }
  }
  collapse(){
    this.Collapse= true;
    this.DataTable = false;
    this.Valor = "Agregar";
    this.Agregar= false;
    this.Detalles = false;
    this.fileUpload.clear();
}
detalles(codigo){
  this.Collapse= false;
  this.DataTable = false;
  this.Agregar= false;
  this.Detalles = true;
  this.service.getFill(codigo).subscribe({
    next: (data: Fill) => {
      this.Detalle_Maquillaje= data.maqu_Nombre;
      this.Detalle_Imagen = data.maqu_Imagen;
      this.Detalle_Compra= data.maqu_PrecioCompra;
      this.Detalle_Mayor = data.maqu_PrecioMayor;
      this.Detalle_Venta = data.maqu_PrecioVenta;
      this.Detalle_Proveedor = data.prov_Proveedor;
      this.Detalle_Marca = data.marc_Marca;
      this.UsuarioCreacion = data.usuarioCreacion;
      this.UsuarioModificacion = data.usuarioModificacion;
      this.FechaCreacion = data.fechaCreacion;
      this.FechaModificacion = data.fechaModificacion;
      this.Detalle_Stock = data.maqu_Stock;
      this.ID = data.maqu_Id;
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
validarTexto(event: KeyboardEvent) {

  if (!/^[a-zA-Z\s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
      event.preventDefault();
  }
}
ValidarNumeros(event: KeyboardEvent) {
  if (!/[0-9]/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab') {
      event.preventDefault();
  }
}
onSubmit() {
  if (this.MaquillajeForm.valid && this.MaquillajeForm.get('Prov_Id').value !== '0' && this.MaquillajeForm.get('Marc_Id').value !== '0') {
     this.viewModel = this.MaquillajeForm.value;
     if (this.Valor == "Agregar") {
      this.service.EnviarMaquillaje(this.viewModel).subscribe((data: MensajeViewModel[]) => {
          if(data["message"] == "Operación completada exitosamente."){
          this.ngOnInit();
           this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Insertado con Exito', life: 3000 });
           this.Collapse= false;
           this.DataTable = true;
           this.submitted = false;
           this.Detalles = false;
           this.Agregar= true;
           this.fileUpload.clear();
          }else{
           this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
          }
          
       })
     } else {
          this.viewModel.Maqu_Id = this.ID
          this.service.ActualizarMaquillaje(this.viewModel).subscribe((data: MensajeViewModel[]) => {
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
    this.service.EliminarMaquillaje(this.ID).subscribe({
        next: (response) => {
            if(response.message == "La accion ha sido existosa"){
               
                this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Eliminado con Exito', life: 3000 });
                this.Collapse= false;
                this.DataTable = true;
                this.Detalles = false;
                this.submitted = false;
                this.deleteProductDialog = false;
                this.ngOnInit();
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
          this.MaquillajeForm = new FormGroup({
            Maqu_Nombre: new FormControl(data.maqu_Nombre,Validators.required),
            Maqu_PrecioCompra: new FormControl(data.maqu_PrecioCompra, Validators.required),
            Maqu_PrecioVenta: new FormControl(data.maqu_PrecioVenta, [Validators.required]),
            Maqu_PrecioMayor: new FormControl(data.maqu_PrecioMayor, [Validators.required]),
            Maqu_Imagen: new FormControl(data.maqu_Imagen, [Validators.required]),
            Maqu_Stock: new FormControl(data.maqu_Stock, [Validators.required]),
            Prov_Id: new FormControl(data.prov_Id, [Validators.required]),
            Marc_Id: new FormControl(data.marc_Id, [Validators.required]),

          });
            this.ID = data.maqu_Id;
            this.Collapse= true;
            this.DataTable = false;
            this.Agregar = false;
            this.Detalles = false;
            this.Valor = "Editar";
        }
      });

}
}
