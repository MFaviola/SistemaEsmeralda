import { Component } from '@angular/core';
import { LayoutService } from 'src/app/layout/service/app.layout.service';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ServiceService } from '../../../../Service/Login.Service';
import { Login } from '../../../../Models/ValidarViewModel';
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

    // valCheck: string[] = ['remember'];

    // password!: string;

    loginForm: FormGroup;

    constructor(public layoutService: LayoutService, private formBuilder: FormBuilder, private service: ServiceService,private router: Router,private cookie: CookieService,private authService:AuthService) {
        
        this.loginForm = this.formBuilder.group({
            usuario: ['', [Validators.required]],
            contra: ['', [Validators.required]],
            rememberMe: [false]
          });

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
}
