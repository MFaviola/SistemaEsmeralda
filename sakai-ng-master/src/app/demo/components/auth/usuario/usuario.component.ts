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

  constructor(private service: ServiceService, private router: Router, private messageService: MessageService, private cookie: CookieService ) { }

  ngOnInit(): void {

    var usuario = document.getElementById('ID_Usuario');
    var nombre = this.cookie.get('Usuario')
    usuario.textContent = nombre;

    var empleado = document.getElementById('empl');
    var emple = this.cookie.get('Empleado');
    empleado.textContent = emple;

    var role = document.getElementById('rol');
    var rol = this.cookie.get('Rol');
    role.textContent = rol;

    var correo = document.getElementById('correo');
    var corre = this.cookie.get('correo');
    correo.textContent = corre;


    this.service.getDropDownEmpleado().subscribe((data: dropEmpleado[]) => {
      this.empleados = data;
    });
    this.service.getDropDownRol().subscribe((data: dropRol[]) => {
      this.rol = data;
    });

    this.usuform = new FormGroup({
      Usua_Usuario: new FormControl("",Validators.required),
      Usua_Contraseña: new FormControl("", Validators.required),
      Usua_Administrador: new FormControl(this.cookie.get('esAdmin'), [Validators.required]),
      empl_Id: new FormControl('0', [Validators.required]),
      role_Id: new FormControl('0', [Validators.required]),
    });

  }

  collapse(){
    this.Collapse= true;
    this.Edicion = true;
  }

  cancelar(){
    this.Collapse= false;
    this.Edicion = false;
  }

  onSubmit():void{
    if (this.usuform.valid && this.usuform.get('empl_Id').value !== '0' && this.usuform.get('eole_Id').value !== '0') {
     this.viewModel = this.usuform.value;
    
      this.viewModel.Usua_Id = this.id;
      this.service.ActualizarUsuario1(this.viewModel).subscribe((data: MensajeViewModel[]) => {
        if(data["message"] == "Operación completada exitosamente."){
        this.ngOnInit();
        this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Actualizado con Exito', life: 3000 });
        this.Collapse= false;
         this.submitted = false;
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
