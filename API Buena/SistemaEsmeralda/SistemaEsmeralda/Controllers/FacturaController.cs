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
        public IActionResult Create()
        {
            var list = _ventasServices.ListadoFactura();
            return Ok(list.Data);
        }
    }
}
