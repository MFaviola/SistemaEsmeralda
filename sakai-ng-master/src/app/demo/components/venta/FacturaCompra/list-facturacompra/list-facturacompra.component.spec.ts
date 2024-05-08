import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListFacturacompraComponent } from './list-facturacompra.component';

describe('ListFacturacompraComponent', () => {
  let component: ListFacturacompraComponent;
  let fixture: ComponentFixture<ListFacturacompraComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ListFacturacompraComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ListFacturacompraComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
