using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SistemaEsmeralda.BusinessLogic.Services;
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
        private readonly IMailService _mailService;
        private readonly AccesoServices _accesoServices;
        private readonly IMapper _mapper;

        public UsuarioController(AccesoServices accesoServices, IMapper mapper, IMailService _MailService)
        {
            _mapper = mapper;
            _accesoServices = accesoServices;
            _mailService = _MailService;

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
    }
}
