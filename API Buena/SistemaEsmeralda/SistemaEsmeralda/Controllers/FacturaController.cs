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
    public class FacturaController : Controller
    {
        private readonly VentasServices _ventasServices;

        private readonly IMapper _mapper;
        public FacturaController(VentasServices ventasServices, IMapper mapper)
        {
            _ventasServices = ventasServices;
            _mapper = mapper;
        }
        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _ventasServices.ListadoFactura();
            return Ok(list.Data);
        }


        [HttpPost("Create")]

        public IActionResult Insert(FacturaViewModel item)
        {


            var model = _mapper.Map<tbFactura>(item);
            var modelo = new tbFactura()
            {
                Empl_Id = item.Empl_Id,
                Clie_Id = item.Clie_Id,
                Mepa_Id = item.Mepa_Id,
                Fact_UsuarioCreacion = item.Fact_UsuarioCreacion
                
            };
            var list = _ventasServices.CrearFactura(modelo, out int id);
            if (list.Success)
            {
                list.Message = id.ToString();
                return Ok(list.Message);
            }
            else
            {
                list.Message = "0";
                return Ok(list.Message);
            }
        }


        [HttpPost("CreateDetalle")]
        public IActionResult InsertDetalle(FacturaDetalleViewModel item)
        {
            var model = _mapper.Map<tbFacturaDetalles>(item);
            var modelo = new tbFacturaDetalles()
            {
                FaxD_Dif = item.FaxD_Dif,
                Prod_Id = item.Prod_Id,
                FaxD_Cantidad = item.FaxD_Cantidad,
                Fact_Id = item.Fact_Id,
            };
            var list = _ventasServices.InsertarDetalle(modelo);
            return Ok(new { success = true, message = list.Message });
        }
    }
}
