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
   public class CategoriaRepository : IRepository<tbCategorias>
    {


        public RequestStatus Insert(tbCategorias item)
        {
            const string sql = "[Gral].[sp_Categorias_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Cate_Categoria", item.Cate_Categoria);
                parametro.Add("@Cate_UsuarioCreacion", item.Cate_UsuarioCreacion);
                parametro.Add("@Cate_FechaCreacion", item.Cate_FechaCreacion);


                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbCategorias> List()
        {
            const string sql = "Gral.sp_Categorias_listar";

            List<tbCategorias> result = new List<tbCategorias>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbCategorias>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbCategorias Fill(int id)
        {

            tbCategorias result = new tbCategorias();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Cate_Id", id);
                result = db.QueryFirst<tbCategorias>(ScriptsBaseDeDatos.Categoriasllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbCategorias item)
        {
            string sql = ScriptsBaseDeDatos.CategoriasActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Cate_Id", item.Cate_Id);
                parameter.Add("@Cate_Categoria", item.Cate_Categoria);
                parameter.Add("@Cate_UsuarioModificacion", item.Cate_UsuarioModificacion);
                parameter.Add("@Cate_FechaModificacion", item.Cate_FechaModificacion);

                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Cate_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Cate_Id", Cate_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.CategoriasEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbCategorias Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbCategorias find(int? id)
        {
            throw new NotImplementedException();
        }



    }
}
