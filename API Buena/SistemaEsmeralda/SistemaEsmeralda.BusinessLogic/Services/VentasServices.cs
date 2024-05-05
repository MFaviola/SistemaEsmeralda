using SistemaEsmeralda.DataAccess.Repository;
using SistemaEsmeralda.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.BusinessLogic.Services
{
    public class VentasServices
    {

        private readonly JoyaRepository _joyaRepository;
        private readonly MaquillajeRepository _maquillajeRepository;
        private readonly FacturaRepository _facturaRepository;
        public VentasServices(JoyaRepository joyaRepository, MaquillajeRepository maquillajeRepository, FacturaRepository facturaRepository)
        {
            _joyaRepository = joyaRepository;
            _maquillajeRepository = maquillajeRepository;
            _facturaRepository = facturaRepository;
        }



        #region Joyas
        public ServiceResult ListadoJoyas()
        {
            var result = new ServiceResult();
            try
            {
                var list = _joyaRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }


        public ServiceResult EditarJoyas(tbJoyas item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _joyaRepository.Update(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
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
        public ServiceResult EliminarJoya(string Joya_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _joyaRepository.Delete(Joya_Id);
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








        public ServiceResult InsertarJoya(tbJoyas item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _joyaRepository.Insert(item);
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



        public ServiceResult obterJoya(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _joyaRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion




        #region Maquillaje
        public ServiceResult ListadoMaquillaje()
        {
            var result = new ServiceResult();
            try
            {
                var list = _maquillajeRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }


        public ServiceResult EditarMaquillaje(tbMaquillajes item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _maquillajeRepository.Update(item);
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
        public ServiceResult EliminarMaquillaje(string Maqu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _maquillajeRepository.Delete(Maqu_Id);
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








        public ServiceResult InsertarMaquillaje(tbMaquillajes item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _maquillajeRepository.Insert(item);
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



        public ServiceResult obterMaquillaje(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _maquillajeRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion


        #region Joyas
        public ServiceResult ListadoFactura()
        {
            var result = new ServiceResult();
            try
            {
                var list = _facturaRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }


       




        #endregion

    }
}
