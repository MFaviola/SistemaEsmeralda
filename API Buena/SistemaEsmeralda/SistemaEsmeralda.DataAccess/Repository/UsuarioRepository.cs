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
    public class UsuarioRepository : IRepository<tbUsuarios>
    {


        public RequestStatus Insert(tbUsuarios item)
        {
            const string sql = "[Acce].[sp_Usuarios_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Usua_Usuario", item.Usua_Usuario);
                parametro.Add("@Usua_Contra ", item.Usua_Contraseña);
                parametro.Add("@Usua_Admin", item.Usua_Administrador);
                parametro.Add("@Empl_Id", item.Empl_Id);
                parametro.Add("@Rol_Id", item.Role_Id);
                parametro.Add("@Usua_Usua_Creacion", 1);
                parametro.Add("@Usua_Fecha_Creacion", item.Usua_FechaCreacion);



                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbUsuarios> List()
        {
            const string sql = "Acce.sp_Usuarios_listar";

            List<tbUsuarios> result = new List<tbUsuarios>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbUsuarios>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbUsuarios Fill(int id)
        {

            tbUsuarios result = new tbUsuarios();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Usua_Id", id);
                result = db.QueryFirst<tbUsuarios>(ScriptsBaseDeDatos.Usuariosllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbUsuarios item)
        {
            string sql = ScriptsBaseDeDatos.UsuariosActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Usua_Id", item.Usua_Id);
                parameter.Add("@Usua_Usuario", item.Usua_Usuario);
                parameter.Add("@Usua_Admin", item.Usua_Administrador);
                parameter.Add("@Empl_Id", item.Empl_Id);
                parameter.Add("@Rol_Id", item.Role_Id);
                parameter.Add("@UsuarioModificacion", item.Usua_UsuarioModificacion);
                parameter.Add("@FechaModificacion", item.Usua_FechaModificacion);
                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(int Usua_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Usua_Id", Usua_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.UsuariosEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }






        public IEnumerable<tbUsuarios> Validar(string usua, string contra)
        {

            List<tbUsuarios> result = new List<tbUsuarios>();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Usuario", usua);
                parameter.Add("Contra", contra);

                result = db.Query<tbUsuarios>(ScriptsBaseDeDatos.InicioSesion, parameter, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }

        }



        public IEnumerable<tbUsuarios> ValidarUsuario(string codigo, int usua)
        {
            var sql = ScriptsBaseDeDatos.Usuariollenarcodigo;

            List<tbUsuarios> result = new List<tbUsuarios>();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@usua_Id", usua);
                parameter.Add("@codigo", codigo);

                result = db.Query<tbUsuarios>(sql, parameter, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }

        }



        public IEnumerable<tbUsuarios> ValidarReestablecer(string usuario)
        {

            var sql = ScriptsBaseDeDatos.Usuarios_ValidarReestablecer;
            List<tbUsuarios> result = new List<tbUsuarios>();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameters = new { Usua_Usuario = usuario };
                result = db.Query<tbUsuarios>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public IEnumerable<tbUsuarios> ValidarCodigo(string codigo)
        {

            var sql = ScriptsBaseDeDatos.Usuarios_ValidarCodigo;
            List<tbUsuarios> result = new List<tbUsuarios>();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Codigo", codigo);
                result = db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
                return result;
            }
        }

        public RequestStatus Delete(string id)
        {
            throw new NotImplementedException();
        }

        public tbUsuarios Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbUsuarios find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }
    }
}
