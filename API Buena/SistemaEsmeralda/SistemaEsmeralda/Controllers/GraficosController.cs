using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SistemaEsmeralda.BusinessLogic.Services;
using SistemaEsmeralda.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Globalization;
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


        //[HttpGet("ProductoMes")]
        //public IActionResult TotalProductosMes()
        //{
        //    var list = _generalServices.totalProductoMes();

        //    return Ok(list.Data);
        //}

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



        //[HttpGet("Ventatotales")]
        //public IActionResult Ventatotal()
        //{
        //    var list = _generalServices.totalProductosMes();
        //    return Ok(list.Data);
        //}



        //[HttpGet("Ventatotalescatgoria")]
        //public IActionResult Ventatotalcate()
        //{
        //    var list = _generalServices.Ventatotalcate();
        //    return Ok(list.Data);
        //}











        /// /////////////////////////////////// ///////////////////////////////// /////////


        [HttpGet("Ventatotales/{anio}")]
        public IActionResult Ventatotalporaani (int anio)
        {
            var list = _generalServices.totalProductosMesaño(anio);
            return Ok(list.Data);
        }



        [HttpGet("Ventatotalescatgoria/{anio}")]
        public IActionResult Ventatotalcateporanio (int anio)
        {
            var list = _generalServices.Ventatotalcateaño(anio);
            return Ok(list.Data);
        }





        [HttpGet("cantidadMesfiltrado/{fechainicio}/{fechafin}")]
        public IActionResult cantidadProductosMesfiltrado(string fechainicio, string fechafin)
        {
            string formatoEntrada = "yyyy-MM-dd";
            CultureInfo provider = CultureInfo.InvariantCulture;

            try
            {
                DateTime fechaInicioParsed = DateTime.ParseExact(fechainicio, formatoEntrada, provider);
                DateTime fechaFinParsed = DateTime.ParseExact(fechafin, formatoEntrada, provider);

                var list = _generalServices.totalcantidadMesfiltrado(fechaInicioParsed, fechaFinParsed);

                var resultado = new
                {
                    FechaInicio = fechaInicioParsed.ToString("dd/MM/yyyy"),
                    FechaFin = fechaFinParsed.ToString("dd/MM/yyyy"),
                    Datos = list.Data
                };

                return Ok(list.Data);
            }
            catch (FormatException)
            {
                return BadRequest("Formato de fecha incorrecto. Asegúrate de que las fechas sigan el formato 'yyyy-MM-dd'.");
            }
        }






        [HttpGet("totaldMesfiltrado/{fechainicio}/{fechafin}")]
        public IActionResult TotalProductosMesfiltrado(string fechainicio, string fechafin)
        {
            string formatoEntrada = "yyyy-MM-dd";
            CultureInfo provider = CultureInfo.InvariantCulture;

            try
            {
                DateTime fechaInicioParsed = DateTime.ParseExact(fechainicio, formatoEntrada, provider);
                DateTime fechaFinParsed = DateTime.ParseExact(fechafin, formatoEntrada, provider);

                var list = _generalServices.totalProductoMesfiltrado(fechaInicioParsed, fechaFinParsed);

                var resultado = new
                {
                    FechaInicio = fechaInicioParsed.ToString("dd/MM/yyyy"),
                    FechaFin = fechaFinParsed.ToString("dd/MM/yyyy"),
                    Datos = list.Data
                };

                return Ok(list.Data);
            }
            catch (FormatException)
            {
                return BadRequest("Formato de fecha incorrecto. Asegúrate de que las fechas sigan el formato 'yyyy-MM-dd'.");
            }
        }













        [HttpGet("top5maquillaje/{fechainicio}/{fechafin}")]
        public IActionResult Top5maquillajes(string fechainicio, string fechafin)
        {
            string formatoEntrada = "yyyy-MM-dd";
            CultureInfo provider = CultureInfo.InvariantCulture;

            try
            {
                DateTime fechaInicioParsed = DateTime.ParseExact(fechainicio, formatoEntrada, provider);
                DateTime fechaFinParsed = DateTime.ParseExact(fechafin, formatoEntrada, provider);

                var list = _generalServices.Top5Maquillaje(fechaInicioParsed, fechaFinParsed);

               

                return Ok(list.Data);
            }
            catch (FormatException)
            {
                return BadRequest("Formato de fecha incorrecto. Asegúrate de que las fechas sigan el formato 'yyyy-MM-dd'.");
            }
        }








        [HttpGet("top5joyas/{fechainicio}/{fechafin}")]
        public IActionResult Top5joyas(string fechainicio, string fechafin)
        {
            string formatoEntrada = "yyyy-MM-dd";
            CultureInfo provider = CultureInfo.InvariantCulture;

            try
            {
                DateTime fechaInicioParsed = DateTime.ParseExact(fechainicio, formatoEntrada, provider);
                DateTime fechaFinParsed = DateTime.ParseExact(fechafin, formatoEntrada, provider);

                var list = _generalServices.Top5Joyas(fechaInicioParsed, fechaFinParsed);



                return Ok(list.Data);
            }
            catch (FormatException)
            {
                return BadRequest("Formato de fecha incorrecto. Asegúrate de que las fechas sigan el formato 'yyyy-MM-dd'.");
            }
        }





    }
}
