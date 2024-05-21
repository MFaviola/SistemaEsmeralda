export class Fill {
    caja_Id: string;
    caja_MontoInicial: string;
    caja_FechaCierre?: string | null;
}

export class FillCajaCierre {
    caja_Id: string;
    caja_MontoInicial: string;
    caja_FechaCierre?: string | null;
}
export class Fill2 {
    caja_Id: string;
    caja_MontoInicial: string;
    caja_FechaCierre?: string | null;
}

export class CajaEnviar {
    caja_UsuarioCierre?:String;
    caja_MontoSistema?:String;
    caja_MontoFinal:String;
    caja_MontoInicial?:String;
    caja_Observacion?:String;
    caja_Id?:String;


    caja_UsuarioApertura?:String;
    Sucu_Id?:String;
}