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




        //public IActionResult TotalJoyaMes()
        //{
        //    int ? total = 0;
        //    var list = _generalServices.totalJoyasMes();
        //    var lista = list.Data as List<tbFacturaDetalles>;
        //    foreach (var item in lista)
        //    {
        //        total += item.Total;
        //    }

        //    return Ok(lista.ToList());
        //}


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

    }
}
