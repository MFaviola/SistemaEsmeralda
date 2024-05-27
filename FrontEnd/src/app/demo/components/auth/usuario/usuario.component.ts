import { Component } from '@angular/core';
import { Usuario, UsuarioEnviar,Fill } from 'src/app/Models/UsuarioVIewModel';
import { ServiceService } from 'src/app/Service/Usuario.service';
import {Router} from '@angular/router';
import { ConfirmationService, MessageService } from 'primeng/api';
import {CookieService} from 'ngx-cookie-service';
import { FormGroup, FormControl,  Validators  } from '@angular/forms';
import { dropEmpleado } from 'src/app/Models/EmpleadoViewModel';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { dropRol } from 'src/app/Models/RolViewModel';

@Component({
  selector: 'app-usuario',
  templateUrl: './usuario.component.html',
  providers: [ConfirmationService, MessageService, CookieService],
  styleUrl: './usuario.component.scss',
})
export class UsuarioComponent {
  Usuario!:Usuario[];
  loading: boolean = false;
  id : string = this.cookie.get('ID_Usuario');
  Collapse : boolean = false;
  Edicion : boolean = false;
  submitted: boolean = false;
  viewModel: UsuarioEnviar = new UsuarioEnviar();
  usuform: FormGroup;

  empleados: any[] = [];
  rol: any[] = [];

  Usuanombre: String = "";
  sucursal: String = "";
  empleado: String = "";
  role: String = "";
  correo: String = "";
  
  constructor(private service: ServiceService, private router: Router, private messageService: MessageService, private cookie: CookieService ) { }

  ngOnInit(): void {



    this.service.getFill(this.id).subscribe((data: any)=>{
      console.log(data);
      this.Usuanombre = data.usua_Usuario;
      this.empleado = data.empl_Nombre;
      this.role = data.role_Rol;
      this.sucursal = data.sucu_Nombre;
      this.correo = data.empl_Correo;
    },error=>{
        console.log(error);
    })

    this.service.getDropDownEmpleado().subscribe((data: dropEmpleado[]) => {
      this.empleados = data;
    });
    this.service.getDropDownRol().subscribe((data: dropRol[]) => {
      this.rol = data;
    });

    this.usuform = new FormGroup({
      Usua_Usuario: new FormControl("",Validators.required),
      Usua_Administrador: new FormControl("", [Validators.required]),
      Usua_Contraseña: new  FormControl("", [Validators.required]),
      Empl_Id: new FormControl('0', [Validators.required]),
      Role_Id: new FormControl('0', [Validators.required]),
    });

  }

  collapse(){

    this.service.getFill(this.id).subscribe({
      next: (data: Fill) => {
        this.usuform = new FormGroup({
          Usua_Usuario: new FormControl(data.usua_Usuario,Validators.required),
          Usua_Administrador: new FormControl(data.usua_Administrador, [Validators.required]),
          Usua_Contraseña: new FormControl("x", Validators.required),
          Empl_Id: new FormControl(data.empl_Id, [Validators.required]),
          Role_Id: new FormControl(data.role_Id, [Validators.required]),
        });

        this.cookie.set('Usuario', data.usua_Usuario);
        
        this.Collapse= true;
          this.Edicion = true;
      }
    });

  }

  cancelar(){
    this.Collapse= false;
    this.Edicion = false;
  }

  onSubmit():void{
    if (this.usuform.valid && this.usuform.get('Empl_Id').value !== '0' && this.usuform.get('Role_Id').value !== '0') {
     this.viewModel = this.usuform.value;
    
      this.viewModel.Usua_Id = this.id;


      this.service.ActualizarUsuario(this.viewModel).subscribe((data: MensajeViewModel[]) => {
        if(data["message"] == "Operación completada exitosamente."){
          this.ngOnInit();
        this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
          this.Collapse= false;
          this.Edicion = false;
          this.submitted = false;
          this.router.navigate(['/usuario']);

        }else{
         this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se logro actualizar', life: 3000 });
        }          
      })
    }   
    else 
      {
          this.submitted = true;
      }
  }
}
