import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListImpuestoComponent } from './list-impuesto.component';

describe('ListImpuestoComponent', () => {
  let component: ListImpuestoComponent;
  let fixture: ComponentFixture<ListImpuestoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ListImpuestoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ListImpuestoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
