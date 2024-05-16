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
    public class CargoController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public CargoController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }




        [HttpGet("DropDown")]
        public IActionResult List()
        {
            var list = _generalServices.ListadoCargos();
            var drop = list.Data as List<tbCargos>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.Carg_Cargo,
                Value = x.Carg_Id.ToString()
            }).ToList();


            rol.Insert(0, new SelectListItem { Text = "-- SELECCIONE --", Value = "0" });
            return Ok(rol.ToList());
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
                Carg_UsuarioCreacion = item.Usua_ID,
                Carg_FechaCreacion = DateTime.Now,
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
                Carg_UsuarioModificacion = item.Usua_ID,
                Carg_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarCargo(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            var list = _generalServices.EliminarCargo(id);
            return Ok(new { success = true, message = list.Message });
        }





    }
}
