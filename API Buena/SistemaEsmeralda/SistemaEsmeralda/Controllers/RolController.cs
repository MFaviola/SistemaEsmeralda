using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SistemaEsmeralda.API.Clases;
using SistemaEsmeralda.BusinessLogic;
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
    public class RolController : Controller
    {
        private readonly AccesoServices  _accesoServices;

        private readonly IMapper _mapper;
        public RolController(AccesoServices  accesoServices, IMapper mapper)
        {
            _accesoServices = accesoServices;
            _mapper = mapper;
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _accesoServices.ListadoRol();
            return Ok(list.Data);
        }

        [HttpGet("DropDown")]
        public IActionResult List()
        {
            var list = _accesoServices.ListadoRol();
            var drop = list.Data as List<tbRoles>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.Role_Rol,
                Value = x.Role_Id.ToString()
            }).ToList();


            rol.Insert(0, new SelectListItem { Text = "-- SELECCIONE --", Value = "0" });
            return Ok(rol.ToList());
        }





        [HttpPost("Create")]
        
            public IActionResult Insert([FromBody] FormData formData)
            {


            var msj = new ServiceResult();
            string txtRol = formData.txtRol;
            List<int> pantallasSeleccionadas = formData.pantallasSeleccionadas;

            var modelo = new tbRoles()
            {
                Role_Rol = txtRol,
                Role_UsuarioCreacion = 1, 
                Role_FechaCreacion = DateTime.Now
            };
            var list = _accesoServices.InsertarRol(modelo);


            int idRol = Int32.Parse(list);

            foreach (var pantalla in pantallasSeleccionadas)
            {
                var modelo2 = new tbPantallasXRoles()
                {
                    Pant_Id = pantalla,
                    Role_Id = idRol,
                };

                 msj = _accesoServices.InsertarRolesPantalla(modelo2);
                
            }


            return Ok(new { success = true, message = msj.Message });
        }



        [HttpGet("Fill/{id}")]
        public IActionResult Llenar(int id)
        {
            var list = _accesoServices.obterRolesPantalla(id);
            if (list.Success)
            {
                return Ok(list.Data);
            }
            else
            {
                return BadRequest(list.Message);
            }
        }





        [HttpPut("Edit")]
        public IActionResult Update([FromBody] FormData formData)
        {

            var msj = new ServiceResult();
            List<int> pantallasSeleccionadas = formData.pantallasSeleccionadas;


            var modelo = new tbRoles()
            {
                Role_Id = formData.Rol_Id,
                Role_Rol = formData.txtRol,
          
            };
            var list = _accesoServices.EditarRol(modelo);

            var idRol = formData.Rol_Id;

            var res = _accesoServices.EliminarRolesPantalla(idRol.ToString());

            foreach (var pantalla in pantallasSeleccionadas)
            {
                var modelo2 = new tbPantallasXRoles()
                {
                    Pant_Id = pantalla,
                    Role_Id = idRol,
                };

                msj = _accesoServices.InsertarRolesPantalla(modelo2);

            }


            return Ok(new { success = true, message = msj.Message });

        }








        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            var list = _accesoServices.EliminarRolesPantalla(id);
            var list2 = _accesoServices.EliminarRol(id);

            return Ok(new { success = true, message = list2.Message });
        }





    }
}
