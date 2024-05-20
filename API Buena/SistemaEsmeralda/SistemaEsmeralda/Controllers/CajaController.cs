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
    public class CajaController : Controller
    {
        private readonly VentasServices _ventasServices;

        private readonly IMapper _mapper;

        public CajaController(VentasServices ventasServices, IMapper mapper)
        {
            _ventasServices = ventasServices;
            _mapper = mapper;
        }
        [HttpGet("Validacion/{date},{sucu}")]
        public IActionResult LLenar(string date, string sucu)
        {
            var list = _ventasServices.ValidacionCaja(date,sucu);
            return Ok(list.Data);
        }

        [HttpGet("ReporteCaja/{date},{sucu}")]
        public IActionResult ReporteCaja(string date, string sucu)
        {
            var list = _ventasServices.ReporteCaja(date, sucu);
            return Ok(list.Data);
        }
        [HttpPost("AbrirCaja")]
        public IActionResult AbrirCaja(CajaViewModel item)
        {
            _mapper.Map<tbCajas>(item);
            var modelo = new tbCajas()
            {
                caja_UsuarioApertura = item.caja_UsuarioApertura,
                caja_MontoInicial = item.caja_MontoInicial,
                Sucu_Id = item.Sucu_Id
            };
            var list = _ventasServices.AbrirCaja(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpPost("CerrarCaja")]
        public IActionResult Update(CajaViewModel item)
        {
            _mapper.Map<tbCajas>(item);
            var modelo = new tbCajas()
            {
                caja_UsuarioCierre = item.caja_UsuarioCierre,
                caja_MontoSistema = item.caja_MontoSistema,
                caja_MontoFinal = item.caja_MontoFinal,
                caja_MontoInicial = item.caja_MontoInicial,
                caja_Observacion = item.caja_Observacion,
                caja_Id = item.caja_Id
            };
            var list = _ventasServices.CerrarCaja(modelo);
            return Ok(new { success = true, message = list.Message });
        }
    }
}
