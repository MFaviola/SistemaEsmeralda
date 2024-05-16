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
    public class SucursalController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public SucursalController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoSucursal();
            return Ok(list.Data);
        }



        [HttpPost("Create")]
        public IActionResult Insert(SucursalViewModel item)
        {
            var model = _mapper.Map<tbSucursales>(item);
            var modelo = new tbSucursales()
            {
                Sucu_Nombre = item.Sucu_Nombre,

                Muni_Codigo = item.Muni_Codigo,

                Sucu_UsuarioCreacion = item.Usua_Id,
                Sucu_FechaCreacion = item.Sucu_FechaCreacion,
            };
            var list = _generalServices.InsertarSucursal(modelo);
            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterSucursal(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(SucursalViewModel item)
        {
            _mapper.Map<tbSucursales>(item);
            var modelo = new tbSucursales()
            {
                Sucu_Id = item.Sucu_Id,
                Sucu_Nombre = item.Sucu_Nombre,
                Muni_Codigo = item.Muni_Codigo,

                Sucu_UsuarioModificacion = item.Usua_Id,
                Sucu_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarSucursal(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete")]
        public IActionResult Delete(string Sucu_Id)
        {
            var list = _generalServices.EliminarSucursal(Sucu_Id);
            return Ok(new { success = true, message = list.Message });
        }

    }
}
