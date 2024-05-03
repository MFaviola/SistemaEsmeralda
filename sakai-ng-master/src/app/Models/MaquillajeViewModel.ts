export class Maquillaje{
    maqu_Id?:String;
    maqu_Nombre?:String;
    maqu_PrecioCompra?:String;
    maqu_PrecioVenta?:String;
    maqu_PrecioMayor?:String;
    prov_Proveedor?:String;
    marc_Marca?:String;
}
export class MaquillajeEnviar {
    Maqu_Nombre: string;
    Maqu_PrecioCompra: string;
    Maqu_PrecioVenta: string;
    Maqu_PrecioMayor: string;
    Maqu_Imagen: string;
    Prov_Id: string;
    Marc_Id: string;


}

export class Fill {
    maqu_Id: string;
    maqu_Nombre: string;
    maqu_PrecioCompra?:String;
    maqu_PrecioVenta?:String;
    maqu_PrecioMayor?:String;
    marc_Id?:String;
    prov_Id?:String;
    usuarioCreacion: string;
    usuarioModificacion: string;
    fechaCreacion : string;
    fechaModificacion : string;
}