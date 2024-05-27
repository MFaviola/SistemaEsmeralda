import { NgModule } from '@angular/core';

import { YService } from './impresion.service';
import { DatePipe } from '@angular/common';

@NgModule({
	imports: [
        DatePipe
	],
	declarations: [YService]
})
export class YserviceModule { }
