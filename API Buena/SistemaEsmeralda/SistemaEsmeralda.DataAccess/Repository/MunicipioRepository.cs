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
  public    class MunicipioRepository : IRepository<tbMunicipios>
    {


        public RequestStatus Insert(tbMunicipios item)
        {
            const string sql = "Gral.sp_Municipios_insertar";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Muni_Codigo", item.Muni_Codigo);
                parametro.Add("@Muni_Municipio", item.Muni_Municipio);

                parametro.Add("@Depa_Codigo", item.Depa_Codigo);
                parametro.Add("@Muni_UsuarioCreacion", item.Muni_UsuarioCreacion);
                parametro.Add("@Muni_FechaCreacion", item.Muni_FechaCreacion);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbMunicipios> List()
        {
            const string sql = "Gral.sp_Municipios_listar";

            List<tbMunicipios> result = new List<tbMunicipios>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbMunicipios>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public IEnumerable<tbMunicipios> Lista(string id)
        {
            const string sql = "[Gral].[sp_Municipios_MostrarPorDepartamento]";

            List<tbMunicipios> result = new List<tbMunicipios>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Depa_Codigo", id);
                result = db.Query<tbMunicipios>(sql,parameter, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }


        public tbMunicipios Fill(string id)
        {

            tbMunicipios result = new tbMunicipios();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Muni_Codigo", id);
                result = db.QueryFirst<tbMunicipios>(ScriptsBaseDeDatos.Municipiollenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbMunicipios item)
        {
            string sql = ScriptsBaseDeDatos.MunicipioActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Muni_Codigo", item.Muni_Codigo);

                parameter.Add("@Muni_Municipio", item.Muni_Municipio);
                parameter.Add("@Depa_Codigo", item.Depa_Codigo);
                parameter.Add("@Muni_UsuarioModificacion", item.Muni_UsuarioModificacion);
                parameter.Add("@Muni_FechaModificacion", item.Muni_FechaModificacion);

                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Muni_Codigo)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Muni_Codigo", Muni_Codigo);

                var result = db.QueryFirst(ScriptsBaseDeDatos.MunicipioEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbMunicipios Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbMunicipios find(int? id)
        {
            throw new NotImplementedException();
        }
    }
    

    
}
