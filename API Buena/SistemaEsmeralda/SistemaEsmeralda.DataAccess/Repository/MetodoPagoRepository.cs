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
   public  class MetodoPagoRepository: IRepository<tbMetodosPago>
    {


        public RequestStatus Insert(tbMetodosPago item)
        {
            const string sql = "[Gral].[sp_MetodosPago_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Mepa_Metodo", item.Mepa_Metodo);
                parametro.Add("@Mepa_UsuarioCreacion", item.Mepa_UsuarioCreacion);
                parametro.Add("@Mepa_FechaCreacion", item.Mepa_FechaCreacion);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbMetodosPago> List()
        {
            const string sql = "Gral.sp_MetodosPago_listar";

            List<tbMetodosPago> result = new List<tbMetodosPago>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbMetodosPago>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbMetodosPago Fill(int id)
        {

            tbMetodosPago result = new tbMetodosPago();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Mepa_Id", id);
                result = db.QueryFirst<tbMetodosPago>(ScriptsBaseDeDatos.MMetodosPagollenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbMetodosPago item)
        {
            string sql = ScriptsBaseDeDatos.MetodosPagoActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Mepa_Id", item.Mepa_Id);
                parameter.Add("@Mepa_Metodo", item.Mepa_Metodo);
                parameter.Add("@Mepa_UsuarioModificacion", item.Mepa_UsuarioModificacion);
                parameter.Add("@Mepa_FechaModificacion", item.Mepa_FechaModificacion);

                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Mepa_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Mepa_Id", Mepa_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.MetodosPagoEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbMetodosPago Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbMetodosPago find(int? id)
        {
            throw new NotImplementedException();
        }

    }
}
