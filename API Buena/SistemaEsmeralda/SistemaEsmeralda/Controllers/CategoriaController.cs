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
    public class CategoriaController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public CategoriaController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoCateoria();
            return Ok(list.Data);
        }



        [HttpPost("Create")]
        public IActionResult Insert(CategoriaViewModel item)
        {
            var model = _mapper.Map<tbCategorias>(item);
            var modelo = new tbCategorias()
            {
                Cate_Categoria = item.Cate_Categoria
,
                Cate_UsuarioCreacion = item.Cate_UsuarioCreacion,
                Cate_FechaCreacion = item.Cate_FechaCreacion,
            };
            var list = _generalServices.InsertarCategorias(modelo);
            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterCategorias(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(CategoriaViewModel item)
        {
            _mapper.Map<tbCategorias>(item);
            var modelo = new tbCategorias()
            {
                Cate_Id = item.Cate_Id,
                Cate_Categoria = item.Cate_Categoria,
                Cate_UsuarioModificacion = 1,
                Cate_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarCategoria(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete")]
        public IActionResult Delete(string Cate_Id)
        {
            var list = _generalServices.EliminarCategorias(Cate_Id);
            return Ok(new { success = true, message = list.Message });
        }


    }
}
