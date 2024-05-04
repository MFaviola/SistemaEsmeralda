import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Product } from 'src/app/demo/api/product';
import {Router} from '@angular/router';
import { Table } from 'primeng/table';
import { Joya, JoyaEnviar } from 'src/app/Models/JoyaViewModel';
import { ServiceService } from 'src/app/Service/Joya.service';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
import { dropProveedor } from 'src/app/Models/ProveedorViewModel';
import { dropMaterial } from 'src/app/Models/MaterialViewModel';
import { dropCategoria } from 'src/app/Models/CategoriaViewModel';

@Component({
  templateUrl: './list-joya.component.html',
  providers: [ConfirmationService, MessageService]
})
export class ListJoyaComponent {
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
  Detalle_Usuario: String = "";
  Detalle_Administrador: String = "";
  Detalle_Empleado: String = "";
  Detalle_Rol: String = "";
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
      Joya_Imagen: new FormControl(null, [Validators.required]),
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
  
      const formData: FormData = new FormData();
      formData.append('file', file, uniqueFileName);
  
      this.service.EnviarImagen(formData).subscribe(
        response => console.log('Upload successful', response),
        error => console.error('Error uploading image', error)
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
          }else{
           this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro insertar', life: 3000 });
          }
          
       })
     } else {
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
}
