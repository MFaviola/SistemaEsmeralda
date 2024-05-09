export class Factura{
    impu_Impuesto?:String;
    mepa_Metodo?:String;
    empl_Nombre?:String;
    clie_Nombre?:String;
    fact_Id?:String;
}

export class FacturaEnviar {
    Mepa_Id?:String;
    Empl_Id?:String;
    Clie_Id?:String;
    Fact_Id?:String;
    Faxd_Dif?:String;
    Prod_Nombre?:String;
    Faxd_Cantidad?:String;
    
}


export class FacturaDetalle {
    faxD_Id?:String;
    prod_Id?:String;
    producto?:String;
    cantidad?:String;
    precio_Unitario?:String;
    total?:String;
    categoria?:String;
}


export class FacturaDetallesEnviar {
    Faxd_Dif?:String;
    Prod_Id?:String;
    Faxd_Cantidad?:String;
    Fact_Id?:String;
}



export class Fill {
    impu_Id: string;
    mepa_Id: string;
    empl_Id?:String;
    clie_Id?:String;
    fact_Id?:String;
    usuarioCreacion: string;
    usuarioModificacion: string;
    fechaCreacion : string;
    fechaModificacion : string;
}