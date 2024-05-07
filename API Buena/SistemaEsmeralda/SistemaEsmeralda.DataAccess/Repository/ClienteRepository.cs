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
   public class ClienteRepository : IRepository<tbClientes>
    {


        public RequestStatus Insert(tbClientes item)
        {
            const string sql = "[Gral].[sp_Clientes_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();

                parametro.Add("@Clie_Nombre", item.Clie_Nombre);
                parametro.Add("@Clie_Apellido", item.Clie_Apellido);
                parametro.Add("@Clie_FechaNac", item.Clie_FechaNac);
                parametro.Add("@Clie_Sexo", item.Clie_Sexo);
                parametro.Add("@Muni_Codigo", item.Muni_Codigo);
                parametro.Add("@Esta_Id", item.Esta_Id);
                parametro.Add("@Clie_UsuarioCreacion", 1);
                parametro.Add("@Clie_FechaCreacion", item.Clie_FechaCreacion);
                parametro.Add("@Clie_DNI", item.Clie_DNI);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbClientes> List()
        {
            const string sql = "Gral.sp_Clientes_listar";

            List<tbClientes> result = new List<tbClientes>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbClientes>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbClientes Fill(int id)
        {

            tbClientes result = new tbClientes();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Clie_Id", id);
                result = db.QueryFirst<tbClientes>(ScriptsBaseDeDatos.Clientesllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbClientes item)
        {
            string sql = ScriptsBaseDeDatos.ClientesActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Clie_Id", item.Clie_Id);
                parameter.Add("@Clie_Nombre", item.Clie_Nombre);
                parameter.Add("@Clie_Apellido", item.Clie_Apellido);
                parameter.Add("@Clie_FechaNac", item.Clie_FechaNac);
                parameter.Add("@Clie_Sexo", item.Clie_Sexo);
                parameter.Add("@Muni_Codigo", item.Muni_Codigo);
                parameter.Add("@Esta_Id", item.Esta_Id);
                parameter.Add("@Clie_DNI", item.Clie_DNI);
                parameter.Add("@Clie_UsuarioModificacion", 1);
                parameter.Add("@Clie_FechaModificacion", item.Clie_FechaModificacion);
                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(int Clie_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Clie_Id", Clie_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.ClientesEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbClientes Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbClientes find(int? id)
        {
            throw new NotImplementedException();
        }

    }
}
