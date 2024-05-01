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
    public class MaquillajeController : Controller
    {
        private readonly VentasServices _ventasServices;

        private readonly IMapper _mapper;
        public MaquillajeController(VentasServices ventasServices, IMapper mapper)
        {
            _ventasServices = ventasServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _ventasServices.ListadoMaquillaje();
            return Ok(list.Data);
        }






        [HttpPost("Create")]
        public IActionResult Insert(MaquillajeViewModel item)
        {
            var model = _mapper.Map<tbMaquillajes>(item);
            var modelo = new tbMaquillajes()
            {
                Maqu_Nombre = item.Maqu_Nombre,
                Maqu_PrecioCompra = item.Maqu_PrecioCompra,
                Maqu_PrecioVenta = item.Maqu_PrecioVenta,
                Maqu_PrecioMayor = item.Maqu_PrecioMayor,
                Maqu_Imagen = item.Maqu_Imagen,
                Prov_Id = item.Prov_Id,
                Marc_Id = item.Marc_Id,
                Maqu_UsuarioCreacion = 1,
                Maqu_FechaCreacion = DateTime.Now

            };
            var list = _ventasServices.InsertarMaquillaje(modelo);
            return Ok(list.Data);
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _ventasServices.obterMaquillaje(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(MaquillajeViewModel item)
        {
            _mapper.Map<tbMaquillajes>(item);
            var modelo = new tbMaquillajes()
            {
                Maqu_Id = item.Maqu_Id,
                Maqu_Nombre = item.Maqu_Nombre,
                Maqu_PrecioCompra = item.Maqu_PrecioCompra,
                Maqu_PrecioVenta = item.Maqu_PrecioVenta,
                Maqu_PrecioMayor = item.Maqu_PrecioMayor,
                Maqu_Imagen = item.Maqu_Imagen,
                Prov_Id = item.Prov_Id,
                Marc_Id = item.Marc_Id,
                Maqu_UsuarioModificacion = 1,
                Maqu_FechaModificacion = DateTime.Now
            };
            var list = _ventasServices.EditarMaquillaje(modelo);
            return Ok(list.Data);
        }

        [HttpDelete("Delete")]
        public IActionResult Delete(string Maqu_Id)
        {
            var list = _ventasServices.EliminarMaquillaje(Maqu_Id);
            return Ok(list.Data);
        }
    }
}
