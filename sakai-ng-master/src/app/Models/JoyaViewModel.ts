export class Joya{
    joya_Id?:String;
    joya_Nombre?:String;
    joya_PrecioCompra?:String;
    joya_PrecioVenta?:String;
    joya_PrecioMayor?:String;
    mate_Material?:String;
    prov_Proveedor?:String;
    cate_Categoria?:String;
}

export class JoyaEnviar {
    Joya_Nombre: string;
    Joya_PrecioCompra: string;
    Joya_PrecioVenta: string;
    Joya_PrecioMayor: string;
    Joya_Imagen: string;
    Prov_Id: string;
    Mate_Id: string;
    Cate_Id: string;

}

export class Fill {
    joya_Id: string;
    joya_Nombre: string;
    joya_PrecioCompra?:String;
    joya_PrecioVenta?:String;
    joya_PrecioMayor?:String;
    mate_Id?:String;
    prov_Id?:String;
    cate_Id?:String;
    usuarioCreacion: string;
    usuarioModificacion: string;
    fechaCreacion : string;
    fechaModificacion : string;
}

