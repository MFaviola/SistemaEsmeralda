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
        public IActionResult Delete(string id)
        {
            var list = _generalServices.EliminarProveedor(Prov_Id);
            return Ok(new { success = true, message = list.Message });
        }

    }
}
