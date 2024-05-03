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
    public class EstadoCivilController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public EstadoCivilController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
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
                Esta_UsuarioCreacion = item.Esta_UsuarioCreacion,
                Esta_FechaCreacion = item.Esta_FechaCreacion,
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
                    Esta_UsuarioModificacion = 1,
                Esta_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarEstadosCiviles(modelo);
            return Ok(list.Data);
        }

        [HttpDelete("Delete")]
        public IActionResult Delete(string Esta_Id)
        {
            var list = _generalServices.EliminarEstadosCiviles(Esta_Id);
            return Ok(list.Data);
        }




    }
}
