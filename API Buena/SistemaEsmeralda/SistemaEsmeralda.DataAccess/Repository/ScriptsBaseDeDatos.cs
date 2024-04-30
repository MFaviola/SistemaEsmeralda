using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.DataAccess.Repository
{
   public class ScriptsBaseDeDatos
    {

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




    }
}
