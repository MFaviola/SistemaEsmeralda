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
    }
}
