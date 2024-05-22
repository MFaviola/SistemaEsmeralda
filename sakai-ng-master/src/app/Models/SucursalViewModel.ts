export class Sucursal{
    sucu_Id?:String;
    sucu_Nombre?:String;
    muni_Municipio?:String;
}
export class SucursalEnviar {
    Usua_Id?: Number;
    Sucu_Id: String;
    Sucu_Nombre: string;
    Muni_Codigo: string; 
}

export class dropSucursal{
    value?:String;
    text?:String;
}


export class Fill {
    sucu_Id?: String;
    sucu_Nombre?: String;
    muni_Codigo: string; 
    muni_Municipio?:String;
    depa_Codigo?:String;
    usuarioCreacion?:String;
    usuarioModificacion:String;
    fechaCreacion:String;
    fechaModificacion:String;
}

export class DropSucursal{
    sucu_Id?:String;
    sucu_Nombre?:String;

}