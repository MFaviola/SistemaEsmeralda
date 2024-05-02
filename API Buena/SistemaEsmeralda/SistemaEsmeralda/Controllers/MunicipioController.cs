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
    public class MunicipioController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public MunicipioController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoMunicipio();
            
            return Ok(list.Data);
        }






        [HttpPost("Create")]
        public IActionResult Insert(MunicipioViewModel item)
        {
            var model = _mapper.Map<tbMunicipios>(item);
            var modelo = new tbMunicipios()
            {
                Muni_Codigo = item.Muni_Codigo,

                Muni_Municipio = item.Muni_Municipio,

                Depa_Codigo = item.Depa_Codigo,
                Muni_UsuarioCreacion = 1,
                Muni_FechaCreacion = DateTime.Now,
            };
            var list = _generalServices.InsertarMunicipio(modelo);

            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(string id)
        {

            var list = _generalServices.obterMunicipio(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(MunicipioViewModel item)
        {
            _mapper.Map<tbMunicipios>(item);
            var modelo = new tbMunicipios()
            {
                Muni_Codigo = item.Muni_Codigo,
                Muni_Municipio = item.Muni_Municipio,

                Depa_Codigo = item.Depa_Codigo,
                Muni_UsuarioModificacion = 1,
                Muni_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarMunicipio(modelo);
            return Ok(list.Data);
        }

        [HttpDelete("Delete")]
        public IActionResult Delete(string Muni_Codigo)
        {
            var list = _generalServices.EliminarMunicipio(Muni_Codigo);
            return Ok(list.Data);
        }




    }
}
