using Dapper;
using Microsoft.Data.SqlClient;
using SistemaEsmeralda.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.DataAccess.Repository
{
   public class GraficosRepository
    {

        public IEnumerable<tbFacturaDetalles> totalProductoMes()
        {
            const string sql = "[Vent].[sp_Dash_CantidadProducto_Mes]";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))


            {
                var mes = DateTime.Now.Year;
                var parameter = new DynamicParameters();
                parameter.Add("@MesActual", DateTime.Now.Month);
                parameter.Add("@AñoActual", DateTime.Now.Year);

                result = db.Query<tbFacturaDetalles>(sql, parameter, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }




        public IEnumerable<tbFacturaDetalles> totalMaquillajeMes()
        {
            const string sql = "Vent.sp_Dash_MaquillajeMes";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@MesActual", DateTime.Now.Month);
                parameter.Add("@AñoActual", DateTime.Now.Year);

           

                result = db.Query<tbFacturaDetalles>(sql, parameter, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }



        ////////////////////////////////////


        public IEnumerable<tbFacturaDetalles> totalJoyasMesfiltrado(DateTime fecha)
        {
            const string sql = "Vent.sp_Dash_JoyasMes";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {


                int año = ObtenerAño(fecha);
                int mesi = Obtenemes(fecha);

                var parameter = new DynamicParameters();
                parameter.Add("@MesActual", mesi);
                parameter.Add("@AñoActual", año);


                result = db.Query<tbFacturaDetalles>(sql, parameter, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }









        public IEnumerable<tbFacturaDetalles> totalMaquillajeMesfiltrado(DateTime fecha)
        {
            const string sql = "Vent.sp_Dash_MaquillajeMes";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {


                int año = ObtenerAño(fecha);
                int mesi = Obtenemes(fecha);

                var parameter = new DynamicParameters();
                parameter.Add("@MesActual", mesi);
                parameter.Add("@AñoActual", año);



                result = db.Query<tbFacturaDetalles>(sql, parameter, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }










        public IEnumerable<tbFacturaDetalles> totalinJoyasMesfiltrado(DateTime fecha)
        {
            const string sql = "[Vent].[sp_TotalFinal_JoyasMes]";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {

                int año = ObtenerAño(fecha);
                int mesi = Obtenemes(fecha);

                var parameter = new DynamicParameters();
                parameter.Add("@MesActual", mesi);
                parameter.Add("@AñoActual", año);

                result = db.Query<tbFacturaDetalles>(sql, parameter, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }






        public IEnumerable<tbFacturaDetalles> totalinMaquillajeMesfiltrado(DateTime fecha)
        {
            const string sql = "[Vent].[sp_TotalFinal_MaquillajeMes]";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {


                int año = ObtenerAño(fecha);
                int mesi = Obtenemes(fecha);

                var parameter = new DynamicParameters();
                parameter.Add("@MesActual", mesi);
                parameter.Add("@AñoActual", año);


                result = db.Query<tbFacturaDetalles>(sql, parameter, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }






        ////////////////// ///









        public IEnumerable<tbFacturaDetalles> totalJoyasMes()
        {
            const string sql = "Vent.sp_Dash_JoyasMes";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {


                var parameter = new DynamicParameters();
                parameter.Add("@MesActual", DateTime.Now.Month);
                parameter.Add("@AñoActual", DateTime.Now.Year);

            
                result = db.Query<tbFacturaDetalles>(sql, parameter, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }








        public IEnumerable<tbFacturaDetalles> totalinJoyasMes()
        {
            const string sql = "[Vent].[sp_TotalFinal_JoyasMes]";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {


                var parameter = new DynamicParameters();
                parameter.Add("@MesActual", DateTime.Now.Month);
                parameter.Add("@AñoActual", DateTime.Now.Year);


                result = db.Query<tbFacturaDetalles>(sql, parameter, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }






        public IEnumerable<tbFacturaDetalles> totalinMaquillajeMes()
        {
            const string sql = "[Vent].[sp_TotalFinal_MaquillajeMes]";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {


                var parameter = new DynamicParameters();
                parameter.Add("@MesActual", DateTime.Now.Month);
                parameter.Add("@AñoActual", DateTime.Now.Year);


                result = db.Query<tbFacturaDetalles>(sql, parameter, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }







        public IEnumerable<tbFacturaDetalles> totalGeneroMes()
        {
            const string sql = "[Vent].[sp_DashGeneroMes]";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbFacturaDetalles>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }



        public IEnumerable<tbFacturaDetalles> totalProductosMes()
        {
            const string sql = "Vent.sp_ProductosVendidosEnMes";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@MesActual", DateTime.Now.Month);
                parameter.Add("@AñoActual", DateTime.Now.Year);

            
                result = db.Query<tbFacturaDetalles>(sql, parameter, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }




        public IEnumerable<tbFacturaDetalles> Ventatotal()
        {
            const string sql = "Vent.sp_VentastotalMes";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
              

                result = db.Query<tbFacturaDetalles>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }





        public IEnumerable<tbFacturaDetalles> Ventatotalcate()
        {
            const string sql = "Vent.sp_VentastotalMesConDetalles";

            List<tbFacturaDetalles> result = new List<tbFacturaDetalles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {


                result = db.Query<tbFacturaDetalles>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }



        public int ObtenerAño(DateTime fecha)
        {
            return fecha.Year;
        }



        public int Obtenemes(DateTime mes)
        {
            return mes.Month;
        }



    }
}
