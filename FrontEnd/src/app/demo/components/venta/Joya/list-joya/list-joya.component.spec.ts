import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListJoyaComponent } from './list-joya.component';

describe('ListJoyaComponent', () => {
  let component: ListJoyaComponent;
  let fixture: ComponentFixture<ListJoyaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ListJoyaComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ListJoyaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
