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
    public class FacturaCompraRepository : IRepository<tbFacturaCompraEncabezado>
    {
        public int CodeStatus { get; private set; }

        public RequestStatus Delete(int? id)
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraEliminar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@ID", id);
                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);

                return new RequestStatus { CodeStatus = result, MessageStatus = "" };

            }
        }
        public RequestStatus Deleted(int? id)
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraDetalleEliminar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@ID", id);
                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);

                return new RequestStatus { CodeStatus = result, MessageStatus = "" };

            }
        }


        public tbFacturaCompraEncabezado Details(int? id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbFacturaCompraDetalle> find1(int? id)
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraBuscar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@id", id);
                var result = db.Query<tbFacturaCompraDetalle>(sql, parametro, commandType: CommandType.StoredProcedure).ToList();

                return result;

            }
        }

        public (RequestStatus, int) Insert1(tbFacturaCompraEncabezado item)
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraInsertar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Prov_Id", item.Prov_Id);
                parametro.Add("@Mepa_Id", item.Mepa_Id);
                parametro.Add("@FeCE_UsuarioCreacion", item.UsuarioCreacion);
                parametro.Add("@FaCE_FechaCreacion", DateTime.Now);
                parametro.Add("@ID", dbType: DbType.Int32, direction: ParameterDirection.Output);
                var result = db.Execute(sql, parametro, commandType: System.Data.CommandType.StoredProcedure);

                int FaCE_Id = parametro.Get<int>("@ID");
                string mensaje = (result == 1) ? "Exito" : "Error";

                return (new RequestStatus { CodeStatus = result, MessageStatus = mensaje },FaCE_Id);
            }
        }

        public IEnumerable<tbFacturaCompraDetalle> List()
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraListado;

            List<tbFacturaCompraDetalle> result = new List<tbFacturaCompraDetalle>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbFacturaCompraDetalle>(sql, commandType: System.Data.CommandType.Text).ToList();
                return result;
            }

        }

        public IEnumerable<tbFacturaCompraDetalle> Listao(int id)
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraDetalleListado;

            List<tbFacturaCompraDetalle> result = new List<tbFacturaCompraDetalle>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var par = new DynamicParameters();
                par.Add("@FaCE_Id", id);
                result = db.Query<tbFacturaCompraDetalle>(sql, par, commandType: System.Data.CommandType.StoredProcedure).ToList();
                return result;
            }

        }

        public IEnumerable<tbFacturaCompraDetalle> Finalizar(int id)
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraFinalizar;

            List<tbFacturaCompraDetalle> result = new List<tbFacturaCompraDetalle>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var par = new DynamicParameters();
                par.Add("@FaCE_Id", id);
                par.Add("@FaCE_FechaFinal", DateTime.Now);
                result = db.Query<tbFacturaCompraDetalle>(sql, par, commandType: System.Data.CommandType.StoredProcedure).ToList();
                return result;
            }

        }

        public RequestStatus Update1(tbFacturaCompraEncabezado item)
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@FaCE_Id", item.FaCE_Id);
                parametro.Add("@Prov_Id", item.Prov_Id);
                parametro.Add("@Mepa_Id", item.Mepa_Id);
                parametro.Add("@FeCE_UsuarioModificacion", item.FaCE_UsuarioModificacion);
                parametro.Add("@FaCE_FechaModificacion", DateTime.Now);
                var result = db.Execute(sql, parametro, commandType: System.Data.CommandType.StoredProcedure);

                int Prov_Id = parametro.Get<int>("@proveedor");
                string mensaje = (result == 1) ? "Exito" : "Error";

                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        tbFacturaCompraEncabezado IRepository<tbFacturaCompraEncabezado>.find(int? id)
        {
            throw new NotImplementedException();
        }

        RequestStatus IRepository<tbFacturaCompraEncabezado>.Insert(tbFacturaCompraEncabezado item)
        {
            throw new NotImplementedException();
        }
         RequestStatus Insert(tbFacturaCompraDetalle item)
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraDetalleInsertar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@FaCE_Id", item.FaCE_Id);
                parametro.Add("@FaCD_Dif", item.FaCD_Dif);
                parametro.Add("@Prod_Id", item.Prod_Id);
                parametro.Add("@FaCD_Cantidad", item.FaCD_Cantidad);
                parametro.Add("@PrecioCompra", item.FaCD_Cantidad);
                parametro.Add("@Precio_Venta", item.FaCD_Cantidad);
                parametro.Add("@Precio_Mayor", item.FaCD_Cantidad);
                var result = db.Execute(sql, parametro, commandType: System.Data.CommandType.StoredProcedure);


                return new RequestStatus { CodeStatus = result, MessageStatus = "" };
            }
        }
        public RequestStatus Insert(tbFacturaCompraEncabezado item)
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraDetalleInsertar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@FaCE_Id", item.faCE_Id);
                parametro.Add("@FaCD_Dif", item.faCD_Dif);
                parametro.Add("@NombreProducto", item.nombreProducto);
                parametro.Add("@FaCD_Cantidad", item.faCD_Cantidad);
                parametro.Add("@PrecioCompra", item.precioCompra);
                parametro.Add("@PrecioVenta", item.precioVenta);
                parametro.Add("@PrecioMayor", item.precioMayorista);
                var result = db.Execute(sql, parametro, commandType: System.Data.CommandType.StoredProcedure);


                return new RequestStatus { CodeStatus = result, MessageStatus = "" };
            }
        }
        RequestStatus IRepository<tbFacturaCompraEncabezado>.Update(tbFacturaCompraEncabezado item)
        {
            throw new NotImplementedException();
        }

        IEnumerable<tbFacturaCompraEncabezado> IRepository<tbFacturaCompraEncabezado>.List()
        {
            throw new NotImplementedException();
        }
    }
}
