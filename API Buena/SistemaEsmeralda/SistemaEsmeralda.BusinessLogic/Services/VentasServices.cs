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
        private readonly FacturaCompraRepository _facturaCompraRepository;
        public VentasServices(JoyaRepository joyaRepository, MaquillajeRepository maquillajeRepository, FacturaRepository facturaRepository, FacturaCompraRepository facturaCompraRepository)
        {
            _joyaRepository = joyaRepository;
            _maquillajeRepository = maquillajeRepository;
            _facturaRepository = facturaRepository;
            _facturaCompraRepository = facturaCompraRepository;
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


        public ServiceResult ListadoJoyaPorCodigo()
        {
            var result = new ServiceResult();
            try
            {
                var list = _joyaRepository.ListaPorCodigo();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ListadoAutoCompletado()
        {
            var result = new ServiceResult();
            try
            {
                var list = _joyaRepository.ListaAutoCompletado();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ListadoAutoCompletado1()
        {
            var result = new ServiceResult();
            try
            {
                var list = _joyaRepository.ListaAutoCompletado1();
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

        public ServiceResult ElimnarFacturaDetalle(string Fact_Id,string prod_nombre,int dif)
        {
            var result = new ServiceResult();
            try
            {
                var list = _facturaRepository.Delete(Fact_Id,prod_nombre,dif);
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

        public ServiceResult ConfirmarFactura(string Fact_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _facturaRepository.ConfirmarFactura(Fact_Id);
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
        public ServiceResult ListaPorCodigoMaqui()
        {
            var result = new ServiceResult();
            try
            {
                var list = _maquillajeRepository.ListaPorCodigo();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult ListaAutoCompletadoMaqui()
        {
            var result = new ServiceResult();
            try
            {
                var list = _maquillajeRepository.ListaAutocompletado();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ListaAutoCompletadoMaqui1()
        {
            var result = new ServiceResult();
            try
            {
                var list = _maquillajeRepository.ListaAutocompletado1();
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


        public ServiceResult ListadoFacturaDetalles(string id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _facturaRepository.ListaDetalles(id);
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }



        public ServiceResult BuscarFactura(string id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _facturaRepository.Buscar(id);
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }



        #endregion
        #region Factura


        public ServiceResult CrearFactura(tbFactura item, out int id)
        {
            var result = new ServiceResult();
            try
            {
                var (lost, scope) = _facturaRepository.Insertar(item);
                id = scope;
                if (lost.CodeStatus > 0)
                {
                    return result.Ok(lost);
                }
                else
                {
                    lost.MessageStatus = (lost.CodeStatus != 1) ? "401 Error de consulta" : lost.MessageStatus;
                    return result.Error(lost);
                }
            }
            catch (Exception ex)
            {
                id = 0;
                return result.Error(ex.Message);
            }
        }

        public ServiceResult InsertarDetalle(tbFacturaDetalles item, out int stock)
        {
            var result = new ServiceResult();
            try
            {
                var (list, scope) = _facturaRepository.InsertarDetalle(item);
                stock = scope;
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
                stock = 0;
                return result.Error(ex.Message);
            }
        }


        #endregion


        #region FacturaCompra
        public ServiceResult ListadoFacturaCompra()
        {
            var result = new ServiceResult();
            try
            {
                var list = _facturaCompraRepository.List();
                if (list.Count() > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    return result.Error();
                }
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult InsertarFacturaCompra(tbFacturaCompraEncabezado item, out int fac)
        {
            var result = new ServiceResult();
            try
            {
                var (list, scope1) = _facturaCompraRepository.Insert1(item);
                fac = scope1;
                if (list.CodeStatus >0 )
                {
                    return result.Ok(list);
                }
                else
                {
                    return result.Error();
                }
            }

            catch (Exception ex)
            {
                fac = 0;
                return result.Error(ex.Message);
            }
        }

        public ServiceResult ActualizarFacturaCompra(tbFacturaCompraEncabezado item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _facturaCompraRepository.Update1(item);
                if (list.CodeStatus > 0 )
                {
                    return result.Ok(list);
                }
                else
                {
                    return result.Error();
                }
            }

            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }

        public ServiceResult EliminarFacturaCompra(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _facturaCompraRepository.Delete(id);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    return result.Error();
                }
            }

            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }

        public ServiceResult BuscarFacturaCompra(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _facturaCompraRepository.find1(id);
                if (list.Count() > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    return result.Error();
                }
            }

            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }
        #endregion

        #region Factura compra detalle
        public ServiceResult ListadoFacturaCompraDetalle(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _facturaCompraRepository.Listao(id);
                if (list.Count() > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    return result.Error();
                }
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult InsertarFacturaCompraDetalle(tbFacturaCompraEncabezado item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _facturaCompraRepository.Insert(item);
              
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    return result.Error();
                }
            }

            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }
        #endregion
    }
}
