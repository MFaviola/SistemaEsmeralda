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
     public class CargosRepository : IRepository<tbCargos>
    {


        public RequestStatus Insert(tbCargos item)
        {
            const string sql = "[Gral].[sp_Cargos_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Carg_Cargo", item.Carg_Cargo);
                parametro.Add("@Carg_UsuarioCreacion", item.Carg_UsuarioCreacion);
                parametro.Add("@Carg_FechaCreacion", item.Carg_FechaCreacion);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbCargos> List()
        {
            const string sql = "Gral.sp_Cargos_listar";

            List<tbCargos> result = new List<tbCargos>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbCargos>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbCargos Fill(int id)
        {

            tbCargos result = new tbCargos();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Carg_Id", id);
                result = db.QueryFirst<tbCargos>(ScriptsBaseDeDatos.Cargosllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbCargos item)
        {
            string sql = ScriptsBaseDeDatos.CargosActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Carg_Id", item.Carg_Id);
                parameter.Add("@Carg_Cargo", item.Carg_Cargo);
                parameter.Add("@Carg_UsuarioModificacion", item.Carg_UsuarioModificacion);
                parameter.Add("@Carg_FechaModificacion", item.Carg_FechaModificacion);

                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(int? Carg_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Carg_Id", Carg_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.CargosEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public tbCargos Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbCargos find(int? id)
        {
            throw new NotImplementedException();
        }

    }
}
