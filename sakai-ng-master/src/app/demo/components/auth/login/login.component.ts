import { Component } from '@angular/core';
import { LayoutService } from 'src/app/layout/service/app.layout.service';
import { Router } from '@angular/router';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ServiceService } from '../../../../Service/Login.Service';
import { Login, validar, codigo, clave } from '../../../../Models/ValidarViewModel';
import {CookieService} from 'ngx-cookie-service';
import { AuthService } from 'src/app/Service/authGuard.service';
import { MensajeViewModel } from 'src/app/Models/MensajeViewModel';
import { ConfirmationService, MessageService } from 'primeng/api';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrl: './list-material.component.css',
    styles: [`
        :host ::ng-deep .pi-eye,
        :host ::ng-deep .pi-eye-slash {
            transform:scale(1.6);
            margin-right: 1rem;
            color: var(--primary-color) !important;
        }
    `],  
  providers: [ConfirmationService,MessageService,CookieService],

})
export class LoginComponent {
  Collapse: boolean = true;
  Login: boolean = false;
  Codigo: boolean = true;
  Contra: boolean = true;
  Errior: boolean = true;
  Uvacio: boolean = true;
  Cvacio: boolean = true;
  Usua_Id: String = '0';
  MensajeViewModel!: MensajeViewModel[];


    // valCheck: string[] = ['remember'];

    // password!: string;

    loginForm: FormGroup;
    validarForm: FormGroup;
    enviarcodigoForm: FormGroup;
    enviarcontraForm: FormGroup;


    
    constructor(public layoutService: LayoutService, private messageService: MessageService, private formBuilder: FormBuilder, private service: ServiceService,private router: Router,private cookie: CookieService,private authService:AuthService) {
        
        
     }

     ngOnInit(): void {
      this.loginForm = this.formBuilder.group({
        usuario: ['', [Validators.required]],
        contra: ['', [Validators.required]],
        rememberMe: [false]
      });

      this.enviarcontraForm = this.formBuilder.group({
        Usua_Id: ['', [Validators.required]],
        Usua_Contraseña: ['', [Validators.required]],
      });

      this.validarForm = this.formBuilder.group({
        usuario: ['', Validators.required],
      });

      this.enviarcodigoForm = this.formBuilder.group({
        codigo: ['', [Validators.required]],
      });
     }

     collapse(){
      this.Collapse = false;
      this.Login = true;
      this.Codigo = false;
    }

    restablecer(){
      this.Login = true;
      this.Collapse = false;
      console.log("aja simon")
    }

    cancelar(){
      this.Login = false;
      this.Collapse = true;

    }


     onSubmit(): void {
      window.location.hash="no-back-button";
      window.location.hash="Again-No-back-button"
        if (this.loginForm.valid) {
          const loginData: Login = this.loginForm.value;
          this.service.login(loginData).subscribe(
            response => {
              
              console.log('Respuesta del servidor:', response);
              if (response!="Error"){
                this.cookie.set('Empleado', response[0].empl_Nombre);
                this.cookie.set('empl_Id', response[0].empl_Id);
                this.cookie.set('Usuario', response[0].usua_Usuario);
                this.cookie.set('ID_Usuario', response[0].usua_Id);
                this.cookie.set('esAdmin',response[0].usua_Administrador);
                this.cookie.set('roleID',response[0].role_Id);
                this.cookie.set('SucursalID',response[0].sucu_Id);
                this.cookie.set('SucursalNombre',response[0].sucu_Nombre);

                this.cookie.set('Rol',response[0].role_Rol);
                this.cookie.set('correo',response[0].empl_Correo);

                this.authService.loadPermissions();
                console.log(this.cookie.get('esAdmin'));
                this.router.navigate(['/dash']);
              }

            },
            error => {
              console.error('Error al iniciar sesión:', error);
              this.Uvacio = true;
              this.Cvacio = true;

              this.Errior = false;

            }
          );
        } else {
          const loginData: Login = this.loginForm.value;

          console.log('Formulario inválido');
          if(loginData.contra == "")
            {
              this.Errior = true;
              this.Cvacio = false;

            }
          else
          {
              this.Errior = true;
              this.Cvacio = true;
          }

          if(loginData.usuario == "")
          {
              this.Errior = true;
              this.Uvacio = false;
          }
          else
          {
              this.Errior = true;
              this.Uvacio = true;
          }
        }
      }

      onValidar(): void {
        if (this.validarForm.valid) {
          const loginData: validar = this.validarForm.value;
          this.service.enviarcodigo(loginData).subscribe(
            response => {
              console.log('Respuesta del servidor:', response);
              if (response!="Error"){
                this.Usua_Id = response[0].usua_Id;
                this.messageService.add({ severity: 'info', summary: 'Correo enviado', detail: 'se envio un codigo de verificacion a su correo electronico', life: 3000 });

                this.enviarcontraForm = new FormGroup({
                  Usua_Id: new FormControl(this.Usua_Id, [Validators.required]),
                  Usua_Contraseña: new FormControl ('', [Validators.required]),
                })

                this.Collapse = true;
                this.Codigo = false;
              }
            },
            error => {
              console.error('Nombre de usuario incorrecto:', error);
            }
          );
        } else {
              console.log('Formulario inválido');
        }
      }


      oncodigo():void{
        if (this.enviarcodigoForm.valid) {
          const codigoData: codigo = this.enviarcodigoForm.value;
          this.service.validarcodigo(codigoData).subscribe(
            response => {
              console.log('Respuesta del servidor:', response);
              if (response!="Error"){
                console.log("el codigo es correcto");
                this.messageService.add({ severity: 'success', summary: 'Codigo Correcto', detail: 'el codigo ingresado fue correcto', life: 3000 });
                this.Codigo = true;
                this.Contra = false;
              }
            },
            error => {
                this.messageService.add({ severity: 'error', summary: 'Codigo Incorrecto', detail: 'el codigo ingresado fue incorrecto', life: 3000 });
                console.error('codigo incorrecto:', error);
            }
          );
        } else {
          console.log('Formulario inválido');
        }
      }


      oncontra():void{
        if (this.enviarcontraForm.valid) {
        const codigoData: clave = this.enviarcontraForm.value;
          
          console.log(codigoData);
          this.service.cambiarclave(codigoData).subscribe(
            response => {
              console.log('Respuesta del servidor:', response);
              if (response!="Error"){
                console.log("Contraseña establecida");
                this.messageService.add({ severity: 'success', summary: 'Exito', detail: 'Contraseña establecida con exito', life: 3000 });
                this.Codigo = true;
                this.Login = false;
                this.Contra = true;
              }
            },
            error => {
              console.error('codigo incorrecto:', error);
            }
          );
        } else {
          console.log('Formulario inválido');
          console.log(this.enviarcontraForm)
        }
      }
      
}
