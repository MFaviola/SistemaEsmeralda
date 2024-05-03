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
    public class EmpleadoController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public EmpleadoController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoEmpleado();
            return Ok(list.Data);
        }






        [HttpPost("Create")]
        public IActionResult Insert(EmpleadoViewModel item)
        {
            var model = _mapper.Map<tbEmpleados>(item);
            var modelo = new tbEmpleados()
            {
                Empl_Nombre = item.Empl_Nombre,
                Empl_Apellido = item.Empl_Apellido,
                Empl_FechaNac = item.Empl_FechaNac,
                Empl_Sexo = item.Empl_Sexo,
                Muni_Codigo = item.Muni_Codigo,
                Esta_Id = item.Esta_Id,
                Carg_Id = item.Carg_Id,
                Sucu_Id = item.Sucu_Id,

                Empl_UsuarioCreacion = 1,
                Empl_FechaCreacion = DateTime.Now

            };
            var list = _generalServices.InsertarEmpleado(modelo);
            return Ok(list.Data);
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterEmpleado(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(EmpleadoViewModel item)
        {
            _mapper.Map<tbEmpleados>(item);
            var modelo = new tbEmpleados()
            {
                Empl_Id = item.Empl_Id,
                Empl_Nombre = item.Empl_Nombre,
                Empl_Apellido = item.Empl_Apellido,
                Empl_FechaNac = item.Empl_FechaNac,
                Empl_Sexo = item.Empl_Sexo,
                Muni_Codigo = item.Muni_Codigo,
                Esta_Id = item.Esta_Id,
                Carg_Id = item.Carg_Id,
                Sucu_Id = item.Sucu_Id,
                
                Empl_UsuarioCreacion = 1,
                Empl_FechaCreacion = DateTime.Now
            };
            var list = _generalServices.EditarEmpleado(modelo);
            return Ok(list.Data);
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            var list = _generalServices.EliminarEmpleado(id);
            return Ok(list.Data);
        }


    }
}
