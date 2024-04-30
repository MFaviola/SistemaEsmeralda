﻿using SistemaEsmeralda.DataAccess.Repository;
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




        private readonly EstadoCivilRepository _estadoCivilRepository;


        public GeneralServices(DepartamentosRepository departamentosRepository, MunicipioRepository municipioRepository, CargosRepository cargosRepository, CategoriaRepository categoriaRepository, EstadoCivilRepository estadoCivilRepository, ImpuestoRepository impuestoRepository, MarcaRepository marcaRepository)
        {
            _departamentosRepository = departamentosRepository;
            _municipioRepository = municipioRepository;
            _cargosRepository = cargosRepository;
            _categoriaRepository = categoriaRepository;
            _impuestoRepository = impuestoRepository;
             _estadoCivilRepository = estadoCivilRepository;
            _marcaRepository = marcaRepository;



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






        public ServiceResult EditarMunicipio(tbMunicipios item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _municipioRepository.Update(item);
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
    }
}
