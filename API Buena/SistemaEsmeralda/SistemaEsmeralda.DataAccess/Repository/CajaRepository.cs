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
    public class CajaRepository : IRepository<tbCajas>
    {
        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbCajas Details(int? id)
        {
            throw new NotImplementedException();
        }
        public IEnumerable<tbCajas> Validacion(string Date, string sucu)
        {
            const string sql = "[Vent].[sp_Cajas_Validar]";

            List<tbCajas> result = new List<tbCajas>();
            var parameters = new { FechaHoy = Date , Sucu_Id  = sucu };
           
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbCajas>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }
        public tbCajas find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbCajas item)
        {
            string sql = "[Vent].[sp_Cajas_Insertar]";

            try
            {
                using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
                {
                    var parameter = new DynamicParameters();
                    parameter.Add("@caja_UsuarioApertura", item.caja_UsuarioApertura);
                    parameter.Add("@caja_FechaApertura", DateTime.Now);
                    parameter.Add("@caja_MontoInicial", item.caja_MontoInicial, DbType.String);
                    parameter.Add("@Sucu_Id", item.Sucu_Id);

                    var result = db.QueryFirstOrDefault<int>(sql, parameter, commandType: CommandType.StoredProcedure);
                    string mensaje = (result == 1) ? "exito" : "error";
                    return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
                }
            }
            catch (Exception ex)
            {
                return new RequestStatus { CodeStatus = -1, MessageStatus = $"Error: {ex.Message}" };
            }
        }

        public IEnumerable<tbCajas> List()
        {
            throw new NotImplementedException();
        }

        public RequestStatus Update(tbCajas item)
        {
            string sql = "[Vent].[sp_Cajas_Cierre]";

            try
            {
                using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
                {
                    var parameter = new DynamicParameters();
                    parameter.Add("@caja_UsuarioCierre", item.caja_UsuarioCierre, DbType.Int32);
                    parameter.Add("@caja_FechaCierre", DateTime.Now, DbType.DateTime);
                    parameter.Add("@caja_Observacion", item.caja_Observacion, DbType.String);
                    parameter.Add("@caja_MontoFinal", item.caja_MontoFinal, DbType.Decimal);
                    parameter.Add("@caja_MontoInicial", item.caja_MontoInicial, DbType.Decimal);
                    parameter.Add("@caja_MontoSistema", item.caja_MontoSistema, DbType.Decimal);
                    parameter.Add("@caja_Id", item.caja_Id, DbType.Int32);

                    var result = db.QueryFirstOrDefault<int>(sql, parameter, commandType: CommandType.StoredProcedure);
                    string mensaje = (result == 1) ? "exito" : "error";
                    return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
                }
            }
            catch (Exception ex)
            {
                return new RequestStatus { CodeStatus = -1, MessageStatus = $"Error: {ex.Message}" };
            }
        }
    }
}
