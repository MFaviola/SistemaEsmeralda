﻿using AutoMapper;
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
    public class ClienteController : Controller
    {
        private readonly GeneralServices _generalServices;

        private readonly IMapper _mapper;
        public ClienteController(GeneralServices generalServices, IMapper mapper)
        {
            _generalServices = generalServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _generalServices.ListadoClientes();
            return Ok(list.Data);
        }





        [HttpPost("Create")]
        public IActionResult Insert(ClienteViewModel item)
        {
            var model = _mapper.Map<tbClientes>(item);
            var modelo = new tbClientes()
            {
                Clie_Nombre = item.Clie_Nombre,
                Clie_Apellido = item.Clie_Apellido,
                Clie_DNI = item.Clie_DNI,
                Clie_FechaNac = item.Clie_FechaNac,
                Clie_Sexo = item.Clie_Sexo,
                Muni_Codigo = item.Muni_Codigo,
                Esta_Id = item.Esta_Id,
                Clie_UsuarioCreacion = item.Usua_Id,
                Clie_FechaCreacion = DateTime.Now

            };
            var list = _generalServices.InsertarCliente(modelo);
            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _generalServices.obterCliente(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(ClienteViewModel item)
        {
            _mapper.Map<tbClientes>(item);
            var modelo = new tbClientes()
            {
                Clie_Id = item.Clie_Id,
                Clie_Nombre = item.Clie_Nombre,
                Clie_Apellido = item.Clie_Apellido,
                Clie_FechaNac = item.Clie_FechaNac,
                Clie_DNI = item.Clie_DNI,
                Clie_Sexo = item.Clie_Sexo,
                Muni_Codigo = item.Muni_Codigo,
                Esta_Id = item.Esta_Id,
                Clie_UsuarioCreacion = item.Usua_Id,
                Clie_FechaCreacion = DateTime.Now
            };
            var list = _generalServices.EditarCliente(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            var list = _generalServices.EliminarClientes(id);
            return Ok(new { success = true, message = list.Message });
        }



    }
}
