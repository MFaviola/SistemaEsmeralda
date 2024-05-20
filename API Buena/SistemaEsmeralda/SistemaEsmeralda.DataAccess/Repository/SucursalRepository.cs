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
    public class SucursalRepository : IRepository<tbSucursales>
    {


        public RequestStatus Insert(tbSucursales item)
        {
            const string sql = "[Gral].[sp_Sucursales_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Sucu_Nombre", item.Sucu_Nombre);
                parametro.Add("@Muni_Codigo", item.Muni_Codigo);

                parametro.Add("@Sucu_UsuarioCreacion", item.Sucu_UsuarioCreacion);
                parametro.Add("@Sucu_FechaCreacion", item.Sucu_FechaCreacion);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbSucursales> List()
        {
            const string sql = "Gral.sp_Sucursales_listar";

            List<tbSucursales> result = new List<tbSucursales>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbSucursales>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbSucursales Fill(int id)
        {

            tbSucursales result = new tbSucursales();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Sucu_Id", id);
                result = db.QueryFirst<tbSucursales>(ScriptsBaseDeDatos.Sucursalesllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbSucursales item)
        {
            string sql = ScriptsBaseDeDatos.SucursalesActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Sucu_Id", item.Sucu_Id);
                parameter.Add("@Sucu_Nombre", item.Sucu_Nombre);
                parameter.Add("@Muni_Codigo", item.Muni_Codigo);

                parameter.Add("@Sucu_UsuarioModificacion", item.Sucu_UsuarioModificacion);
                parameter.Add("@Sucu_FechaModificacion", item.Sucu_FechaModificacion);

                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Carg_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Sucu_Id", Carg_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.SucursalesEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbSucursales Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbSucursales find(int? id)
        {
            throw new NotImplementedException();
        }
    }
}
