using SistemaEsmeralda.DataAccess.Repository;
using SistemaEsmeralda.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.BusinessLogic.Services
{
   public class GeneralServices
    {
        private readonly DepartamentosRepository _departamentosRepository;
        private readonly MunicipioRepository _municipioRepository;
        private readonly CargosRepository _cargosRepository;
        private readonly CategoriaRepository _categoriaRepository;
        private readonly ImpuestoRepository _impuestoRepository;
        private readonly MarcaRepository  _marcaRepository;
        private readonly MateriaRepositorycs _materiaRepositorycs;
        private readonly MetodoPagoRepository _metodoPagoRepository;
        private readonly SucursalRepository _sucursalRepository;
        private readonly ClienteRepository _clienteRepository;
        private readonly EmpleadoRepository _empleadoRepository;
        private readonly ProveedorRepository _proveedorRepository;
        private readonly EstadoCivilRepository _estadoCivilRepository;


        public GeneralServices(DepartamentosRepository departamentosRepository, MunicipioRepository municipioRepository, CargosRepository cargosRepository, CategoriaRepository categoriaRepository, EstadoCivilRepository estadoCivilRepository, ImpuestoRepository impuestoRepository, MarcaRepository marcaRepository, MateriaRepositorycs materiaRepositorycs, MetodoPagoRepository metodoPagoRepository, ClienteRepository clienteRepository, EmpleadoRepository empleadoRepository, ProveedorRepository proveedorRepository, SucursalRepository sucursalRepository)
        {
            _departamentosRepository = departamentosRepository;
            _municipioRepository = municipioRepository;
            _cargosRepository = cargosRepository;
            _categoriaRepository = categoriaRepository;
            _impuestoRepository = impuestoRepository;
             _estadoCivilRepository = estadoCivilRepository;
            _marcaRepository = marcaRepository;
            _materiaRepositorycs = materiaRepositorycs;
            _metodoPagoRepository = metodoPagoRepository;
            _clienteRepository = clienteRepository;
            _empleadoRepository = empleadoRepository;
            _proveedorRepository = proveedorRepository;
            _sucursalRepository = sucursalRepository;


        }



        #region Departamento
        public ServiceResult ListadoDepartamentos()
        {
            var result = new ServiceResult();
            try
            {
                var list = _departamentosRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarDepto(tbDepartamentos item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _departamentosRepository.Update(item);
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
        public ServiceResult EliminarDepto(string Depa_Codigo)
        {
            var result = new ServiceResult();
            try
            {
                var list = _departamentosRepository.Delete(Depa_Codigo);
                if (list.CodeStatus > 0)
                {
                    return result.Ok($"Exitos chiquit@", list);
                }
                else
                {
                    return result.Error("Hijole ahi si te quedo mal tito");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }








        public ServiceResult InsertarDepto(tbDepartamentos item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _departamentosRepository.Insert(item);
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



        public ServiceResult obterDepto(string id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _departamentosRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion

        #region Municipio
        public ServiceResult ListadoMunicipio()
        {
            var result = new ServiceResult();
            try
            {
                var list = _municipioRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult ListadoMunicipioDepartamento(string id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _municipioRepository.Lista(id);
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarMunicipio(tbMunicipios item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _municipioRepository.Update(item);
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
        public ServiceResult EliminarMunicipio(string Muni_Codigo)
        {
            var result = new ServiceResult();
            try
            {
                var list = _municipioRepository.Delete(Muni_Codigo);
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








        public ServiceResult InsertarMunicipio(tbMunicipios item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _municipioRepository.Insert(item);
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



        public ServiceResult obterMunicipio(string id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _municipioRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion

        #region Cargos
        public ServiceResult ListadoCargos()
        {
            var result = new ServiceResult();
            try
            {
                var list = _cargosRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarCargo(tbCargos item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _cargosRepository.Update(item);
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
        public ServiceResult EliminarCargo(string Carg_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _cargosRepository.Delete(Carg_Id);
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








        public ServiceResult InsertarCargos(tbCargos item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _cargosRepository.Insert(item);
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



        public ServiceResult obterCargos(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _cargosRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion



        #region Categorias
        public ServiceResult ListadoCateoria()
        {
            var result = new ServiceResult();
            try
            {
                var list = _categoriaRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarCategoria(tbCategorias item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _categoriaRepository.Update(item);
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

        public ServiceResult EliminarCategorias(string Cate_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _categoriaRepository.Delete(Cate_Id);
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



        public ServiceResult InsertarCategorias(tbCategorias item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _categoriaRepository.Insert(item);
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



        public ServiceResult obterCategorias(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _categoriaRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion









        #region EstadosCiviles
        public ServiceResult ListadoEstadosCiviles()
        {
            var result = new ServiceResult();
            try
            {
                var list = _estadoCivilRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarEstadosCiviles(tbEstadosCiviles item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _estadoCivilRepository.Update(item);
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

        public ServiceResult EliminarEstadosCiviles(string Esta_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _estadoCivilRepository.Delete(Esta_Id);
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



        public ServiceResult InsertarEstadoCiviles(tbEstadosCiviles item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _estadoCivilRepository.Insert(item);
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



        public ServiceResult obterEstadosCiviles(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _estadoCivilRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion








        #region Impuesto
        public ServiceResult ListadoImpuesto()
        {
            var result = new ServiceResult();
            try
            {
                var list = _impuestoRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarImpuestos(tbImpuestos item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _impuestoRepository.Update(item);
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

        public ServiceResult EliminarImpuestos(string Impu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _impuestoRepository.Delete(Impu_Id);
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



        public ServiceResult InsertarImpuestos(tbImpuestos item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _impuestoRepository.Insert(item);
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



        public ServiceResult obterImpuestos(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _impuestoRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion






        #region Marca
        public ServiceResult ListadoMarca()
        {
            var result = new ServiceResult();
            try
            {
                var list = _marcaRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarMarca(tbMarcas item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _marcaRepository.Update(item);
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

        public ServiceResult EliminarMarcas(string Marc_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _marcaRepository.Delete(Marc_Id);
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



        public ServiceResult InsertarMarcas(tbMarcas item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _marcaRepository.Insert(item);
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



        public ServiceResult obterMarcas(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _marcaRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion







        #region Materiales
        public ServiceResult ListadoMateriales()
        {
            var result = new ServiceResult();
            try
            {
                var list = _materiaRepositorycs.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarMaterial(tbMateriales item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _materiaRepositorycs.Update(item);
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

        public ServiceResult EliminarMateriales(string Mate_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _materiaRepositorycs.Delete(Mate_Id);
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



        public ServiceResult InsertarMateriales(tbMateriales item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _materiaRepositorycs.Insert(item);
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



        public ServiceResult obterMateriales(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _materiaRepositorycs.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion






        #region MetodoPago
        public ServiceResult ListadoMetodoPago()
        {
            var result = new ServiceResult();
            try
            {
                var list = _metodoPagoRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarMetodoPago(tbMetodosPago item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _metodoPagoRepository.Update(item);
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

        public ServiceResult EliminarMetodoPago(string Mepa_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _metodoPagoRepository.Delete(Mepa_Id);
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



        public ServiceResult InsertarMetodoPago(tbMetodosPago item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _metodoPagoRepository.Insert(item);
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



        public ServiceResult obterMetodoPago(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _metodoPagoRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion





        #region Clientes
        public ServiceResult ListadoClientes()
        {
            var result = new ServiceResult();
            try
            {
                var list = _clienteRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarCliente(tbClientes item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _clienteRepository.Update(item);
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

        public ServiceResult EliminarClientes(string Clie_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _clienteRepository.Delete(Clie_Id);
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



        public ServiceResult InsertarCliente(tbClientes item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _clienteRepository.Insert(item);
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



        public ServiceResult obterCliente(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _clienteRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion






        #region Empleado
        public ServiceResult ListadoEmpleado()
        {
            var result = new ServiceResult();
            try
            {
                var list = _empleadoRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarEmpleado(tbEmpleados item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _empleadoRepository.Update(item);
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

        public ServiceResult EliminarEmpleado(string Empl_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _empleadoRepository.Delete(Empl_Id);
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



        public ServiceResult InsertarEmpleado(tbEmpleados item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _empleadoRepository.Insert(item);
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



        public ServiceResult obterEmpleado(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _empleadoRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion

        





        #region Proveedor
        public ServiceResult ListadoProveedor()
        {
            var result = new ServiceResult();
            try
            {
                var list = _proveedorRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarProveedor(tbProveedores item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _proveedorRepository.Update(item);
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

        public ServiceResult EliminarProveedor(int Prov_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _proveedorRepository.Delete(Prov_Id);
                if (list.CodeStatus > 0)
                {
                    return result.Ok($"La accion ha sido existosa", list);
                }
                else
                {
                    return result.Error("Hijole ahi si te quedo mal tito");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }



        public ServiceResult InsertarProveedor(tbProveedores item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _proveedorRepository.Insert(item);
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



        public ServiceResult obterProveedor(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _proveedorRepository.Fill(id);

                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }






        #endregion




        #region Sucursal
        public ServiceResult ListadoSucursal()
        {
            var result = new ServiceResult();
            try
            {
                var list = _sucursalRepository.List();
                return result.Ok(list);
            }

            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }






        public ServiceResult EditarSucursal(tbSucursales item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _sucursalRepository.Update(item);
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

        public ServiceResult EliminarSucursal(string Sucu_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _sucursalRepository.Delete(Sucu_Id);
                if (list.CodeStatus > 0)
                {
                    return result.Ok($"Exelente chiquit@", list);
                }
                else
                {
                    return result.Error("Hijole ahi si te quedo mal tito");
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex);
            }
        }



        public ServiceResult InsertarSucursal(tbSucursales item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _sucursalRepository.Insert(item);
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



        public ServiceResult obterSucursal(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _sucursalRepository.Fill(id);

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
