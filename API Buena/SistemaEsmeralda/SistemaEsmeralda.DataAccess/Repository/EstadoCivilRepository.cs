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
    public class EstadoCivilRepository
    {

        public RequestStatus Insert(tbEstadosCiviles item)
        {
            const string sql = "[Gral].[sp_EstadosCiviles_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Esta_EstadoCivil", item.Esta_EstadoCivil);
                parametro.Add("@Esta_UsuarioCreacion", item.Esta_UsuarioCreacion);
                parametro.Add("@Esta_FechaCreacion", item.Esta_FechaCreacion);
                parametro.Add("@Esta_FechaCreacion", item.Esta_FechaCreacion);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbEstadosCiviles> List()
        {
            const string sql = "Gral.sp_EstadoCivil_listar";

            List<tbEstadosCiviles> result = new List<tbEstadosCiviles>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbEstadosCiviles>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbEstadosCiviles Fill(int id)
        {

            tbEstadosCiviles result = new tbEstadosCiviles();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Esta_Id", id);
                result = db.QueryFirst<tbEstadosCiviles>(ScriptsBaseDeDatos.EstadosCivilesllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbEstadosCiviles item)
        {
            string sql = ScriptsBaseDeDatos.EstadosCivilesActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Esta_Id", item.Esta_Id);
                parameter.Add("@Esta_UsuarioModificacion", item.Esta_UsuarioModificacion);
                parameter.Add("@Esta_FechaModificacion", item.Esta_FechaModificacion);

                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Esta_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Esta_Id", Esta_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.EstadosCivilesEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbEstadosCiviles Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbEstadosCiviles find(int? id)
        {
            throw new NotImplementedException();
        }


    }
}
