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
    public class MarcaController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public MarcaController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoCateoria();
            return Ok(list);
        }



        [HttpPost("Create")]
        public IActionResult Insert(MarcaViewModel item)
        {
            var model = _mapper.Map<tbMarcas>(item);
            var modelo = new tbMarcas()
            {
                Marc_Marca = item.Marc_Marca
,
                Marc_UsuarioCreacion = item.Marc_UsuarioCreacion,
                Marc_FechaCreacion = item.Marc_FechaCreacion,
            };
            var list = _generalServices.InsertarMarcas(modelo);
            return Ok(list);
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterMarcas(id);
            return Json(list);
        }


        [HttpPut("Edit")]
        public IActionResult Update(MarcaViewModel item)
        {
            _mapper.Map<tbMarcas>(item);
            var modelo = new tbMarcas()
            {
                Marc_Id = item.Marc_Id,
                Marc_Marca = item.Marc_Marca,
                Marc_UsuarioModificacion = 1,
                Marc_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarMarca(modelo);
            return Ok(list);
        }

        [HttpDelete("Delete")]
        public IActionResult Delete(string Marc_Id)
        {
            var list = _generalServices.EliminarMarcas(Marc_Id);
            return Ok(list);
        }

    }
}
