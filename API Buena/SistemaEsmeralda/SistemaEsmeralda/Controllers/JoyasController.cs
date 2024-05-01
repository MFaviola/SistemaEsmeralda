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
    public class JoyasController : Controller
    {
        private readonly VentasServices _ventasServices;

        private readonly IMapper _mapper;
        public JoyasController(VentasServices ventasServices, IMapper mapper)
        {
            _ventasServices = ventasServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _ventasServices.ListadoJoyas();
            return Ok(list.Data);
        }






        [HttpPost("Create")]
        public IActionResult Insert(JoyasViewModel item)
        {
            var model = _mapper.Map<tbJoyas>(item);
            var modelo = new tbJoyas()
            {
                Joya_Nombre = item.Joya_Nombre,
                Joya_PrecioCompra = item.Joya_PrecioCompra,
                Joya_PrecioVenta = item.Joya_PrecioVenta,
                Joya_PrecioMayor = item.Joya_PrecioMayor,
                Joya_Imagen = item.Joya_Imagen,
                Prov_Id = item.Prov_Id,
                Mate_Id = item.Mate_Id,
                Cate_Id = item.Cate_Id,
                Joya_UsuarioCreacion = 1,
                Joya_FechaCreacion = DateTime.Now

            };
            var list = _ventasServices.InsertarJoya(modelo);
            return Ok(list.Data);
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _ventasServices.obterJoya(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(JoyasViewModel item)
        {
            _mapper.Map<tbJoyas>(item);
            var modelo = new tbJoyas()
            {
                Joya_Id = item.Joya_Id,
                Joya_Nombre = item.Joya_Nombre,
                Joya_PrecioCompra = item.Joya_PrecioCompra,
                Joya_PrecioVenta = item.Joya_PrecioVenta,
                Joya_PrecioMayor = item.Joya_PrecioMayor,
                Joya_Imagen = item.Joya_Imagen,
                Prov_Id = item.Prov_Id,
                Mate_Id = item.Mate_Id,
                Cate_Id = item.Cate_Id,
                Joya_UsuarioModificacion = 1,
                Joya_FechaModificacion = DateTime.Now
            };
            var list = _ventasServices.EditarJoyas(modelo);
            return Ok(list.Data);
        }

        [HttpDelete("Delete")]
        public IActionResult Delete(string Joya_Id)
        {
            var list = _ventasServices.EliminarJoya(Joya_Id);
            return Ok(list.Data);
        }

    }
}
