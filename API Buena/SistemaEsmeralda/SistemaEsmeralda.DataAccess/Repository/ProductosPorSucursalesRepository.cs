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
    public class ProductosPorSucursalesRepository : IRepository<tbProductosPorSucursalesEncabezados>
    {
        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbProductosPorSucursalesEncabezados Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbProductosPorSucursalesEncabezados find(int? id)
        {
            throw new NotImplementedException();
        }

        public (RequestStatus, int) InsertarEncabezado(tbProductosPorSucursalesEncabezados item)
        {
            const string sql = "Vent.ProductosPorSucursalesEncabezado_Insertar";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Sucu_Id", item.Sucu_Id);
                parametro.Add("@Pren_UsuarioCreacion", item.Pren_UsuarioCreacion);
                parametro.Add("@@Pren_FechaCreacion", DateTime.Now);
                parametro.Add("@ID", dbType: DbType.Int32, direction: ParameterDirection.Output);
                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                int Stock = parametro.Get<int>("@ID");
                string mensaje = (result == 1) ? "Exito" : "Error";
                return (new RequestStatus { CodeStatus = result, MessageStatus = mensaje }, Stock);
            }
        }

        public RequestStatus InsertarDetalles(tbProductosPorSucurales item)
        {
            const string sql = "Vent.sp_ProductosPorSucursales_Transferir";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Prxs_Dif", item.Prxs_Dif);
                parametro.Add("@Prod_Nombre", item.Prod_Nombre);
                parametro.Add("@Prsx_Stock", item.Prsx_Stock);
                parametro.Add("@Sucu_RecibidoId", item.Sucu_Id);
                parametro.Add("@Sucu_EnviadoId", item.SucuEnviado);
                var result = db.QueryFirstOrDefault<int>(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }
        public RequestStatus Insert(tbProductosPorSucursalesEncabezados item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbProductosPorSucursalesEncabezados> List()
        {
            throw new NotImplementedException();
        }

        public RequestStatus Update(tbProductosPorSucursalesEncabezados item)
        {
            throw new NotImplementedException();
        }
    }
}
