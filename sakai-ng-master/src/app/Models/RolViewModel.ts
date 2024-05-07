import { an } from "@fullcalendar/core/internal-common";

export class Rol{
    role_Id?:String;
    role_Rol?:String;
}

export class RolEnviar {
    Rol_Id?:String;
    txtRol: string;
    pantallasSeleccionadas: any;
}
export class dropRol{
    value?:String;
    text?:String;
}

export class Fill {
    role_Id: string;
    pant_Id: string;
    role_Rol: string;
    usuarioCreacion: string;
    usuarioModificacion: string;
    fechaCreacion : string;
    fechaModificacion : string;
}