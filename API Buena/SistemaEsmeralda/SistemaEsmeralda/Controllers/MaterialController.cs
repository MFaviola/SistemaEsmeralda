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
    public class MaterialController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public MaterialController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoMateriales();
            return Ok(list.Data);
        }


        [HttpGet("DropDown")]
        public IActionResult List()
        {
            var list = _generalServices.ListadoMateriales();
            var drop = list.Data as List<tbMateriales>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.Mate_Material,
                Value = x.Mate_Id.ToString()
            }).ToList();


            rol.Insert(0, new SelectListItem { Text = "-- SELECCIONE --", Value = "0" });
            return Ok(rol.ToList());
        }



        [HttpPost("Create")]
        public IActionResult Insert(MaterialViewModel item)
        {
            var model = _mapper.Map<tbMateriales>(item);
            var modelo = new tbMateriales()
            {
                Mate_Material = item.Mate_Material
,
                Mate_UsuarioCreacion = 1,
                Mate_FechaCreacion = item.Mate_FechaCreacion,
            };
            var list = _generalServices.InsertarMateriales(modelo);
            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterMateriales(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(MaterialViewModel item)
        {
            _mapper.Map<tbMateriales>(item);
            var modelo = new tbMateriales()
            {
                Mate_Id = item.Mate_Id,
                Mate_Material = item.Mate_Material,
                Mate_UsuarioModificacion = 1,
                Mate_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarMaterial(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            var list = _generalServices.EliminarMateriales(id);
            return Ok(new { success = true, message = list.Message });
        }




    }
}
