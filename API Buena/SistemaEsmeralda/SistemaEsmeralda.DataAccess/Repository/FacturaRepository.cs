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
    public class FacturaRepository : IRepository<tbFactura>
    {
        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbFactura Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbFactura find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbFactura item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbFactura> List()
        {
            const string sql = "Vent.sp_Factura_listar";

            List<tbFactura> result = new List<tbFactura>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbFactura>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public RequestStatus Update(tbFactura item)
        {
            throw new NotImplementedException();
        }
    }
}
