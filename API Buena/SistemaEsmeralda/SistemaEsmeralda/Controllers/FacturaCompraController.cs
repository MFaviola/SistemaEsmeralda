using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SistemaEsmeralda.BusinessLogic.Services;
using SistemaEsmeralda.Common.Models;
using SistemaEsmeralda.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaEsmeralda.API.Controllers
{
    [ApiController]
    [Route("API/[controller]")]
    public class FacturaCompraController : Controller
    {
        private readonly IMapper _mapper;
        private readonly VentasServices _ventasServices;
        public FacturaCompraController(IMapper mapper, VentasServices ventasServices)
        {
            _ventasServices = ventasServices;
            _mapper = mapper;
        }
        #region Encabezado
            [HttpGet("Listado")]
            public IActionResult Index()
            {
                var list = _ventasServices.ListadoFacturaCompra();
                if (list.Success == true)
                {
                    return Ok(list.Data);
                }
                else
                {
                    return Problem();
                }
            }

            [HttpPost("Crear")]
            public IActionResult Insert(FacturaCompraViewModel item)
            {
                if (item.faCE_Id == 0)
                {

                    var model = _mapper.Map<tbFacturaCompraEncabezado>(item);
                    var list = _ventasServices.InsertarFacturaCompra(model, out int fac);
                    if (list.Success == true)
                    {
                        list.Message = fac.ToString();

                        //var modelo = _mapper.Map<tbFacturaCompraEncabezado>(item);
                        var modelo = new tbFacturaCompraEncabezado()
                        {
                            faCE_Id = Convert.ToInt32(list.Message),
                            faCD_Dif = item.faCD_Dif,
                            nombreProducto = item.nombreProducto,
                            faCD_Cantidad = item.faCD_Cantidad,
                            precioCompra = item.precioCompra,
                            precioVenta = item.precioVenta,
                            precioMayorista = item.precioMayor
                        };
                        var lista = _ventasServices.InsertarFacturaCompraDetalle(modelo);
                        if (lista.Success == true)
                        {
                            return Ok(new { success = true, message = lista.Message });
                        }
                        else
                        {
                            return Problem();
                        }
                    }
                    else
                    {
                        return Problem();
                    }
                }
                else
                {
                    var modelo = _mapper.Map<tbFacturaCompraEncabezado>(item);
                    var lista = _ventasServices.InsertarFacturaCompraDetalle(modelo);
                    if (lista.Success == true)
                    {
                        return Ok(new { success = true, message = lista.Message });
                    }
                    else
                    {
                        return Problem();
                    }
                }
            }

            [HttpPut("Editar")]
            public IActionResult Update(FacturaCompraViewModel item)
            {
                var model = _mapper.Map<tbFacturaCompraEncabezado>(item);
                var list = _ventasServices.ActualizarFacturaCompra(model, out int provee);
                if(list.Success == true)
                {
                    return Ok(new { success = true, message = list.Message, prov = provee.ToString() });
                }
                else
                {
                    return Problem();
                }
            }

            [HttpDelete("Eliminar/{id}")]
            public IActionResult Delete(int id)
            {
                var list = _ventasServices.EliminarFacturaCompra(id);
                if (list.Success == true)
                {
                    return Ok(new { success = true, message = list.Message });
                }
                else
                {
                    return Problem();
                }
            }

            [HttpGet("Buscar/{id}")]
            public IActionResult Find(int id)
            {
                var list = _ventasServices.BuscarFacturaCompra(id);
                if (list.Success == true)
                {
                    return Ok(list.Data);
                }
                else
                {
                    return Problem();
                }
            }
        #endregion

        #region Detalle
            //[HttpPost("CrearDetalle")]
            //public IActionResult Create(FacturaCompraDetalleViewModel item)
            //{
            //    var model = _mapper.Map<tbFacturaCompraDetalle>(item);

            //    var list = _ventasServices.InsertarFacturaCompraDetalle(model);
            //    if (list.Success == true)
            //    {
            //        return Ok(new { success = true, message = list.Message});
            //    }
            //    else
            //    {
            //        return Problem();
            //    }
            //}

        #endregion
    }
}
