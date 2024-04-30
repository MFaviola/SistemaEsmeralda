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
    public class MaterialController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public MaterialController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoMateriales();
            return Ok(list.Data);
        }






        [HttpPost("Create")]
        public IActionResult Insert(MaterialViewModel item)
        {
            var model = _mapper.Map<tbMateriales>(item);
            var modelo = new tbMateriales()
            {
                Mate_Material = item.Mate_Material
,
                Mate_UsuarioCreacion = 1,
                Mate_FechaCreacion = item.Mate_FechaCreacion,
            };
            var list = _generalServices.InsertarMateriales(modelo);
            return Ok(list.Data);
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterMateriales(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(MaterialViewModel item)
        {
            _mapper.Map<tbMateriales>(item);
            var modelo = new tbMateriales()
            {
                Mate_Id = item.Mate_Id,
                Mate_Material = item.Mate_Material,
                Mate_UsuarioModificacion = 1,
                Mate_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarMaterial(modelo);
            return Ok(list.Data);
        }

        [HttpDelete("Delete")]
        public IActionResult Delete(string Mate_Id)
        {
            var list = _generalServices.EliminarMateriales(Mate_Id);
            return Ok(list.Data);
        }




    }
}
