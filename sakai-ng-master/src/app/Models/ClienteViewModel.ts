export class Cliente{
    clie_Id?:String;
    clie_Nombre?:String;
    clie_Apellido?:String;
    clie_FechaNac?:String;
    clie_Sexo?:String;
    estado_Civil?:String;
    municipio?:String;
}

export class ClienteEnviar {
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
    esta_Id?:String;
    depa_Codigo?:String;
    depa_Departamento?:String;
    usuarioCreacion: string;
    usuarioModificacion: string;
    fechaCreacion : string;
    fechaModificacion : string;
}