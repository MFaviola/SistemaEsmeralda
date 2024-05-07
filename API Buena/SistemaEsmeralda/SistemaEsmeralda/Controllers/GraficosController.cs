using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SistemaEsmeralda.BusinessLogic.Services;
using SistemaEsmeralda.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaEsmeralda.API.Controllers
{
    [ApiController]
    [Route("API/[controller]")]
    public class GraficosController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public GraficosController(GeneralServices generalSerices, IMapper mapper)
        {
            _generalServices = generalSerices;
            _mapper = mapper;
        }
        

        [HttpGet("ProductoMes")]
        public IActionResult TotalProductosMes()
        {
            var list = _generalServices.totalProductoMes();

            return Ok(list.Data);
        }


        [HttpGet("MaquillajeMes")]
        public IActionResult TotalMaqillajeMes()
        {
            var list = _generalServices.totalMaquillajeMes();
            return Ok(list.Data);
        }


        [HttpGet("MaquillajetotalMes")]
        public IActionResult TotalinMaqillajeMes()
        {
            var list = _generalServices.totalinMaquillajeMes();
            return Ok(list.Data);
        }




        [HttpGet("JoyaMes")]
        public IActionResult TotalJoyaMes()
        {
            var list = _generalServices.totalJoyasMes();
            return Ok(list.Data);
        }


        [HttpGet("JoyatotalMes")]
        public IActionResult TotalinJoyaMes()
        {
            var list = _generalServices.totalinJoyasMes();
            return Ok(list.Data);
        }




       
        [HttpGet("GeneroMes")]
        public IActionResult TotalGeneroMes()
        {
            var list = _generalServices.totalGeneroMes();
            return Ok(list.Data);
        }


        [HttpGet("VentaMes")]
        public IActionResult TotalVentasMes()
        {
            var list = _generalServices.totalProductosMes();
            return Ok(list.Data);
        }



        [HttpGet("Ventatotales")]
        public IActionResult Ventatotal()
        {
            var list = _generalServices.totalProductosMes();
            return Ok(list.Data);
        }



        [HttpGet("Ventatotalescatgoria")]
        public IActionResult Ventatotalcate()
        {
            var list = _generalServices.Ventatotalcate();
            return Ok(list.Data);
        }











        /// /////////////////////////////////// /////////////////////////////////







        [HttpGet("MaquillajeMesfiltrado/{fecha}")]
        public IActionResult TotalMaqillajeMesfiltrado(DateTime fecha)
        {
            var list = _generalServices.totalMaquillajeMesfiltrado(fecha);
            return Ok(list.Data);
        }


        [HttpGet("MaquillajetotalMesfiltrado/{fecha}")]
        public IActionResult TotalinMaqillajeMesfiltrado(DateTime fecha)
        {
            var list = _generalServices.totalinMaquillajeMesfiltrado(fecha);
            return Ok(list.Data);
        }




        [HttpGet("JoyaMesfiltrado/{fecha}")]
        public IActionResult TotalJoyaMesfiltrado(DateTime fecha)
        {
            var list = _generalServices.totalJoyasMesfiltrado(fecha);
            return Ok(list.Data);
        }


        [HttpGet("JoyatotalMesfiltrado/{fecha}")]
        public IActionResult TotalinJoyaMesfiltrado(DateTime fecha)
        {
            var list = _generalServices.totalinJoyasMesfiltrado(fecha);
            return Ok(list.Data);
        }
















    }
}
