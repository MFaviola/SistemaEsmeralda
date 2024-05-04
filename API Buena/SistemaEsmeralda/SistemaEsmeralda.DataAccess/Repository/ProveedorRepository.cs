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
  public  class ProveedorRepository : IRepository<tbProveedores>
    {


        public RequestStatus Insert(tbProveedores item)
        {
            const string sql = "[Gral].[sp_Proveedores_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();

                parametro.Add("@Prov_Proveedor", item.Prov_Proveedor);
                parametro.Add("@Prov_Telefono", item.Prov_Telefono);
              
                parametro.Add("@Muni_Codigo", item.Muni_Codigo);
              
                parametro.Add("@Prov_UsuarioCreacion", 1);
                parametro.Add("@Prov_FechaCreacion", item.Prov_FechaCreacion);



                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbProveedores> List()
        {
            const string sql = "Gral.sp_Proveedores_listar";

            List<tbProveedores> result = new List<tbProveedores>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbProveedores>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbProveedores Fill(int id)
        {

            tbProveedores result = new tbProveedores();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Prov_Id", id);
                result = db.QueryFirst<tbProveedores>(ScriptsBaseDeDatos.Proveedoresllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbProveedores item)
        {
            string sql = ScriptsBaseDeDatos.ProveedoressActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Prov_Id", item.Prov_Id);
                parameter.Add("@Prov_Proveedor", item.Prov_Proveedor); 
                parameter.Add("@Prov_Telefono", item.Prov_Telefono);
                parameter.Add("@Muni_Codigo", item.Muni_Codigo);
                parameter.Add("@Prov_UsuarioModificacion", item.Prov_UsuarioModificacion);
                parameter.Add("@Prov_FechaModificacion", item.Prov_FechaModificacion);
                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(int? Prov_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Prov_Id", Prov_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.ProveedoresEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








   

        public tbProveedores Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbProveedores find(int? id)
        {
            throw new NotImplementedException();
        }


    }
}
