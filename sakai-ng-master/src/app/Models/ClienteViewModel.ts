export class Cliente{
    clie_Id?:String;
    clie_Nombre?:String;
    clie_Apellido?:String;
    clie_FechaNac?:String;
    clie_Sexo?:String;
    estado_Civil?:String;
    carg_Cargo?:String;
    municipio?:String;
    Muni_Municipio:string;
}

export class ClienteEnviar {
    Clie_Id: string;
    Clie_Nombre: string;
    Clie_Apellido: string;
    Clie_FechaNac: string;
    Clie_Sexo: string;
    Muni_Codigo: string;
    Esta_Id: string;

}


export class Fill {
    clie_Id: string;
    clie_Nombre: string;
    clie_Apellido?:String;
    clie_FechaNac?:String;
    clie_Sexo?:String;
    muni_Codigo?:String;
    muni_Municipio?:String;
    carg_Cargo: string;
    esta_Id?:String;
    esta_EstadoCivil?:String;

    depa_Codigo?:String;
    depa_Departamento?:String;
    usuarioCreacion: string;
    usuarioModificacion: string;
    fechaCreacion : string;
    fechaModificacion : string;
}