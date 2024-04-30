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
  public  class MarcaRepository : IRepository<tbMarcas>
    {


        public RequestStatus Insert(tbMarcas item)
        {
            const string sql = "[Gral].[sp_Marca_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Marc_Marca", item.Marc_Marca);
                parametro.Add("@Marc_UsuarioCreacion", item.Marc_UsuarioCreacion);
                parametro.Add("@Marc_FechaCreacion", item.Marc_FechaCreacion);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbMarcas> List()
        {
            const string sql = "Gral.sp_Marca_listar";

            List<tbMarcas> result = new List<tbMarcas>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbMarcas>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbMarcas Fill(int id)
        {

            tbMarcas result = new tbMarcas();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Marc_Id", id);
                result = db.QueryFirst<tbMarcas>(ScriptsBaseDeDatos.Marcasllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbMarcas item)
        {
            string sql = ScriptsBaseDeDatos.MarcasActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Marc_Id", item.Marc_Id);
                parameter.Add("@Marc_Marca", item.Marc_Marca);
                parameter.Add("@Marc_UsuarioModificacion", item.Marc_UsuarioModificacion);
                parameter.Add("@Marc_FechaModificacion", item.Marc_FechaModificacion);

                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Marc_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Marc_Id", Marc_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.MarcasEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbMarcas Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbMarcas find(int? id)
        {
            throw new NotImplementedException();
        }



    }
}
