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
    public class ProductosPorSucursalesController : Controller
    {
        private readonly VentasServices _ventasServices;

        private readonly IMapper _mapper;
        public ProductosPorSucursalesController(VentasServices ventasServices, IMapper mapper)
        {
            _ventasServices = ventasServices;
            _mapper = mapper;
        }
        [HttpPost("Create")]

        public IActionResult Insert(ProductoPorSucursalViewModel item)
        {
          

                var model = _mapper.Map<tbProductosPorSucurales>(item);
                var modelo = new tbProductosPorSucurales()
                {
                    Prxs_Dif = item.Prxs_Dif,
                    Prod_Id = item.Prod_Id,
                    Prod_Nombre = item.Prod_Nombre,
                    Prsx_Stock = item.Prsx_Stock,
                    Sucu_Id = item.Sucu_Id,
                    SucuEnviado = item.FacturaEncabezado
                };
                var list = _ventasServices.CrearProductoPorSucursalesDetalle(modelo);
                return Ok(new { success = true, message = list.Message});
        


       


        }

        [HttpGet("ListaDetalles/{id}")]
        public IActionResult ListaDetalles(string id)
        {
            var list = _ventasServices.ListadoFacturaDetalleSucursales(id);
            return Ok(list.Data);
        }
    }
}
