using AutoMapper;
using Microsoft.AspNetCore.Http;
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
    public class JoyasController : Controller
    {
        private readonly VentasServices _ventasServices;

        private readonly IMapper _mapper;
        public JoyasController(VentasServices ventasServices, IMapper mapper)
        {
            _ventasServices = ventasServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _ventasServices.ListadoJoyas();
            return Ok(list.Data);
        }

        [HttpGet("DropDown")]
        public IActionResult List()
        {
            var list = _ventasServices.ListadoJoyas();
            var drop = list.Data as List<tbJoyas>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.Joya_Nombre,
                Value = x.Joya_Id.ToString()
            }).ToList();


            rol.Insert(0, new SelectListItem { Text = "-- SELECCIONE --", Value = "0" });
            return Ok(rol.ToList());
        }




        [HttpPost("Create")]
        public IActionResult Insert(JoyasViewModel item)
        {
            var model = _mapper.Map<tbJoyas>(item);
            var modelo = new tbJoyas()
            {
                Joya_Nombre = item.Joya_Nombre,
                Joya_PrecioCompra = item.Joya_PrecioCompra,
                Joya_PrecioVenta = item.Joya_PrecioVenta,
                Joya_PrecioMayor = item.Joya_PrecioMayor,
                Joya_Imagen = item.Joya_Imagen,
                Prov_Id = item.Prov_Id,
                Mate_Id = item.Mate_Id,
                Cate_Id = item.Cate_Id,
                Joya_UsuarioCreacion = 1,
                Joya_FechaCreacion = DateTime.Now

            };
            var list = _ventasServices.InsertarJoya(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpPost("Subir")]
        public async Task<IActionResult> UploadImage(IFormFile file)
        {
            if (file == null || file.Length == 0)
            {
                return BadRequest("No file uploaded.");
            }


         

            // Optionally, upload the file from 'path' to your bucket here

            return Ok(new { message = "File successfully uploaded" });
        }


        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _ventasServices.obterJoya(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(JoyasViewModel item)
        {
            _mapper.Map<tbJoyas>(item);
            var modelo = new tbJoyas()
            {
                Joya_Id = item.Joya_Id,
                Joya_Nombre = item.Joya_Nombre,
                Joya_PrecioCompra = item.Joya_PrecioCompra,
                Joya_PrecioVenta = item.Joya_PrecioVenta,
                Joya_PrecioMayor = item.Joya_PrecioMayor,
                Joya_Imagen = item.Joya_Imagen,
                Prov_Id = item.Prov_Id,
                Mate_Id = item.Mate_Id,
                Cate_Id = item.Cate_Id,
                Joya_UsuarioModificacion = 1,
                Joya_FechaModificacion = DateTime.Now
            };
            var list = _ventasServices.EditarJoyas(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            var list = _ventasServices.EliminarJoya(id);
            return Ok(new { success = true, message = list.Message });
        }

    }
}
