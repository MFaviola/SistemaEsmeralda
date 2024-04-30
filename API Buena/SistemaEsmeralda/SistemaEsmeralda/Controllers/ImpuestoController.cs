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
    public class ImpuestoController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public ImpuestoController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoImpuesto();
            return Ok(list);
        }






        [HttpPost("Create")]
        public IActionResult Insert(ImpuestoViewModel item)
        {
            var model = _mapper.Map<tbImpuestos>(item);
            var modelo = new tbImpuestos()
            {
                Impu_Id = item.Impu_Id,
                Impu_Impuesto = item.Impu_Impuesto,
                Impu_UsuarioCreacion = 1,
                Impu_FechaCreacion = item.Impu_FechaCreacion,
            };
            var list = _generalServices.InsertarImpuestos(modelo);
            return Ok(list);
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterImpuestos(id);
            return Json(list);
        }


        [HttpPut("Edit")]
        public IActionResult Update(ImpuestoViewModel item)
        {
            _mapper.Map<tbImpuestos>(item);
            var modelo = new tbImpuestos()
            {
                Impu_Id = item.Impu_Id,
                Impu_Impuesto = item.Impu_Impuesto,
                Impu_UsuarioModificacion = 1,
                Impu_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarImpuestos(modelo);
            return Ok(list);
        }

        [HttpDelete("Delete")]
        public IActionResult Delete(string Impu_Id)
        {
            var list = _generalServices.EliminarImpuestos(Impu_Id);
            return Ok(list);
        }



    }
}
