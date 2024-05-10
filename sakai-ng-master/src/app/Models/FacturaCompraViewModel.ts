export class FacturaCompraEncabezado{
    faCE_Id !: Number;
    prov_Id !: Number;
    mepa_Id !: Number;
    faCE_fechafinalizacion !: String;
    feCE_UsuarioCreacion !: Number;
    faCE_FechaCreacion !: String;
    faCE_UsuarioModificacion !: Number;
    faCE_FechaModificacion !: String;
    prov_Proveedor !: String;
    mepa_Metodo !: String;
    usuarioCreacion !: String;
    usuarioModificacion !: String;
}

export class FacturaCompraDetalle{
    faCD_Id !: Number;
    faCE_Id !: Number;
    faCD_Dif !: Boolean;
    prod_Id !: Number;
    nombreProducto !: String;
    faCD_Cantidad !: Number;
}