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
   public class JoyaRepository : IRepository<tbJoyas>
    {


        public RequestStatus Insert(tbJoyas item)
        {
            const string sql = "[Vent].[sp_Joyas_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {

                var parametro = new DynamicParameters();
                parametro.Add("@Joya_Nombre", item.Joya_Nombre);
                parametro.Add("@Joya_PrecioCompra", item.Joya_PrecioCompra);
                parametro.Add("@Joya_PrecioVenta", item.Joya_PrecioVenta);
                parametro.Add("@Joya_PrecioMayor", item.Joya_PrecioMayor);
                parametro.Add("@Joya_Imagen", item.Joya_Imagen);
                parametro.Add("@Joya_Stock", item.Joya_Stock);
                parametro.Add("@Prov_Id", item.Prov_Id);
                parametro.Add("@Mate_Id", item.Mate_Id);
                parametro.Add("@Cate_Id", item.Cate_Id);
                parametro.Add("@Joya_UsuarioCreacion", 1);
                parametro.Add("@Joya_FechaCreacion", item.Joya_FechaCreacion);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbJoyas> ListaAutoCompletado()
        {
            const string sql = "[Vent].[sp_Joyas_listarAutoCompletado]";


            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbJoyas>(sql, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public IEnumerable<tbJoyas> ListaPorCodigo(string codigo)
        {
            const string sql = "[Vent].[sp_FiltroJoyaCodigo]";

            var parameters = new { Joya_Id = codigo };

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbJoyas>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
            }
        }


        public IEnumerable<tbJoyas> List()
        {
            const string sql = "Vent.sp_Joyas_listar";

            List<tbJoyas> result = new List<tbJoyas>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbJoyas>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }


        public tbJoyas Fill(int id)
        {

            tbJoyas result = new tbJoyas();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Joya_Id", id);
                result = db.QueryFirst<tbJoyas>(ScriptsBaseDeDatos.Joyasllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbJoyas item)
        {
            string sql = ScriptsBaseDeDatos.JoyasActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Joya_Id", item.Joya_Id);
                parameter.Add("@Joya_Nombre", item.Joya_Nombre);
                parameter.Add("@Joya_PrecioCompra", item.Joya_PrecioCompra);
                parameter.Add("@Joya_PrecioVenta", item.Joya_PrecioVenta);
                parameter.Add("@Joya_PrecioMayor", item.Joya_PrecioMayor);
                parameter.Add("@Joya_Imagen", item.Joya_Imagen);
                parameter.Add("@Joya_Stock", item.Joya_Stock);
                parameter.Add("@Prov_Id", item.Prov_Id);
                parameter.Add("@Mate_Id", item.Mate_Id);
                parameter.Add("@Joya_PrecioVenta", item.Joya_PrecioVenta);
                parameter.Add("@Cate_Id", item.Cate_Id);
                parameter.Add("@Joya_UsuarioModificacion", item.Joya_UsuarioModificacion);
                parameter.Add("@Joya_FechaModificacion", item.Joya_FechaModificacion);
                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Joya_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Joya_Id", Joya_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.JoyasEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbJoyas Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbJoyas find(int? id)
        {
            throw new NotImplementedException();
        }


    }
}
