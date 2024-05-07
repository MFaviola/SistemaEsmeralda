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
    public class PantallaRolesRepository : IRepository<tbPantallasXRoles>
    {


        public RequestStatus Insert(tbPantallasXRoles item)
        {
            const string sql = "[Acce].[sp_PantallasPorRoles_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Role_Id", item.Role_Id);
                parametro.Add("@Pant_Id ", item.Pant_Id);
                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbPantallasXRoles> List()
        {
            const string sql = "Acce.sp_PantallasRoles_listar";

            List<tbPantallasXRoles> result = new List<tbPantallasXRoles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbPantallasXRoles>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public IEnumerable<tbPantallasXRoles> Fill(int id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Role_Id", id);
                return db.Query<tbPantallasXRoles>(ScriptsBaseDeDatos.PantallasRolesllenar, parameter, commandType: CommandType.StoredProcedure);
            }
        }

        public RequestStatus Update(tbPantallasXRoles item)
        {
            string sql = ScriptsBaseDeDatos.PantallasRolesActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Paxr_Id", item.Paxr_Id);
                parameter.Add("@Role_Id", item.Role_Id);
                parameter.Add("@Pant_Id", item.Pant_Id);
              
                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Role_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Role_Id", Role_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.PantallasRolesEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }











        public IEnumerable<tbPantallasXRoles> ValidarReestablecer(string usuario)
        {


            List<tbPantallasXRoles> result = new List<tbPantallasXRoles>();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameters = new { Usua_Usuario = usuario };
                result = db.Query<tbPantallasXRoles>(ScriptsBaseDeDatos.Usuarios_ValidarReestablecer, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }



        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbPantallasXRoles Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbPantallasXRoles find(int? id)
        {
            throw new NotImplementedException();
        }



    }
}
