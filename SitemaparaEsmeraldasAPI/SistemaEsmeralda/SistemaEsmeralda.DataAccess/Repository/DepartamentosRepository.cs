using Dapper;
using Microsoft.Data.SqlClient;
using SistemaEsmeralda.DataAccess.Context;
using SistemaEsmeralda.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.DataAccess.Repository
{
    public class DepartamentosRepository : IRepository<tbDepartamentos>
    {
      

        public RequestStatus Insert(tbDepartamentos item)
        {
            const string sql = "[Gral].[sp_Departamentos_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Depa_Codigo", item.Depa_Codigo);
                parametro.Add("@Depa_Departamento", item.Depa_Departamento);
                parametro.Add("@Depa_UsuarioCreacion", item.Depa_UsuarioCreacion);
                parametro.Add("@Depa_FechaCreacion", item.Depa_FechaCreacion);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbDepartamentos> List()
        {
            const string sql = "Gral.sp_Departamentos_listar";

            List<tbDepartamentos> result = new List<tbDepartamentos>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbDepartamentos>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbDepartamentos Fill(string id)
        {

            tbDepartamentos result = new tbDepartamentos();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Depa_Codigo", id);
                result = db.QueryFirst<tbDepartamentos>(ScriptsBaseDeDatos.Departamentollenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbDepartamentos item)
        {
            string sql = ScriptsBaseDeDatos.DepartamentoActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Depa_Codigo", item.Depa_Codigo);
                parameter.Add("@Depa_Departamento", item.Depa_Departamento);
                parameter.Add("@Depa_UsuarioModificacion", item.Depa_UsuarioModificacion);
                parameter.Add("@Depa_FechaModificacion", item.Depa_FechaModificacion);

                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Depa_Codigo)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Depa_Codigo", Depa_Codigo);

                var result = db.QueryFirst(ScriptsBaseDeDatos.DepartamentoEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbDepartamentos Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbDepartamentos find(int? id)
        {
            throw new NotImplementedException();
        }
    }
}
