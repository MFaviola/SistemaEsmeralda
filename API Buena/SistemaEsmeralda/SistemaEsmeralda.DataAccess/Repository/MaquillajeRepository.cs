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
   public class MaquillajeRepository : IRepository<tbMaquillajes>
    {


        public RequestStatus Insert(tbMaquillajes item)
        {
            const string sql = "[Vent].[sp_Maquillajes_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {

                var parametro = new DynamicParameters();
                parametro.Add("@Maqu_Nombre", item.Maqu_Nombre);
                parametro.Add("@Maqu_PrecioCompra", item.Maqu_PrecioCompra);
                parametro.Add("@Maqu_PrecioVenta", item.Maqu_PrecioVenta);
                parametro.Add("@Maqu_Stock", item.Maqu_Stock);
                parametro.Add("@Maqu_PrecioMayor", item.Maqu_PrecioMayor);
                parametro.Add("@Maqu_Imagen", item.Maqu_Imagen);
                parametro.Add("@Prov_Id", item.Prov_Id);
                parametro.Add("@Marc_Id", item.Marc_Id);
                parametro.Add("@Maqu_UsuarioCreacion", 1);
                parametro.Add("@Maqu_FechaCreacion", item.Maqu_FechaCreacion);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbMaquillajes> List()
        {
            const string sql = "Vent.sp_Maquillajes_listar";

            List<tbMaquillajes> result = new List<tbMaquillajes>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbMaquillajes>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }


        public IEnumerable<tbMaquillajes> ListaAutocompletado()
        {
            const string sql = "[Vent].[sp_Maquillajes_listarAutoCompletado]";


            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbMaquillajes>(sql, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public IEnumerable<tbMaquillajes> ListaPorCodigo(string codigo)
        {
            const string sql = "[Vent].[sp_FiltroMaquillajeCodigo]";

            var parameters = new { Maqu_Id = codigo };

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbMaquillajes>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
            }
        }
        public tbMaquillajes Fill(int id)
        {

            tbMaquillajes result = new tbMaquillajes();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Maqu_Id", id);
                result = db.QueryFirst<tbMaquillajes>(ScriptsBaseDeDatos.Maquillajesllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbMaquillajes item)
        {
            string sql = ScriptsBaseDeDatos.MaquillajesActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Maqu_Id", item.Maqu_Id);
                parameter.Add("@Maqu_Nombre", item.Maqu_Nombre);
                parameter.Add("@Maqu_PrecioCompra", item.Maqu_PrecioCompra);
                parameter.Add("@Maqu_PrecioVenta", item.Maqu_PrecioVenta);
                parameter.Add("@Maqu_PrecioMayor", item.Maqu_PrecioMayor);
                parameter.Add("@Maqu_Imagen", item.Maqu_Imagen);
                parameter.Add("@Maqu_Stock", item.Maqu_Stock);
                parameter.Add("@Prov_Id", item.Prov_Id);
                parameter.Add("@Marc_Id", item.Marc_Id);
                parameter.Add("@Maqu_UsuarioModificacion", item.Maqu_UsuarioModificacion);
                parameter.Add("@Maqu_FechaModificacion", item.Maqu_FechaModificacion);
                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Maqu_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Maqu_Id", Maqu_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.MaquillajesEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbMaquillajes Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbMaquillajes find(int? id)
        {
            throw new NotImplementedException();
        }

    }
}
