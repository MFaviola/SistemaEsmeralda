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
    public class EstadoCivilController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public EstadoCivilController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }





        [HttpGet("DropDown")]
        public IActionResult List()
        {
            var list = _generalServices.ListadoEstadosCiviles();
            var drop = list.Data as List<tbEstadosCiviles>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.Esta_EstadoCivil,
                Value = x.Esta_Id.ToString()
            }).ToList();


            rol.Insert(0, new SelectListItem { Text = "-- SELECCIONE --", Value = "0" });
            return Ok(rol.ToList());
        }







        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoEstadosCiviles();
            return Ok(list.Data);
        }






        [HttpPost("Create")]
        public IActionResult Insert(EstadoCivilViewModel item)
        {
            var model = _mapper.Map<tbEstadosCiviles>(item);
            var modelo = new tbEstadosCiviles()
            {
                Esta_EstadoCivil = item.Esta_EstadoCivil
,
                Esta_UsuarioCreacion = item.Usua_Id,
                Esta_FechaCreacion = DateTime.Now,
            };
            var list = _generalServices.InsertarEstadoCiviles(modelo);
            return Ok(new { success = true, message = list.Message });

        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterEstadosCiviles(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(EstadoCivilViewModel item)
        {
            _mapper.Map<tbEstadosCiviles>(item);
            var modelo = new tbEstadosCiviles()
            {
                Esta_Id = item.Esta_Id,
                Esta_EstadoCivil = item.Esta_EstadoCivil,
                    Esta_UsuarioModificacion = item.Usua_Id,
                Esta_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarEstadosCiviles(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            var list = _generalServices.EliminarEstadosCiviles(id);
            return Ok(new { success = true, message = list.Message });
        }




    }
}
