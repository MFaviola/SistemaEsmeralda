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
    public class RolController : Controller
    {
        private readonly AccesoServices  _accesoServices;

        private readonly IMapper _mapper;
        public RolController(AccesoServices  accesoServices, IMapper mapper)
        {
            _accesoServices = accesoServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _accesoServices.ListadoRol();
            return Ok(list.Data);
        }







        [HttpPost("Create")]
        public IActionResult Insert(RolViewModel item)
        {
            var model = _mapper.Map<tbRoles>(item);
            var modelo = new tbRoles()
            {
                Role_Rol = item.Role_Rol
,
                Role_UsuarioCreacion = item.Role_UsuarioCreacion,
                Role_FechaCreacion = item.Role_FechaCreacion,
            };
            var list = _accesoServices.InsertarRol(modelo);
            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _accesoServices.obterRol(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(RolViewModel item)
        {
            _mapper.Map<tbRoles>(item);
            var modelo = new tbRoles()
            {
                Role_Id = item.Role_Id,
                Role_Rol = item.Role_Rol,
                Role_UsuarioModificacion = 1,
                Role_FechaModificacion = DateTime.Now
            };
            var list = _accesoServices.EditarRol(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            var list = _accesoServices.EliminarRol(id);
            return Ok(new { success = true, message = list.Message });
        }



    }
}
