﻿using AutoMapper;
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
    public class MetodoPagoController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public MetodoPagoController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoMetodoPago();
            return Ok(list.Data);
        }






        [HttpPost("Create")]
        public IActionResult Insert(MetodoPagoViewModel item)
        {
            var model = _mapper.Map<tbMetodosPago>(item);
            var modelo = new tbMetodosPago()
            {
                Mepa_Metodo = item.Mepa_Metodo
,
                Mepa_UsuarioCreacion = item.Usua_ID,
                Mepa_FechaCreacion = DateTime.Now,
            };
            var list = _generalServices.InsertarMetodoPago(modelo);
            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterMetodoPago(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(MetodoPagoViewModel item)
        {
            _mapper.Map<tbMetodosPago>(item);
            var modelo = new tbMetodosPago()
            {
                Mepa_Id = item.Mepa_Id,
                Mepa_Metodo = item.Mepa_Metodo,
                Mepa_UsuarioModificacion = 1,
                Mepa_FechaModificacion = DateTime.Now
            };
            var list = _generalServices.EditarMetodoPago(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            var list = _generalServices.EliminarMetodoPago(id);
            return Ok(new { success = true, message = list.Message });
        }



    }
}
