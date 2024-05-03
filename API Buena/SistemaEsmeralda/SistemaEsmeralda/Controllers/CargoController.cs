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
    public class CargoController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public CargoController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoCargos();
            return Ok(list.Data);
        }






        [HttpPost("Create")]
        public IActionResult Insert(CargoViewModel item)
        {
            var model = _mapper.Map<tbCargos>(item);
            var modelo = new tbCargos()
            {
                Carg_Cargo = item.Carg_Cargo 
,
                Carg_UsuarioCreacion = item.Carg_UsuarioCreacion,
                Carg_FechaCreacion = item.Carg_FechaCreacion,
            };
            var list = _generalServices.InsertarCargos(modelo);
            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterCargos(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(CargoViewModel item)
        {
            _mapper.Map<tbCargos>(item);
            var modelo = new tbCargos()
            {
                Carg_Id = item.Carg_Id,
                Carg_Cargo = item.Carg_Cargo,
                Carg_UsuarioModificacion = 1,
                Carg_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarCargo(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete")]
        public IActionResult Delete(string Carg_Id)
        {
            var list = _generalServices.EliminarCargo(Carg_Id);
            return Ok(new { success = true, message = list.Message });
        }





    }
}
