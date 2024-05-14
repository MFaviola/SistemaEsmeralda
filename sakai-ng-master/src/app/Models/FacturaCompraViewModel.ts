export class FacturaCompraEncabezado{
    faCE_Id ?: String;
    prov_Id !: Number;
    mepa_Id !: Number;
    faCE_fechafinalizacion !: String;
    feCE_UsuarioCreacion !: Number;
    faCE_FechaCreacion !: String;
    faCE_UsuarioModificacion !: Number;
    faCE_FechaModificacion !: String;
    prov_Proveedor !: String;
    usuarioCreacion !: String;
    usuarioModificacion !: String;
    precioVenta ?: String;
    precioMayor ?: String;
    precioCompra ?: String;
    prod_Producto ?: String;
    nombreProducto ?: String;
    nombreProveedor ?: String;
    mepa_Metodo ?: String;
    faCE_Finalizada ?: String;
}
export class CrearFacturaCompraEncabezado{
    Usua_Id?: Number;
    mepa_Id !: Number;
    prov_Id !: Number;
    faCE_Id ?: String;
    faCD_Dif ?: String;
    nombreProducto ?: String;
    prod_Id !: Number;
    faCD_Cantidad !: String;
    precioCompra ?: String;
    precioVenta ?: String;
    precioMayor ?: String;
}
export class EditarFacturaCompraEncabezado{
    mepa_Id !: Number;
    prov_Id !: Number;
    faCE_Id ?: String;
    faCD_Dif ?: String;
    nombreProducto ?: String;
    prod_Id !: Number;
    faCD_Cantidad !: String;
    precioCompra ?: String;
    precioVenta ?: String;
    precioMayor ?: String;
}
export class Fill {
    mepa_Id !: Number;
    prov_Id !: Number;
    nombreProveedor ?: String;
}

export class FacturaCompraDetalle{
    faCD_Id !: Number;
    faCE_Id !: Number;
    faCD_Dif !: String;
    prod_Id !: Number;
    nombreProducto !: String;
    faCD_Cantidad !: String;
    prod_Producto ?: String;
    prod_Nombre ?: String;
    precioVenta ?: String;
    precioMayor ?: String;
    precioCompra ?: String;
}

export class FacturaCompraDetalleTabla{
    faCD_Id ?: String;
    producto ?: String;
    cantidad ?: String;
    categoria ?: String;
    precio_Venta ?: String;
    precioVenta ?: String;
    precioMayorista ?: String;
    total ?: String;
}