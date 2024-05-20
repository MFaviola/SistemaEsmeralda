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

        [HttpGet("VentasDelDia/{Date}")]
        public IActionResult VentasDelDia(string Date)
        {
            var list = _ventasServices.VentasDelDia(Date);
            return Ok(list.Data);
        }


        [HttpGet("ReportePorMes/{ano},{mes}")]
        public IActionResult ReportePorMes(string ano,string mes)
        {
            var list = _ventasServices.ReportePorMes(ano, mes);
            return Ok(list.Data);
        }


        [HttpGet("ReportePorStock/{valor},{sucursal}")]
        public IActionResult ReportePorStock(int valor, int sucursal)
        {
            var list = _ventasServices.ReportePorStock(valor,sucursal);
            return Ok(list.Data);
        }


        [HttpGet("ReporteTipoPago/{valor}")]
        public IActionResult ReporteTipoPago(int valor)
        {
            var list = _ventasServices.ReportePorTipoPago(valor);
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

        [HttpGet("ReporteVentasMayoristas/{incio},{final}")]
        public IActionResult ReporteVentasMayoristas(string incio, string final)
        {
            var list = _ventasServices.ReporteVentasMayoristas(incio, final);
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
                Sucu_Id = item.Sucu_Id,
                Mepa_Id = item.Mepa_Id,
                Fact_UsuarioCreacion = item.Usua_Id,
                Fact_Id = item.Fact_Id,
                Fact_UsuarioModificacion = item.Usua_Id

               

            };
            if (item.Actualizar == "Actualizar")
            {

                var IdFactura = _ventasServices.CrearFactura(modeloFactura, out int id);
                return Ok(new { success = true, message = IdFactura.Message });
            }
            else if(item.Actualizar == "Confirmar")
            {
                string cambio = item.PagoCambio;
                string pago = item.Pago;

                var IdFactura = _ventasServices.CrearFactura(modeloFactura, out int id);
                var list = _ventasServices.ConfirmarFactura(item.Fact_Id.ToString(), pago, cambio);
                return Ok(new { success = true, message = list.Message });
            }
            if (item.Fact_Id == 0 )
            {
               
                var IdFactura = _ventasServices.CrearFactura(modeloFactura, out int id);
                IdFactura.Message = id.ToString();
                
                var model = _mapper.Map<tbFacturaDetalles>(item);
                var modelo = new tbFacturaDetalles()
                {
                    Sucu_Id = item.Sucu_Id,
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
                    Sucu_Id = item.Sucu_Id,
                    FaxD_Dif =item.Faxd_Dif,
                 Prod_Nombre = item.Prod_Nombre,
                    FaxD_Cantidad = item.Faxd_Cantidad,
                    Fact_Id = item.Fact_Id,
                };
                var list = _ventasServices.InsertarDetalle(modelo, out int stock);
                return Ok(new { success = true, message = list.Message, id = item.Fact_Id, stock = stock });
            }
        


    }

        [HttpPut("DeleteFactura/{id},{nombre},{sucu_iD}")]
        public IActionResult DeleteFactura(string id,string nombre, string sucu_iD)
        {
      
            var list = _ventasServices.ElimnarFacturaDetalle(id, nombre, sucu_iD);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpPut("ConfirmarFactura/{id},{pago},{cambio}")]
        public IActionResult ConfirmarFactura(int id, string pago, string cambio)
        {

            var list = _ventasServices.ConfirmarFactura(id.ToString(),pago,cambio);
            return Ok(new { success = true, message = list.Message });
        }


    }
}
