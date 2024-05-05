using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
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
    public class MarcaController : Controller
    {

        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public MarcaController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoMarca();
            return Ok(list.Data);
        }

        [HttpGet("DropDown")]
        public IActionResult List()
        {
            var list = _generalServices.ListadoMarca();
            var drop = list.Data as List<tbMarcas>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.Marc_Marca,
                Value = x.Marc_Id.ToString()
            }).ToList();


            rol.Insert(0, new SelectListItem { Text = "-- SELECCIONE --", Value = "0" });
            return Ok(rol.ToList());
        }


        [HttpPost("Create")]
        public IActionResult Insert(MarcaViewModel item)
        {
            var model = _mapper.Map<tbMarcas>(item);
            var modelo = new tbMarcas()
            {
                Marc_Marca = item.Marc_Marca
,
                Marc_UsuarioCreacion = item.Marc_UsuarioCreacion,
                Marc_FechaCreacion = item.Marc_FechaCreacion,
            };
            var list = _generalServices.InsertarMarcas(modelo);
            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterMarcas(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(MarcaViewModel item)
        {
            _mapper.Map<tbMarcas>(item);
            var modelo = new tbMarcas()
            {
                Marc_Id = item.Marc_Id,
                Marc_Marca = item.Marc_Marca,
                Marc_UsuarioModificacion = 1,
                Marc_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarMarca(modelo);
            return Ok(new { success = true, message = list.Message });
        }
        [HttpDelete("Delete/{id}")]

        public IActionResult Delete(string id)
        {
            var list = _generalServices.EliminarMarcas(id);
            return Ok(new { success = true, message = list.Message });
        }

    }
}
