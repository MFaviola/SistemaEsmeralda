using SistemaEsmeralda.DataAccess.Repository;
using SistemaEsmeralda.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.BusinessLogic.Services
{
    public class AccesoServices
    {
        private readonly UsuarioRepository _usuarioRepository;
        public readonly RolRepository _rolRepository;
        public readonly PantallaRolesRepository _pantallaRolesRepository;
        public AccesoServices(UsuarioRepository usuarioRepository, RolRepository rolRepository, PantallaRolesRepository pantallaRolesRepository)
        {
            _usuarioRepository = usuarioRepository;
            _rolRepository = rolRepository;
            _pantallaRolesRepository = pantallaRolesRepository;
        }



        #region Roles
        public ServiceResult ListadoRol()
        {
            var result = new ServiceResult();
            try
            {
                var list = _rolRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }




        public ServiceResult EditarRol(tbRoles item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _rolRepository.Update(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok("okis", list);
                }
                else
                {
                    return result.Error("Y existe un registro con ese nombre");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }
        public ServiceResult EliminarRol(string Role_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _rolRepository.Delete(Role_Id);
                if (list.CodeStatus > 0)
                {
                    return result.Ok($"La accion ha sido existosa", list);
                }
                else
                {
                    return result.Error("No se pudo realizar la accion");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }








        public string InsertarRol(tbRoles item)
        {
            string error = "";
            try
            {
                int result = _rolRepository.Insert(item);
                if (result == 0)
                    error = "el codigo no es valido";
                else error = result.ToString();
            }
            catch (Exception ex)
            {
                error = ex.Message;
            }
            return error;
        }



        public ServiceResult obterRol(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _rolRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }







        public ServiceResult ListadoPantallas()
        {
            var result = new ServiceResult();
            try
            {
                var list = _rolRepository.Listpantallas();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }





        #endregion




        #region Usuario
        public ServiceResult ValidarReestablecer(string usuario)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuarioRepository.ValidarReestablecer(usuario);

                return result.Ok(lost);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }









        public ServiceResult ListadoUsuario()
        {
            var result = new ServiceResult();
            try
            {
                var list = _usuarioRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }




        public ServiceResult EditarUsuario(tbUsuarios item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _usuarioRepository.Update(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok( list);
                }
                else
                {
                    return result.Error("Y existe un registro con ese nombre");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }
        public ServiceResult EliminarUsuario(int Usua_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _usuarioRepository.Delete(Usua_Id);
                if (list.CodeStatus > 0)
                {
                    return result.Ok($"La accion ha sido existosa", list);
                }
                else
                {
                    return result.Error("No se pudo realizar la accion");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }








        public ServiceResult InsertarUsuario(tbUsuarios item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _usuarioRepository.Insert(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    return result.Error(list);
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }



        public ServiceResult obterUsuario(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _usuarioRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }







        public ServiceResult ValidarUsuario(string usua, string contra)
        {
            var result = new ServiceResult();
            try
            {
                var list = _usuarioRepository.Validar(usua, contra);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error("Lo siento Tit@ Acceso denegado");
            }
        }











        #endregion








        #region RolesPantalla







        public ServiceResult ListadoPantallaRoles()
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaRolesRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }




        public ServiceResult EditarRolesPantalla(tbPantallasPorRoles item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaRolesRepository.Update(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok("okis", list);
                }
                else
                {
                    return result.Error("Y existe un registro con ese nombre");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }
        public ServiceResult EliminarRolesPantalla(string Role_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaRolesRepository.Delete(Role_Id);
                if (list.CodeStatus > 0)
                {
                    return result.Ok($"La accion ha sido existosa", list);
                }
                else
                {
                    return result.Error("No se pudo realizar la accion");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }








        public ServiceResult InsertarRolesPantalla(tbPantallasPorRoles item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaRolesRepository.Insert(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    return result.Error(list);
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }



        public ServiceResult obterRolesPantalla(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaRolesRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }


        public ServiceResult ObtenerRoles(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaRolesRepository.Fill2(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }











        #endregion
    }
}
