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
            throw new NotImplementedException();
        }

        public IEnumerable<tbCajas> List()
        {
            throw new NotImplementedException();
        }

        public RequestStatus Update(tbCajas item)
        {
            throw new NotImplementedException();
        }
    }
}
