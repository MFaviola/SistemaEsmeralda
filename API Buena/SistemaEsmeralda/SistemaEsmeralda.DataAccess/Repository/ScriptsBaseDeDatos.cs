using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.DataAccess.Repository
{
   public class ScriptsBaseDeDatos
    {
        #region Gral

        #region Departamentos
        public static string DepartamentoListar = "Gral.sp_Departamentos_listar";
        public static string Departamentollenar = "Gral.sp_Departamentos_buscar";
        public static string DepartamentoActualizar = "Gral.sp_Departamentos_actualizar";
        public static string DepartamentoEliminar = "Gral.sp_Departamentos_eliminar";

        #endregion



        #region Municipios
        public static string MunicipioListar = "Gral.sp_Municipios_listar";
        public static string Municipiollenar = "Gral.sp_Municipios_buscar";
        public static string MunicipioActualizar = "Gral.sp_Municipios_actualizar";
        public static string MunicipioEliminar = "Gral.sp_Municipios_eliminar";

        #endregion


        #region Cargos
        public static string CargosListar = "Gral.sp_Cargos_listar";
        public static string Cargosllenar = "Gral.sp_Cargos_buscar";
        public static string CargosActualizar = "Gral.sp_Cargos_actualizar";
        public static string CargosEliminar = "Gral.sp_Cargos_eliminar";

        #endregion

        #region Usuarios
        public static string Usuarios_ValidarReestablecer = "Gral.sp_Cargos_listar";


        #endregion




        #region Categorias
        public static string CategoriasListar = "Gral.sp_Categorias_listar";
        public static string Categoriasllenar = "Gral.sp_Categorias_buscar";
        public static string CategoriasActualizar = "Gral.sp_Categorias_actualizar";
        public static string CategoriasEliminar = "Gral.sp_Categorias_eliminar";

        #endregion




        #region Categorias
        public static string EstadosCivilesListar = "Gral.sp_EstadosCiviles_listar";
        public static string EstadosCivilesllenar = "Gral.sp_EstadosCiviles_buscar";
        public static string EstadosCivilesActualizar = "Gral.sp_EstadosCiviles_actualizar";
        public static string EstadosCivilesEliminar = "Gral.sp_EstadosCiviles_eliminar";

        #endregion





        #region Impuetos
        public static string ImpuestoListar = "Gral.sp_Impuestos_listar";
        public static string Impuestollenar = "Gral.sp_Impuestos_buscar";
        public static string ImpuestoActualizar = "Gral.sp_Impuestos_actualizar";
        public static string ImpuestoEliminar = "Gral.sp_Impuestos_eliminar";

        #endregion




        #region Marcas
        public static string MarcasListar = "Gral.sp_Marcas_listar";
        public static string Marcasllenar = "Gral.sp_Marcas_buscar";
        public static string MarcasActualizar = "Gral.sp_Marcas_actualizar";
        public static string MarcasEliminar = "Gral.sp_Marcas_eliminar";

        #endregion




        #region Materiales
        public static string MaterialesListar = "Gral.sp_Materiales_listar";
        public static string Materialesllenar = "Gral.sp_Materiales_buscar";
        public static string MaterialesActualizar = "Gral.sp_Materiales_actualizar";
        public static string MaterialesEliminar = "Gral.sp_Materiales_eliminar";

        #endregion



        #region MetodosPago
        public static string MetodosPagoListar = "Gral.sp_MetodosPago_listar";
        public static string MMetodosPagollenar = "Gral.sp_MetodosPago_buscar";
        public static string MetodosPagoActualizar = "Gral.sp_MetodosPago_actualizar";
        public static string MetodosPagoEliminar = "Gral.sp_MetodosPago_eliminar";

        #endregion






        #region Clientes
        public static string ClientesListar = "Gral.sp_Clientes_listar";
        public static string Clientesllenar = "Gral.sp_Clientes_buscar";
        public static string ClientesActualizar = "Gral.sp_Clientes_actualizar";
        public static string ClientesEliminar = "Gral.sp_Clientes_eliminar";

        #endregion

        #region Empleados
        public static string EmpleadosListar = "Gral.sp_Empleados_listar";
        public static string Empleadosllenar = "Gral.sp_Empleados_buscar";
        public static string EmpleadosActualizar = "Gral.sp_Empleados_actualizar";
        public static string EmpleadosEliminar = "Gral.sp_Empleados_eliminar";

        #endregion


        #region Proveedores
        public static string ProveedoresListar = "Gral.sp_Proveedores_listar";
        public static string Proveedoresllenar = "Gral.sp_Proveedores_buscar";
        public static string ProveedoressActualizar = "Gral.sp_Proveedores_actualizar";
        public static string ProveedoresEliminar = "Gral.sp_Proveedores_eliminar";

        #endregion




        #region Proveedores
        public static string SucursalessListar = "Gral.sp_Sucursales_listar";
        public static string Sucursalesllenar = "Gral.sp_Sucursales_buscar";
        public static string SucursalesActualizar = "Gral.sp_Sucursales_actualizar";
        public static string SucursalesEliminar = "Gral.sp_Sucursales_eliminar";

        #endregion



        #endregion







        #region Ventas

        #region Joya
    
        public static string JoyasListar = "Vent.sp_Joyas_listar";
        public static string Joyasllenar = "Vent.sp_Joyas_buscar";
        public static string JoyasActualizar = "Vent.sp_Joyas_actualizar";
        public static string JoyasEliminar = "Vent.sp_Joyas_eliminar";

        #endregion


        #region Maquillaje

        public static string MaquillajesListar = "Vent.sp_Maquillajes_listar";
        public static string Maquillajesllenar = "Vent.sp_Maquillajes_buscar";
        public static string MaquillajesActualizar = "Vent.sp_Maquillajes_actualizar";
        public static string MaquillajesEliminar = "Vent.sp_Maquillajes_eliminar";

        #endregion
        #region Factura

        public static string CrearFactura = "[Vent].[sp_Facturas_Insertar]";
        public static string DetalleEliminar = "[Vent].[sp_FacturaDetalles_eliminar]";

        public static string ConfirmarFactura = "Vent.sp_ConfirmarFactura";
        #endregion


        #region Factura Compra
        public static string FacturaCompraListado = "[Vent].[SP_FacturaCompra_Listar]";
        public static string FacturaCompraInsertar = "[Vent].[SP_FacturaCompra_Insertar]";
        public static string FacturaCompraActualizar = "[Vent].[SP_FacturaCompra_Actualizar]";
        public static string FacturaCompraEliminar = "[Vent].[SP_FacturaCompra_Eliminar]";
        public static string FacturaCompraBuscar = "[Vent].[SP_FacturaCompra_Buscar]";

        #endregion

        #region Factura Compra Detalle
        public static string FacturaCompraDetalleInsertar = "[Vent].[SP_FacturaCompraDetalle_Insertar]";
        public static string FacturaCompraDetalleActualizar = "";
        public static string FacturaCompraDetalleEliminar = "[Vent].[SP_FacturaCompraDetalle_Eliminar]";
        public static string FacturaCompraDetalleListar = "[Vent].[SP_FacturaCompraDetalle_Listar]";
        public static string FacturaCompraDetalleBuscar = "[Vent].[SP_FacturaCompraDetalle_Buscar]";
        #endregion

        #endregion





        #region Acceso

        #region Roles

        public static string RolesListar = "Acce.sp_Roles_listar";
        public static string Rolesllenar = "Acce.sp_Roles_buscar";
        public static string RolesActualizar = "Acce.sp_Roles_actualizar";
        public static string RolesEliminar = "Acce.sp_Roles_eliminar";

        #endregion




        #region RolesPorPantalla

        public static string PantallasRolesListar = "[Acce].[sp_PantallasRoles_listar]";
        public static string PantallasRolesllenar2 = "[Acce].[sp_Roles_buscar]";
        public static string PantallasRolesllenar = "[Acce].[sp_PantallasPorRol2_buscar]";
        public static string PantallasRolesActualizar = "[Acce].[sp_PantallasPorRoles_actualizar]";
        public static string PantallasRolesEliminar = "[Acce].[sp_PantallasPorRoles_eliminar]";

        #endregion




        #region Usuario

        public static string UsuariosListar = "Acce.sp_Usuarios_listar";
        public static string Usuariosllenar = "Acce.sp_Usuarios_buscar";
        public static string UsuariosActualizar = "Acce.sp_Usuarios_actualizar";
        public static string UsuariosEliminar = "Acce.sp_Usuarios_eliminar";
        public static string InicioSesion = "Acce.sp_Usuarios_inicioSesion";

        #endregion







        #endregion


      


    }
}
