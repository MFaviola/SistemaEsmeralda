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
            return Ok(list);
        }






        [HttpPost("Create")]
        public IActionResult Insert(DepartamentoViewModel item)
        {
            var model = _mapper.Map<tbDepartamentos>(item);
            var modelo = new tbDepartamentos()
            {
                Depa_Codigo = item.Depa_Codigo,
                Depa_Departamento = item.Depa_Departamento,
                Depa_UsuarioCreacion = item.Depa_UsuarioCreacion,
                Depa_FechaCreacion = item.Depa_FechaCreacion,
            };
            var list = _generalServices.InsertarDepto(modelo);
            return Ok(list);
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
            return Ok(list);
        }

        [HttpDelete("Delete")]
        public IActionResult Delete(string Depa_Codigo)
        {
            var list = _generalServices.EliminarDepto(Depa_Codigo);
            return Ok(list);
        }






    }
}
