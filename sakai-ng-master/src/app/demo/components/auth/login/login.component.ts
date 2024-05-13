import { Component } from '@angular/core';
import { LayoutService } from 'src/app/layout/service/app.layout.service';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ServiceService } from '../../../../Service/Login.Service';
import { Login } from '../../../../Models/ValidarViewModel';
import { CookieService } from 'ngx-cookie-service';

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
    `]
})
export class LoginComponent {

    // valCheck: string[] = ['remember'];

    // password!: string;

    loginForm: FormGroup;

    constructor(public layoutService: LayoutService, private formBuilder: FormBuilder, private service: ServiceService,private router: Router) {

        this.loginForm = this.formBuilder.group({
            usuario: ['', [Validators.required]],
            contra: ['', [Validators.required]],
            rememberMe: [false]
          });

     }


     onSubmit(): void {
        if (this.loginForm.valid) {
          const loginData: Login = this.loginForm.value;
          this.service.login(loginData).subscribe(
            response => {

              console.log('Respuesta del servidor:', response);
              if (response!="Error"){
             
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
