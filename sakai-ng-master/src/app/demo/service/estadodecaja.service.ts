import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CajaService {
  private cajaStateSource = new BehaviorSubject<string>('Unknown');
  currentCajaState = this.cajaStateSource.asObservable();

  constructor() { }

  changeCajaState(state: string) {
    this.cajaStateSource.next(state);
  }
}