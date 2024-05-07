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
    public class RolRepository
    {

        public int Insert(tbRoles item)
        {
            const string sql = "[Acce].[sp_Roles2_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Role_Rol", item.Role_Rol);
                parametro.Add("@Role_UsuarioCreacion", item.Role_UsuarioCreacion);
                parametro.Add("@Role_FechaCreacion", item.Role_FechaCreacion);
                parametro.Add("@ID", DbType.Int32, direction: ParameterDirection.Output);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                int id = parametro.Get<int>("@ID");


                return id;
            }
        }

        public IEnumerable<tbRoles> List()
        {
            const string sql = "Acce.sp_Roles_listar";

            List<tbRoles> result = new List<tbRoles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbRoles>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbRoles Fill(int id)
        {

            tbRoles result = new tbRoles();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Role_Id", id);
                result = db.QueryFirst<tbRoles>(ScriptsBaseDeDatos.Rolesllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbRoles item)
        {
            string sql = ScriptsBaseDeDatos.RolesActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Role_Id", item.Role_Id);
                parameter.Add("@Role_Rol", item.Role_Rol);
                parameter.Add("@Role_UsuarioModificacion", item.Role_UsuarioModificacion);
                parameter.Add("@Role_FechaModificacion", item.Role_FechaModificacion);

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

                var result = db.QueryFirst(ScriptsBaseDeDatos.RolesEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }







        public IEnumerable<tbRoles> Listpantallas()
        {
            const string sql = "Acce.sp_Pantallas_listar ";

            List<tbRoles> result = new List<tbRoles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbRoles>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }


        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbRoles Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbRoles find(int? id)
        {
            throw new NotImplementedException();
        }





    }
}
