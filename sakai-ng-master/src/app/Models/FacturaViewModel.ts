export class Factura{
    impu_Impuesto?:String;
    mepa_Metodo?:String;
    empl_Nombre?:String;
    clie_Nombre?:String;
    fact_Id?:String;
    fact_Finalizado?:String;
}

export class FacturaEnviar {
    PagoCambio?:String;
    Pago:String;
    Mepa_Id?:String;
    Empl_Id?:String;
    Sucu_Id?:String;
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


export class CajaDetalle {
    caja_Id?:String;
    caja_UsuarioApertura?:String;
    caja_FechaApertura?:String;
    caja_UsuarioCierre?:String
    caja_FechaCierre?:String;
    caja_MontoInicial?:String;
    caja_MontoFinal?:String;
    caja_MontoSistema?:String;
    sucu_Nombre?:String;
    apertura?:String;
    cierre?:String;
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

export class ReportePorTipo {
    fact_Id?:String;
    total?:string;
    fact_FechaFinalizado?:String;
    mepa_Metodo?:String;
}




export class Fill {
    sucu_Nombre: string;
    fact_Cambio: string;
    fact_Pago: string;
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