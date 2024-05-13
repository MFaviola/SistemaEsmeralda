using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SistemaEsmeralda.BusinessLogic.Services;
using SistemaEsmeralda.Common.Models;
using SistemaEsmeralda.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Amazon.S3;
using Amazon.S3.Transfer;
using Amazon.Runtime;
using System.IO;
using Amazon.S3.Model;
using Microsoft.Extensions.Configuration;

namespace SistemaEsmeralda.API.Controllers
{
    [ApiController]
    [Route("API/[controller]")]
    public class JoyasController : Controller
    {
        private readonly VentasServices _ventasServices;
        private readonly IConfiguration _configuration;
        private readonly IAmazonS3 _s3Client;
        private readonly IMapper _mapper;
        public JoyasController(VentasServices ventasServices, IMapper mapper, IConfiguration configuration)
        {
            _ventasServices = ventasServices;
            _mapper = mapper;
            _configuration = configuration;
            var awsOptions = _configuration.GetSection("AWS");
            _s3Client = new AmazonS3Client(
                awsOptions["AccessKey"],
                awsOptions["SecretKey"],
               Amazon.RegionEndpoint.USEast2 // Adjust your region accordingly
            );
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _ventasServices.ListadoJoyas();
            return Ok(list.Data);
        }

        [HttpGet("AutoCompletado")]
        public IActionResult AutoCompletado()
        {
            var list = _ventasServices.ListadoAutoCompletado();
     
       

            return Ok(list.Data);
        }


        [HttpGet("AutoCompletado1")]
        public IActionResult AutoCompletado1()
        {
            var list = _ventasServices.ListadoAutoCompletado1();
            var drop = list.Data as List<tbJoyas>;
            var rol = drop.Select(x => new SelectListItem
            {
                Text = x.Joya_Nombre,
                Value = x.Joya_Id.ToString()
            }).ToList();

            return Ok(rol.ToList());
        }

        [HttpGet("FiltroCodigo")]
        public IActionResult FiltroCodigo()
        {
            var list = _ventasServices.ListadoJoyaPorCodigo();
     
            return Ok(list.Data);
        }
          


        [HttpPost("Create")]
        public IActionResult Insert(JoyasViewModel item)
        {
            var model = _mapper.Map<tbJoyas>(item);
            var modelo = new tbJoyas()
            {
                Joya_Nombre = item.Joya_Nombre,
                Joya_PrecioCompra = item.Joya_PrecioCompra,
                Joya_PrecioVenta = item.Joya_PrecioVenta,
                Joya_PrecioMayor = item.Joya_PrecioMayor,
                Joya_Imagen = item.Joya_Imagen,
                Joya_Stock = item.Joya_Stock,
                Prov_Id = item.Prov_Id,
                Mate_Id = item.Mate_Id,
                Cate_Id = item.Cate_Id,
                Joya_UsuarioCreacion = 1,
                Joya_FechaCreacion = DateTime.Now

            };
            var list = _ventasServices.InsertarJoya(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpPost("Subir")]
        public async Task<IActionResult> UploadImage(IFormFile file)
        {
     
            var allowedExtensions = new HashSet<string> { ".png", ".jpeg", ".svg", ".jpg", ".gif" };
            var fileExtension = Path.GetExtension(file.FileName).ToLower();
            if (!allowedExtensions.Contains(fileExtension))
            {
                return Ok(new { message = "Error", detail = "Extensión de archivo no permitida." });
            }


            var uploadsFolderPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads");

     
            if (!Directory.Exists(uploadsFolderPath))
            {
                Directory.CreateDirectory(uploadsFolderPath);
            }

         
          

            var filePath = Path.Combine(uploadsFolderPath, file.FileName);

            try
            {
                
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                return Ok(new { message = "Exito" });
            }
            catch (Exception e)
            {

                return StatusCode(500, $"General error: {e.ToString()}");
            }
        }



        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _ventasServices.obterJoya(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(JoyasViewModel item)
        {
            _mapper.Map<tbJoyas>(item);
            var modelo = new tbJoyas()
            {
                Joya_Id = item.Joya_Id,
                Joya_Nombre = item.Joya_Nombre,
                Joya_PrecioCompra = item.Joya_PrecioCompra,
                Joya_PrecioVenta = item.Joya_PrecioVenta,
                Joya_PrecioMayor = item.Joya_PrecioMayor,
                Joya_Imagen = item.Joya_Imagen,
                Joya_Stock = item.Joya_Stock,
                Prov_Id = item.Prov_Id,
                Mate_Id = item.Mate_Id,
                Cate_Id = item.Cate_Id,
                Joya_UsuarioModificacion = 1,
                Joya_FechaModificacion = DateTime.Now
            };
            var list = _ventasServices.EditarJoyas(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            var list = _ventasServices.EliminarJoya(id);
            return Ok(new { success = true, message = list.Message });
        }

    }
}