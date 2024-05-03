export class Factura{
    impu_Impuesto?:String;
    mepa_Metodo?:String;
    empl_Nombre?:String;
    clie_Nombre?:String;
    fact_Id?:String;
}

export class FacturaEnviar {
    Esta_EstadoCivil: string;

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