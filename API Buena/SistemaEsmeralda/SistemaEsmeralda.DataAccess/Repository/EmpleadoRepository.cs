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
   public class EmpleadoRepository : IRepository<tbEmpleados>
    {


        public RequestStatus Insert(tbEmpleados item)
        {
            const string sql = "[Gral].[sp_Empleados_insertar]";



            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parametro = new DynamicParameters();

                parametro.Add("@Empl_Nombre", item.Empl_Nombre);
                parametro.Add("@Empl_Apellido", item.Empl_Apellido);
                parametro.Add("@Empl_FechaNac", item.Empl_FechaNac);
                parametro.Add("@Empl_DNI", item.Empl_DNI);
                parametro.Add("@Empl_Sexo", item.Empl_Sexo);
                parametro.Add("@Sucu_Id", item.Sucu_Id);
                parametro.Add("@Muni_Codigo", item.Muni_Codigo);
                parametro.Add("@Esta_Id", item.Esta_Id);
                parametro.Add("@Carg_Id", item.Carg_Id);
                parametro.Add("@Empl_Correo", item.Empl_Correo);

                parametro.Add("@Empl_UsuarioCreacion", item.Empl_UsuarioCreacion);
                parametro.Add("@Empl_FechaCreacion", item.Empl_FechaCreacion);

                var result = db.Execute(sql, parametro, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbEmpleados> List()
        {
            const string sql = "Gral.sp_Empleados_listar";

            List<tbEmpleados> result = new List<tbEmpleados>();

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                result = db.Query<tbEmpleados>(sql, commandType: CommandType.Text).ToList();

                return result;
            }
        }

        public tbEmpleados Fill(int id)
        {

            tbEmpleados result = new tbEmpleados();
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Empl_Id", id);
                result = db.QueryFirst<tbEmpleados>(ScriptsBaseDeDatos.Empleadosllenar, parameter, commandType: CommandType.StoredProcedure);
                return result;
            }

        }

        public RequestStatus Update(tbEmpleados item)
        {
            string sql = ScriptsBaseDeDatos.EmpleadosActualizar;

            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Empl_Id", item.Empl_Id);
                parameter.Add("@Empl_Nombre", item.Empl_Nombre);
                parameter.Add("@Empl_Apellido", item.Empl_Apellido);
                parameter.Add("@Empl_Sexo", item.Empl_Sexo);
                parameter.Add("@Sucu_Id", item.Sucu_Id);
                parameter.Add("@Empl_FechaNac", item.Empl_FechaNac);
                parameter.Add("@Empl_DNI", item.Empl_DNI);
                parameter.Add("@Muni_Codigo", item.Muni_Codigo);
                parameter.Add("@Esta_Id", item.Esta_Id);
                parameter.Add("@Carg_Id", item.Carg_Id);

                parameter.Add("@Empl_Correo", item.Empl_Correo);

                
                parameter.Add("@Empl_UsuarioModificacion", item.Empl_UsuarioCreacion);
                parameter.Add("@Empl_FechaModificacion", DateTime.Now);
                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                string mensaje = (result == 1) ? "exito" : "error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };

            }
        }



        public RequestStatus Delete(string Empl_Id)
        {
            using (var db = new SqlConnection(SistemaEsmeraldaContex.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("Empl_Id", Empl_Id);

                var result = db.QueryFirst(ScriptsBaseDeDatos.EmpleadosEliminar, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result.Resultado, MessageStatus = (result.Resultado == 1) ? "Exito" : "Error" };
            }
        }








        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbEmpleados Details(int? id)
        {
            throw new NotImplementedException();
        }

        public tbEmpleados find(int? id)
        {
            throw new NotImplementedException();
        }

    }
}
