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


        public RequestStatus InsertarDetalle(tbFacturaDetalles item)
        {
            const string sql = "[Vent].[sp_FacturaDetalles_Insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Faxd_Dif", item.FaxD_Dif);
                parametro.Add("@Prod_Id", item.Prod_Id);
                parametro.Add("@Faxd_Cantidad", item.FaxD_Cantidad);
                parametro.Add("@Fact_Id", item.Fact_Id);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }
        public (RequestStatus, int) Insertar(tbFactura item)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Clie_Id", item.Clie_Id);
                parametro.Add("@Empl_Id", item.Empl_Id);
                parametro.Add("Fact_UsuarioCreacion", item.Fact_UsuarioCreacion);
                parametro.Add("Fact_FechaCreacion", DateTime.Now);
                parametro.Add("Fact_Id", dbType: DbType.Int32, direction: ParameterDirection.Output);

                var result = db.Execute(ScriptsBaseDeDatos.CrearFactura,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );
                int Fact_Id = parametro.Get<int>("Fact_Id");
                string mensaje = (result == 1) ? "Exito" : "Error";

                return (new RequestStatus { CodeStatus = result, MessageStatus = mensaje }, Fact_Id);
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

        public RequestStatus Update(tbFactura item)
        {
            throw new NotImplementedException();
        }
    }
}
