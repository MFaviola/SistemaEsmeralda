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
    public class ImpuestoRepository : IRepository<tbImpuestos>
    {


        public RequestStatus Insert(tbImpuestos item)
        {
            const string sql = "[Gral].[sp_Impuestos_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Impu_Impuesto", item.Impu_Impuesto);
                parametro.Add("@Impu_UsuarioCreacion", item.Impu_UsuarioCreacion);
                parametro.Add("@Impu_FechaCreacion", item.Impu_FechaCreacion);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbImpuestos> List()
        {
            const string sql = "Gral.sp_Impuestos_listar";

            List<tbImpuestos> result = new List<tbImpuestos>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbImpuestos>(ScriptsBaseDeDatos.ImpuestoListar, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }

        public tbImpuestos Fill(int id)
        {

            tbImpuestos result = new tbImpuestos();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Impu_Id", id);
                result = db.QueryFirst<tbImpuestos>(ScriptsBaseDeDatos.Impuestollenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbImpuestos item)
        {
            string sql = ScriptsBaseDeDatos.ImpuestoActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Impu_Id", item.Impu_Id);
                parameter.Add("@Impu_Impuesto", item.Impu_Impuesto);
                parameter.Add("@Impu_UsuarioModificacion", item.Impu_UsuarioModificacion);
                parameter.Add("@Impu_FechaModificacion", item.Impu_FechaModificacion);

                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Impu_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Impu_Id", Impu_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.ImpuestoEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbImpuestos Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbImpuestos find(int? id)
        {
            throw new NotImplementedException();
        }

    }
}
