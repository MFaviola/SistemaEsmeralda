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

        [HttpGet("ListaDetalles/{id}")]
        public IActionResult ListaDetalles(string id)
        {
            var list = _ventasServices.ListadoFacturaDetalles(id);
            return Ok(list.Data);
        }


        [HttpGet("LLenar/{id}")]
        public IActionResult LLenar(string id)
        {
            var list = _ventasServices.ListadoFacturaDetalles(id);
            return Ok(list.Data);
        }


        [HttpPost("Create")]

        public IActionResult Insert(FacturaViewModel item)
        {
            if(item.Fact_Id == 0 )
            {
                var modele = _mapper.Map<tbFactura>(item);
                var modeloFactura = new tbFactura()
                {
                    Empl_Id = item.Empl_Id,
                    Clie_Id = item.Clie_Id,
                    Mepa_Id = item.Mepa_Id,
                    Fact_UsuarioCreacion = item.Fact_UsuarioCreacion

                };
                var IdFactura = _ventasServices.CrearFactura(modeloFactura, out int id);
                IdFactura.Message = id.ToString();
                
                var model = _mapper.Map<tbFacturaDetalles>(item);
                var modelo = new tbFacturaDetalles()
                {
                    FaxD_Dif = item.Faxd_Dif,
                    Prod_Nombre = item.Prod_Nombre,
                    FaxD_Cantidad = item.Faxd_Cantidad,
                    Fact_Id =Convert.ToInt32(IdFactura.Message),
                };
                var list = _ventasServices.InsertarDetalle(modelo);
                return Ok(new { success = true, message = list.Message, id = IdFactura.Message });
            }
            else
            {
                var model = _mapper.Map<tbFacturaDetalles>(item);
                var modelo = new tbFacturaDetalles()
                {
                    FaxD_Dif =item.Faxd_Dif,
                 Prod_Nombre = item.Prod_Nombre,
                    FaxD_Cantidad = item.Faxd_Cantidad,
                    Fact_Id = item.Fact_Id,
                };
                var list = _ventasServices.InsertarDetalle(modelo);
                return Ok(new { success = true, message = list.Message, id = item.Fact_Id });
            }
        


    }

        [HttpDelete("DeleteFactura/{id},{nombre}")]
        public IActionResult DeleteFactura(string id,string nombre)
        {
            var list = _ventasServices.ElimnarFacturaDetalle(id, nombre);
            return Ok(new { success = true, message = list.Message });
        }

    }
}
