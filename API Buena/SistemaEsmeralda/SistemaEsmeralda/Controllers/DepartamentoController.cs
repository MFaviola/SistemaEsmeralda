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
    public class DepartamentoController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public DepartamentoController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoDepartamentos();
            return Ok(list.Data);
        }

        [HttpGet("DropDown")]
        public IActionResult List()
        {
            var list = _generalServices.ListadoDepartamentos();
            var drop = list.Data as List<tbDepartamentos>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.Depa_Departamento,
                Value = x.Depa_Codigo
            }).ToList();


            rol.Insert(0, new SelectListItem { Text = "-- SELECCIONE --", Value = "0" });
            return Ok(rol.ToList());
        }




        [HttpPost("Create")]
        public IActionResult Insert(DepartamentoViewModel item)
        {
            var model = _mapper.Map<tbDepartamentos>(item);
            var modelo = new tbDepartamentos()
            {
                Depa_Codigo = item.Depa_Codigo,
                Depa_Departamento = item.Depa_Departamento,
                Depa_UsuarioCreacion = 1,
                Depa_FechaCreacion = DateTime.Now,
            };
            var list = _generalServices.InsertarDepto(modelo);
            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(string id)
        {

            var list = _generalServices.obterDepto(id);
            return Json(list);
        }


        [HttpPut("Edit")]
        public IActionResult Update(DepartamentoViewModel item)
        {
            _mapper.Map<tbDepartamentos>(item);
            var modelo = new tbDepartamentos()
            {
                Depa_Codigo = item.Depa_Codigo,
                Depa_Departamento = item.Depa_Departamento,
                Depa_UsuarioModificacion = 1,
                Depa_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarDepto(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete")]
        public IActionResult Delete(string Depa_Codigo)
        {
            var list = _generalServices.EliminarDepto(Depa_Codigo);
            return Ok(new { success = true, message = list.Message });
        }






    }
}
