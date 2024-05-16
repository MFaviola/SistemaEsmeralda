export class Factura{
    impu_Impuesto?:String;
    mepa_Metodo?:String;
    empl_Nombre?:String;
    clie_Nombre?:String;
    fact_Id?:String;
    fact_Finalizado?:String;
}

export class FacturaEnviar {
    Usua_ID?: String;
    Usua_Id?: Number;
    Mepa_Id?:String;
    Empl_Id?:String;
    Clie_Id?:String;
    Fact_Id?:String;
    Faxd_Dif?:String;
    Prod_Nombre?:String;
    Faxd_Cantidad?:String;
    Actualizar?:String;
    Usua_Id?:String;
}


export class FacturaDetalle {
    faxD_Id?:String;
    prod_Id?:String;
    producto?:String;
    cantidad?:String;
    precio_Unitario?:String;
    total?:string;
    categoria?:String;
    codigoRow?:String;
}

export class Years {
   id?:number;
   name?:string;
}

export class Stock {
    producto?:String;
    stock?:String;
    categoria?:String;
}


export class EmpleadoRe {
    empl_Id?:String;
    empl_Nombre?:String;
    factura?:string;
    total?:string;
    fact_FechaFinalizado?:string;
}



export class FacturaDetallesEnviar {
    Faxd_Dif?:String;
    Prod_Id?:String;
    Faxd_Cantidad?:String;
    Fact_Id?:String;
}



export class Fill {
    impu_Id: string;
    clie_Nombre: string;
    empl_Nombre: string;
    clie_DNI: string;
    mepa_Id: string;
    empl_Id?:String;
    clie_Id?:String;
    fact_Id?:String;
    depa_Departamento?:String;
    mepa_Metodo?:String;
    muni_Municipio?:String;
    usuarioCreacion: string;
    usuarioModificacion: string;
    fechaCreacion : string;
    fechaModificacion : string;
}