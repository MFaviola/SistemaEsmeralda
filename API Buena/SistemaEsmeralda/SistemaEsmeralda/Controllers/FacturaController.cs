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
            if (list.Success == true)
            {
                return Ok(list.Data);
            }
            else
            {
                return Problem();
            }
        }

        [HttpGet("ListaDetalles/{id}")]
        public IActionResult ListaDetalles(string id)
        {
            var list = _ventasServices.ListadoFacturaDetalles(id);
            return Ok(list.Data);
        }


        [HttpGet("ReportePorMes/{ano},{mes}")]
        public IActionResult ReportePorMes(string año,string mes)
        {
            var list = _ventasServices.ReportePorMes(año,mes);
            return Ok(list.Data);
        }


        [HttpGet("ReportePorStock/{valor}")]
        public IActionResult ReportePorStock(int valor)
        {
            var list = _ventasServices.ReportePorStock(valor);
            return Ok(list.Data);
        }


        [HttpGet("ReportePorEmpleado/{empleado}")]
        public IActionResult ReportePorEmpleado(int empleado)
        {
            var list = _ventasServices.ReportePorEmpleado(empleado);
            return Ok(list.Data);
        }

        [HttpGet("ReporteTop10/{FechaInicio},{FechaFinal}")]
        public IActionResult ReporteTop10(string FechaInicio, string FechaFinal)
        {
            var list = _ventasServices.ReporteTop10(FechaInicio, FechaFinal);
            return Ok(list.Data);
        }

        [HttpGet("ReporteVentasAnual/{año}")]
        public IActionResult ReporteVentasAnual(int año)
        {
            var list = _ventasServices.ReporteVentasAnual(año);
            return Ok(list.Data);
        }

        [HttpGet("ReporteVentasMayoristas/{año},{mes}")]
        public IActionResult ReporteVentasMayoristas(int año,int mes)
        {
            var list = _ventasServices.ReporteVentasMayoristas(año,mes);
            return Ok(list.Data);
        }
        [HttpGet("Fill/{id}")]
        public IActionResult LLenar(string id)
        {
            var list = _ventasServices.BuscarFactura(id);
            return Ok(list.Data);
        }


        [HttpPost("Create")]

        public IActionResult Insert(FacturaViewModel item)
        {
            var modele = _mapper.Map<tbFactura>(item);
            var modeloFactura = new tbFactura()
            {
                Empl_Id = item.Empl_Id,
                Clie_Id = item.Clie_Id,
                Mepa_Id = item.Mepa_Id,
                Fact_UsuarioCreacion = item.Fact_UsuarioCreacion,
                Fact_Id = item.Fact_Id
               

            };
            if (item.Fact_Id == 0 )
            {
               
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
                var list = _ventasServices.InsertarDetalle(modelo, out int stock);
                return Ok(new { success = true, message = list.Message, id = IdFactura.Message, stock = stock });
            }
            else
            {
                var IdFactura = _ventasServices.CrearFactura(modeloFactura, out int id);
                IdFactura.Message = id.ToString();
                var model = _mapper.Map<tbFacturaDetalles>(item);
                var modelo = new tbFacturaDetalles()
                {
                    FaxD_Dif =item.Faxd_Dif,
                 Prod_Nombre = item.Prod_Nombre,
                    FaxD_Cantidad = item.Faxd_Cantidad,
                    Fact_Id = item.Fact_Id,
                };
                var list = _ventasServices.InsertarDetalle(modelo, out int stock);
                return Ok(new { success = true, message = list.Message, id = item.Fact_Id, stock = stock });
            }
        


    }

        [HttpPut("DeleteFactura/{id},{nombre},{dif}")]
        public IActionResult DeleteFactura(string id,string nombre, string dif)
        {
            int difEnd = 0;
            if (dif == "Maquillajes")
            {
               difEnd = 1;
            }
            else
            {
                difEnd = 0;
            }
            var list = _ventasServices.ElimnarFacturaDetalle(id, nombre, difEnd);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpPut("ConfirmarFactura/{id}")]
        public IActionResult ConfirmarFactura(int id)
        {

            var list = _ventasServices.ConfirmarFactura(id.ToString());
            return Ok(new { success = true, message = list.Message });
        }


    }
}
