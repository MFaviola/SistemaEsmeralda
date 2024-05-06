import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Fill, Joya, JoyaEnviar } from 'src/app/Models/JoyaViewModel';
import { ServiceService } from 'src/app/Service/Joya.service';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
import { dropProveedor } from 'src/app/Models/ProveedorViewModel';
import { dropMaterial } from 'src/app/Models/MaterialViewModel';
import { dropCategoria } from 'src/app/Models/CategoriaViewModel';
import { FileUpload } from 'primeng/fileupload';

@Component({
  templateUrl: './list-joya.component.html',
  providers: [ConfirmationService, MessageService]
})
export class ListJoyaComponent {
  @ViewChild('fileUpload') fileUpload: FileUpload;
  Joya!:Joya[];
  MensajeViewModel!: MensajeViewModel[];
  submitted: boolean = false;
  loading: boolean = false;
  proveedor: any[] = [];
  material: any[] = [];
  categoria: any[] = [];
  fill: any[] = [];
  viewModel: JoyaEnviar = new JoyaEnviar();
  JoyaForm: FormGroup;

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
  Detalle_Joya: String = "";
  Detalle_Imagen: String = "";
  Detalle_Compra: String = "";
  Detalle_Mayor: String = "";
  Detalle_Venta: String = "";
  Detalle_Stock: String = "";
  Detalle_Material: String = "";
  Detalle_Proveedor: String = "";
  Detalle_Categoria: String = "";
  UsuarioCreacion: String = "";
  UsuarioModificacion: String = "";
  FechaCreacion: String = "";
  FechaModificacion: String = "";
  ID: String = "";
  constructor(private service: ServiceService, private router: Router, private messageService: MessageService
  
  ) { }


  ngOnInit(): void {
    this.JoyaForm = new FormGroup({
      Joya_Nombre: new FormControl("",Validators.required),
      Joya_PrecioCompra: new FormControl(null, Validators.required),
      Joya_PrecioVenta: new FormControl(null, [Validators.required]),
      Joya_PrecioMayor: new FormControl(null, [Validators.required]),
      Joya_Stock: new FormControl("", [Validators.required]),
      Joya_Imagen: new FormControl("", [Validators.required]),
      Prov_Id: new FormControl('0', [Validators.required]),
      Mate_Id: new FormControl('0', [Validators.required]),
      Cate_Id: new FormControl('0', [Validators.required]),
    });

    this.service.getDropDownProveedor().subscribe((data: dropProveedor[]) => {
      this.proveedor = data;
    });
    
    this.service.getDropDownMaterial().subscribe((data: dropMaterial[]) => {
      this.material = data;
    });

    this.service.getDropDownCategoria().subscribe((data: dropCategoria[]) => {
      this.categoria = data;
    });

      this.service.getJoya().subscribe((data: any)=>{
          console.log(data);
          this.Joya = data;
      },error=>{
        console.log(error);
      });
   }
   onUpload(event) {
    const file: File = event.files[0];
    if (file) {
      const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
      const uniqueFileName = uniqueSuffix + '-' + file.name;

      this.JoyaForm.get('Joya_Imagen').setValue(uniqueFileName); 
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
 
}
detalles(codigo){
  this.Collapse= false;
  this.DataTable = false;
  this.Agregar= false;
  this.Detalles = true;
  this.service.getFill(codigo).subscribe({
    next: (data: Fill) => {
      this.Detalle_Joya= data.joya_Nombre;
      this.Detalle_Imagen = data.joya_Imagen;
      this.Detalle_Compra= data.joya_PrecioCompra;
      this.Detalle_Mayor = data.joya_PrecioMayor;
      this.Detalle_Venta = data.joya_PrecioVenta;
      this.Detalle_Material =data.mate_Material;
      this.Detalle_Proveedor = data.prov_Proveedor;
      this.Detalle_Categoria = data.cate_Categoria;
      this.UsuarioCreacion = data.usuarioCreacion;
      this.Detalle_Stock =  data.joya_Stock;
      this.UsuarioModificacion = data.usuarioModificacion;
      this.FechaCreacion = data.fechaCreacion;
      this.FechaModificacion = data.fechaModificacion;
      this.ID = data.joya_Id;
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
  this.fileUpload.clear();
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
  if (this.JoyaForm.valid && this.JoyaForm.get('Cate_Id').value !== '0' && this.JoyaForm.get('Mate_Id').value !== '0'&& this.JoyaForm.get('Prov_Id').value !== '0') {
     this.viewModel = this.JoyaForm.value;
     if (this.Valor == "Agregar") {
      this.service.EnviarJoyas(this.viewModel).subscribe((data: MensajeViewModel[]) => {
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
          this.viewModel.Joya_Id = this.ID
          this.service.ActualizarJoyas(this.viewModel).subscribe((data: MensajeViewModel[]) => {
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
    this.service.EliminarJoyas(this.ID).subscribe({
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
          this.JoyaForm = new FormGroup({
            Joya_Nombre: new FormControl(data.joya_Nombre,Validators.required),
            Joya_PrecioCompra: new FormControl(data.joya_PrecioCompra, Validators.required),
            Joya_PrecioVenta: new FormControl(data.joya_PrecioVenta, [Validators.required]),
            Joya_PrecioMayor: new FormControl(data.joya_PrecioMayor, [Validators.required]),
            Joya_Imagen: new FormControl(data.joya_Imagen, [Validators.required]),
            Joya_Stock: new FormControl(data.joya_Stock, [Validators.required]),
            Prov_Id: new FormControl(data.prov_Id, [Validators.required]),
            Mate_Id: new FormControl(data.mate_Id, [Validators.required]),
            Cate_Id: new FormControl(data.cate_Id, [Validators.required]),
          });
            this.ID = data.joya_Id;
            this.Collapse= true;
            this.DataTable = false;
            this.Agregar = false;
            this.Detalles = false;
            this.Valor = "Editar";
        }
      });

}
}
