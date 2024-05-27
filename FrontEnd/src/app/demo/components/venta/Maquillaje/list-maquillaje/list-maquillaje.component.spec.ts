import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListMaquillajeComponent } from './list-maquillaje.component';

describe('ListMaquillajeComponent', () => {
  let component: ListMaquillajeComponent;
  let fixture: ComponentFixture<ListMaquillajeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ListMaquillajeComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ListMaquillajeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
