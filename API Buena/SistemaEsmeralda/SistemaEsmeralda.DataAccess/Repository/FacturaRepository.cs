﻿using Dapper;
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


        public (RequestStatus, int) InsertarDetalle(tbFacturaDetalles item)
        {
            const string sql = "[Vent].[sp_FacturaDetalles_Insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Faxd_Dif", item.FaxD_Dif);
                parametro.Add("@Prod_Nombre", item.Prod_Nombre);
                parametro.Add("@Faxd_Cantidad", item.FaxD_Cantidad);
                parametro.Add("@Fact_Id", item.Fact_Id);
                parametro.Add("@Sucu_Id", item.Sucu_Id);
                parametro.Add("@StockFinal", dbType: DbType.Int32, direction: ParameterDirection.Output);

                var result = db.QueryFirstOrDefault<int>(sql, parametro, commandType: CommandType.StoredProcedure);
                int Stock = parametro.Get<int>("StockFinal");
                string mensaje = (result == 1) ? "Exito" : "Error";
                return (new RequestStatus { CodeStatus = result, MessageStatus = mensaje }, Stock);
            }
        }
        public (RequestStatus, int) Insertar(tbFactura item)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Clie_Id", item.Clie_Id);
                parametro.Add("Empl_Id", item.Empl_Id);
                parametro.Add("Mepa_Id", item.Mepa_Id);
                parametro.Add("Sucu_Id", item.Sucu_Id);
                if (item.Fact_Id == 0)
                {
                    parametro.Add("Fact_UsuarioModificacion", null);
                    parametro.Add("Fact_FechaModifcacion", null);
                }
                else
                {
                    parametro.Add("Fact_UsuarioModificacion", item.Fact_UsuarioModificacion);
                    parametro.Add("Fact_FechaModifcacion", DateTime.Now);
                }
                parametro.Add("Fact_FechaCreacion", DateTime.Now);
                parametro.Add("Fact_UsuarioCreacion", item.Fact_UsuarioCreacion);
                parametro.Add("Fact_Id", item.Fact_Id);
                parametro.Add("ID", dbType: DbType.Int32, direction: ParameterDirection.Output);

                var result = db.Execute(ScriptsBaseDeDatos.CrearFactura,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );
                int Fact_Id = parametro.Get<int>("ID");
                string mensaje = (result == 1) ? "Exito" : "Error";

                return (new RequestStatus { CodeStatus = result, MessageStatus = mensaje }, Fact_Id);
            }
        }
        public IEnumerable<tbFactura> Buscar(string ID)
        {
            const string sql = "Vent.sp_Factura_buscar";

            var parameters = new { Fact_Id = ID };
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbFactura>(sql,parameters, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public IEnumerable<tbFactura> ListaDetalles(string ID)
        {
            const string sql = "[Vent].[SP_FacturaDetalles_ProductosVentas]";

            var parameters = new { FactId = ID };
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbFactura>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public IEnumerable<tbProductosPorSucurales> ListaDetallesSucursales(string ID)
        {
            const string sql = "[Vent].[sp_ProductosPorSucursal_Detalle]";

            var parameters = new { Pren_Id = ID };
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbProductosPorSucurales>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public IEnumerable<tbFactura> ReportePorMes(string año,string mes)
        {
            const string sql = "[Vent].[sp_ProductosVendidosEnMes]";

            var parameters = new { Año = año,Mes = mes };
     
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbFactura>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public IEnumerable<tbFactura> ReportePorStock(int valor)
        {
            const string sql = "[Vent].[sp_Reporte_ControlStock]";

            var parameters = new { TipoProducto = valor };

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbFactura>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public IEnumerable<tbFactura> ReportePorEmpleado(int empleado)
        {
            const string sql = "[Vent].[SP_Reporte_FacturaEmpleadoTotal]";

            var parameters = new {EmplId = empleado };

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbFactura>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public IEnumerable<tbFactura> ReporteTop10(string FechaInicio,string FechaFinal)
        {
            const string sql = "[Vent].[sp_ReporteTop10]";

            var parameters = new { FechaInicio = FechaInicio, FechaFin = FechaFinal };

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbFactura>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public IEnumerable<tbFactura> ReporteVentasAnual(int año)
        {
            const string sql = "[Vent].[sp_ReporteVentasAnual]";

            var parameters = new { Año = año};

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbFactura>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public IEnumerable<tbFactura> ReporteVentasMayoristas(string año, string mes)
        {
            const string sql = "[Vent].[sp_ReporteVentasMayoristas]";

            var parameters = new { FechaInicio = año, FechaFinal = mes };

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                return db.Query<tbFactura>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
            }
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

        public RequestStatus Delete(string Fact_Id,string Prod_Nombre,string sucu_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Fact_Id", Fact_Id);
                parameter.Add("Prod_Nombre", Prod_Nombre);
                parameter.Add("@Sucu_Id", sucu_Id);

                var result = db.QueryFirstOrDefault<int>(ScriptsBaseDeDatos.DetalleEliminar, parameter, commandType: CommandType.StoredProcedure);

                return new RequestStatus { CodeStatus = result, MessageStatus = (result == 1) ? "Exito" : "Error" };
            }
        }


        public RequestStatus ConfirmarFactura(string Fact_Id, string pago, string cambio)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Fact_Id", Fact_Id);
                parameter.Add("Fact_Pago", pago);
                parameter.Add("Fact_Cambio", cambio);
                parameter.Add("Fact_FechaFinalizado", DateTime.Now);
                var result = db.QueryFirst(ScriptsBaseDeDatos.ConfirmarFactura, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }

        public RequestStatus Update(tbFactura item)
        {
            throw new NotImplementedException();
        }
    }
}
