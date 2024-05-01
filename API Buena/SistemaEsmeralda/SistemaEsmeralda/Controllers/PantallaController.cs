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
    public class PantallaController : Controller
    {
         private readonly AccesoServices _accesoServices;

        private readonly IMapper _mapper;
        public PantallaController(AccesoServices accesoServices, IMapper mapper)
        {
            _accesoServices = accesoServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _accesoServices.ListadoPantallas();
            return Ok(list.Data);
        }

    }
}
