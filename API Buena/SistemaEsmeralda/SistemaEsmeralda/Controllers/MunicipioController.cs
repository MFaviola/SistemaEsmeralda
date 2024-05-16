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


        [HttpGet("Lista/{id}")]
        public IActionResult IndexPorMunicipio(string id)
        {
            var list = _generalServices.ListadoMunicipioDepartamento(id);
            var drop = list.Data as List<tbMunicipios>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.Muni_Municipio,
                Value = x.Muni_Codigo
            }).ToList();


            rol.Insert(0, new SelectListItem { Text = "-- SELECCIONE --", Value = "0" });
            return Ok(rol.ToList());
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
                Muni_UsuarioCreacion = item.Usua_ID,
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
        public IActionResult Edit(MunicipioViewModel item)
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

            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            var list = _generalServices.EliminarMunicipio(id);
            return Ok(new { success = true, message = list.Message });
        }




    }
}
