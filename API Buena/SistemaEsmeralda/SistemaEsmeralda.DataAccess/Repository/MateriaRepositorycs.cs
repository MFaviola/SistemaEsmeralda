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
   public  class MateriaRepositorycs : IRepository<tbMateriales>
    {


        public RequestStatus Insert(tbMateriales item)
        {
            const string sql = "[Gral].[sp_Materiales_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Mate_Material", item.Mate_Material);
                parametro.Add("@Mate_UsuarioCreacion", item.Mate_UsuarioCreacion);
                parametro.Add("@Mate_FechaCreacion", item.Mate_FechaCreacion);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbMateriales> List()
        {
            const string sql = "Gral.sp_Materiales_listar";

            List<tbMateriales> result = new List<tbMateriales>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbMateriales>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbMateriales Fill(int id)
        {

            tbMateriales result = new tbMateriales();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Mate_Id", id);
                result = db.QueryFirst<tbMateriales>(ScriptsBaseDeDatos.Materialesllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbMateriales item)
        {
            string sql = ScriptsBaseDeDatos.MaterialesActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Mate_Id", item.Mate_Id);
                parameter.Add("@Mate_Material", item.Mate_Material);
                parameter.Add("@Mate_UsuarioModificacion", item.Mate_UsuarioModificacion);
                parameter.Add("@Mate_FechaModificacion", item.Mate_FechaModificacion);

                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Mate_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Mate_Id", Mate_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.MaterialesEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbMateriales Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbMateriales find(int? id)
        {
            throw new NotImplementedException();
        }

    }
}
