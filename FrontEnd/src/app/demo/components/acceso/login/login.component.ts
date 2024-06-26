import { Component } from '@angular/core';
import { LayoutService } from 'src/app/layout/service/app.layout.service';

import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ServiceService } from '../../../../Service/Login.Service';
import { Login } from '../../../../Models/ValidarViewModel';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
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

    constructor(public layoutService: LayoutService, private formBuilder: FormBuilder, private service: ServiceService) {

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
