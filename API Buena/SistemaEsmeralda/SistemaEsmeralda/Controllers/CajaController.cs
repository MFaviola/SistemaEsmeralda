using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SistemaEsmeralda.BusinessLogic.Services;
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
    }
}
