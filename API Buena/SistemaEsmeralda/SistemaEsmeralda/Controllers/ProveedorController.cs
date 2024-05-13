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
    public class ProveedorController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public ProveedorController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoProveedor();
            return Ok(list.Data);
        }
        [HttpGet("DropDown")]
        public IActionResult List()
        {
            var list = _generalServices.ListadoProveedor();
            var drop = list.Data as List<tbProveedores>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.Prov_Proveedor,
                Value = x.Prov_Id.ToString()
            }).ToList();
            rol.Insert(0, new SelectListItem { Text = "-- SELECCIONE --", Value = "0" });
            return Ok(rol.ToList());
        }

        [HttpPost("Create")]
        public IActionResult Insert(ProveedorViewModel item)
        {
            var model = _mapper.Map<tbProveedores>(item);
            var modelo = new tbProveedores()
            {
                Prov_Proveedor = item.Prov_Proveedor,
                Prov_Telefono = item.Prov_Telefono,
                Muni_Codigo = item.Muni_Codigo,
                Prov_UsuarioCreacion = 1,
                Prov_FechaCreacion = DateTime.Now

            };
            var list = _generalServices.InsertarProveedor(modelo);
            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterProveedor(id);
            return Json(list.Data);
        }


        [HttpGet("AutoCompletado")]
        public IActionResult AutoCompletado()
        {
            var list = _generalServices.ListadoProveedor1();
            var drop = list.Data as List<tbProveedores>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.nombreProveedor,
                Value = x.Prov_Id.ToString()
            }).ToList();

            return Ok(rol.ToList());
        }

        [HttpPut("Edit")]
        public IActionResult Update(ProveedorViewModel item)
        {
            _mapper.Map<tbProveedores>(item);
            var modelo = new tbProveedores()
            {
                Prov_Id = item.Prov_Id,
                Prov_Proveedor = item.Prov_Proveedor,
                Prov_Telefono = item.Prov_Telefono,
                Muni_Codigo = item.Muni_Codigo,
                Prov_UsuarioModificacion = 1,
                Prov_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarProveedor(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            var list = _generalServices.EliminarProveedor(id);
            return Ok(new { success = true, message = list.Message });
        }

    }
}
