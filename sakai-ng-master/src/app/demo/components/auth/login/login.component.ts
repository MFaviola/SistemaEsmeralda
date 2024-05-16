import { Component } from '@angular/core';
import { LayoutService } from 'src/app/layout/service/app.layout.service';
import { Router } from '@angular/router';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ServiceService } from '../../../../Service/Login.Service';
import { Login, validar, codigo, clave } from '../../../../Models/ValidarViewModel';
import {CookieService} from 'ngx-cookie-service';
import { AuthService } from 'src/app/Service/authGuard.service';
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
    `],  providers:
    [CookieService]
})
export class LoginComponent {
  Collapse: boolean = true;
  Login: boolean = false;
  Codigo: boolean = true;
  Contra: boolean = true;

  Usua_Id = '0';


    // valCheck: string[] = ['remember'];

    // password!: string;

    loginForm: FormGroup;
    validarForm: FormGroup;
    enviarcodigoForm: FormGroup;
    enviarcontraForm: FormGroup;


    
    constructor(public layoutService: LayoutService, private formBuilder: FormBuilder, private service: ServiceService,private router: Router,private cookie: CookieService,private authService:AuthService) {
        
        
     }

     ngOnInit(): void {
      this.loginForm = this.formBuilder.group({
        usuario: ['', [Validators.required]],
        contra: ['', [Validators.required]],
        rememberMe: [false]
      });

      this.enviarcontraForm = this.formBuilder.group({
        Usua_Id: [this.cookie.get('ID_Usuario'), [Validators.required]],
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
                this.authService.loadPermissions();
                console.log(this.cookie.get('esAdmin'));
                this.router.navigate(['/dash']);
              }

            },
            error => {
              console.error('Error al iniciar sesión:', error);

            }
          );
        } else {
          console.log('Formulario inválido');
        }
      }

      onValidar(): void {
        if (this.validarForm.valid) {
          const loginData: validar = this.validarForm.value;
          this.service.enviarcodigo(loginData).subscribe(
            response => {
              console.log('Respuesta del servidor:', response);
              if (response!="Error"){
                this.cookie.set('ID_Usuario', response[0].usua_Id);
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
                this.Codigo = true;
                this.Contra = false;
              }
            },
            error => {
              console.error('codigo incorrecto:', error);
            }
          );
        } else {
          console.log('Formulario inválido');
        }
      }


      oncontra():void{
        if (this.enviarcodigoForm.valid) {
          const codigoData: clave = this.enviarcontraForm.value;
          console.log(codigoData);
          this.service.cambiarclave(codigoData).subscribe(
            response => {
              console.log('Respuesta del servidor:', response);
              if (response!="Error"){
                console.log("Contraseña establecida");
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
        }
      }
      
}
