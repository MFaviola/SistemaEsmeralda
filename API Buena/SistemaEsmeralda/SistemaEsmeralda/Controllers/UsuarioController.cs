using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SistemaEsmeralda.API.Services;
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
    public class UsuarioController : Controller
    {   
        private readonly AccesoServices _accesoServices;
        private readonly IMapper _mapper;
        private readonly IMailService _mailService;

        public UsuarioController(AccesoServices accesoServices, IMapper mapper, IMailService mailService)
        {
            _mapper = mapper;
            _accesoServices = accesoServices;
            _mailService = mailService;

        }
        [HttpGet("EnviarCodigo")]
        public IActionResult ValidarReestablecer(UsuariosViewModel item)
        {
            var model = _mapper.Map<tbUsuarios>(item);
            Random random = new Random();
            int randomNumber = random.Next(100000, 1000000);
            var estado = _accesoServices.ValidarReestablecer(model);
            var lista = estado.Data;
            if (lista.Count > 0)
            {
                var datos = estado.Data as List<tbUsuarios>;
                var first = datos.FirstOrDefault();
                _accesoServices.EnviarCodigo(randomNumber.ToString(), first.Usua_Id);
                MailData mailData = new MailData();
                mailData.EmailToId = first.empl_Correo;
                mailData.EmailToName = "Tienda Esmeralda";
                mailData.EmailSubject = "Codigo de Reestablecimiento de Contraseña";
                mailData.EmailBody = "Su codigo es:" + randomNumber.ToString();
                _mailService.SendGmail(mailData);
            }
            return Ok(lista);

        }

        [HttpPut("ValidarCodigo")]
        public IActionResult ValidarCodigo(string Codigo)
        {
            var list = _accesoServices.ValidarCodigo(Codigo);
            if(list.Success == true)
            {
                return Ok(list.Message);
            }
            else
            {
                return Problem(list.Message);
            }
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _accesoServices.ListadoUsuario();
            return Ok(list.Data);
        }

        [HttpPost("Create")]
        public IActionResult Insert(UsuariosViewModel item)
        {
            var model = _mapper.Map<tbUsuarios>(item);
            var modelo = new tbUsuarios()
            {
                Usua_Usuario = item.Usua_Usuario,
                Usua_Contraseña = item.Usua_Contraseña,
                Usua_Administrador = item.Usua_Administrador,
                Empl_Id = item.Empl_Id,
                Role_Id = item.Role_Id,
                Usua_UsuarioCreacion = 1,
                Usua_FechaCreacion =DateTime.Now
            };
            var list = _accesoServices.InsertarUsuario(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _accesoServices.obterUsuario(id);
            return Json(list.Data);
        }


        [HttpGet("Validar/{usuario},{contra}")]

        public IActionResult Validar(string usuario, string contra)
        {



            var list = _accesoServices.ValidarUsuario(usuario, contra);


            var prueba = list.Data as List<tbUsuarios>;
            if (prueba.Count > 0)
            {
                return Ok(list.Data);
            }
            else
            {
                list.Message = "Error";
                return Ok(list.Message);
            }

            //return Json(list.Data);
        }



        [HttpPut("Edit")]
        public IActionResult Update(UsuariosViewModel item)
        {
            _mapper.Map<tbUsuarios>(item);
            var modelo = new tbUsuarios()
            {
                Usua_Id= item.Usua_Id,
                Usua_Usuario = item.Usua_Usuario,
                Usua_Contraseña = item.Usua_Contraseña,
                Usua_Administrador = item.Usua_Administrador,
                Empl_Id = item.Empl_Id,
                Role_Id = item.Role_Id,
                Usua_UsuarioModificacion = 1,
                Usua_FechaModificacion = DateTime.Now
            };
            var list = _accesoServices.EditarUsuario(modelo);
            return Ok(new { success = true, message = list.Message });
        }


        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(int id)
        {
            var list = _accesoServices.EliminarUsuario(id);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpPut("Restablecer")]
        public IActionResult Restablecer (UsuariosViewModel item)
        {
            var modelo = _mapper.Map<tbUsuarios>(item);
            var list = _accesoServices.Restablecer(modelo);
            if (list.Success == true)
            {
                return Ok(list);
            }
            else
            {
                return Problem();
            }
        }





    }
}
