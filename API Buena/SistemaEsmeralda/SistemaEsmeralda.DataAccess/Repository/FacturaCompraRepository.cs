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

        public tbFacturaCompraEncabezado Details(int? id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbFacturaCompraEncabezado> find1(int? id)
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraBuscar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@id", id);
                var result = db.Query<tbFacturaCompraEncabezado>(sql, parametro, commandType: CommandType.StoredProcedure).ToList();

                return result;

            }
        }

        public (RequestStatus, int, int) Insert1(tbFacturaCompraEncabezado item)
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraInsertar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Prov_Id", item.Prov_Id);
                parametro.Add("@Mepa_Id", item.Mepa_Id);
                parametro.Add("@FaCE_fechafinalizacion", item.FaCE_fechafinalizacion);
                parametro.Add("@FeCE_UsuarioCreacion", item.FeCE_UsuarioCreacion);
                parametro.Add("@ID", dbType: DbType.Int32, direction: ParameterDirection.Output);
                parametro.Add("@proveedor", dbType: DbType.Int32, direction: ParameterDirection.Output);
                var result = db.Execute(sql, parametro, commandType: System.Data.CommandType.StoredProcedure);

                int FaCE_Id = parametro.Get<int>("@ID");
                int Prov_Id = parametro.Get<int>("@proveedor");
                string mensaje = (result == 1) ? "Exito" : "Error";

                return (new RequestStatus { CodeStatus = result, MessageStatus = mensaje },FaCE_Id, Prov_Id);
            }
        }

        public IEnumerable<tbFacturaCompraEncabezado> List()
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraListado;

            List<tbFacturaCompraEncabezado> result = new List<tbFacturaCompraEncabezado>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbFacturaCompraEncabezado>(sql, commandType: System.Data.CommandType.Text).ToList();
                return result;
            }

        }

        public (RequestStatus, int) Update1(tbFacturaCompraEncabezado item)
        {
            string sql = ScriptsBaseDeDatos.FacturaCompraActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@FaCE_Id", item.FaCE_Id);
                parametro.Add("@Prov_Id", item.Prov_Id);
                parametro.Add("@Mepa_Id", item.Mepa_Id);
                parametro.Add("@FaCE_fechafinalizacion", item.FaCE_fechafinalizacion);
                parametro.Add("@FeCE_UsuarioModificacion", item.FaCE_UsuarioModificacion);
                parametro.Add("@proveedor", dbType: DbType.Int32, direction: ParameterDirection.Output);
                var result = db.Execute(sql, parametro, commandType: System.Data.CommandType.StoredProcedure);

                int Prov_Id = parametro.Get<int>("@proveedor");
                string mensaje = (result == 1) ? "Exito" : "Error";

                return (new RequestStatus { CodeStatus = result, MessageStatus = mensaje }, Prov_Id);
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

        RequestStatus IRepository<tbFacturaCompraEncabezado>.Update(tbFacturaCompraEncabezado item)
        {
            throw new NotImplementedException();
        }
    }
}
