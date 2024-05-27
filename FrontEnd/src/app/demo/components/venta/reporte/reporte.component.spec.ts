import { ComponentFixture, TestBed } from '@angular/core/testing';

import { reporteComponent } from './reporte.component';

describe('ListFacturaComponent', () => {
  let component: reporteComponent;
  let fixture: ComponentFixture<reporteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [reporteComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(reporteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
