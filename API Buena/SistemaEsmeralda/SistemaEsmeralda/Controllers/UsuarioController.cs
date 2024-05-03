using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SistemaEsmeralda.BusinessLogic.Services;
using SistemaEsmeralda.Common.Models;
using SistemaEsmeralda.Entities.Entities;
using SistemaRestaurante.API.Herramientas;
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
        //private readonly IMailService _mailService;
        private readonly AccesoServices _accesoServices;
        private readonly IMapper _mapper;

        public UsuarioController(AccesoServices accesoServices, IMapper mapper/*, IMailService _MailService*/)
        {
            _mapper = mapper;
            _accesoServices = accesoServices;
            //_mailService = _MailService;

        }
        [HttpGet("ValidarReestablecer/{usuario}")]
        public IActionResult ValidarReestablecer(string usuario)
        {

            Random random = new Random();
            int randomNumber = random.Next(100000, 1000000);
            var estado = _accesoServices.ValidarReestablecer(usuario);
            var lista = estado.Data;
            if (lista.Count > 0)
            {
                //var datos = estado.Data as List<tbUsuarios>;
                //var first = datos.FirstOrDefault();
                //_serviciosAcceso.ImplementarCodigo(randomNumber.ToString(), first.Usua_Id);
                //MailData mailData = new MailData();
                //mailData.EmailToId = first.Empl_Correo;
                //mailData.EmailToName = "El Rincon 0511";
                //mailData.EmailSubject = "Codigo de Reestablecimiento de Contraseña";
                //mailData.EmailBody = "Su codigo es:" + randomNumber.ToString();
                //_mailService.SendGmail(mailData);
            }
            return Ok(estado);

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
                Usua_FechaCreacion = item.Usua_FechaCreacion
            };
            var list = _accesoServices.InsertarUsuario(modelo);
            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _accesoServices.obterRol(id);
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
                Usua_FechaCreacion = DateTime.Now
            };
            var list = _accesoServices.EditarUsuario(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            var list = _accesoServices.EliminarUsuario(Usua_Id);
            return Ok(new { success = true, message = list.Message });
        }






    }
}
