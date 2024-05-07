using Amazon.S3;
using Amazon.S3.Transfer;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SistemaEsmeralda.BusinessLogic.Services;
using SistemaEsmeralda.Common.Models;
using SistemaEsmeralda.Entities.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaEsmeralda.API.Controllers
{
    [ApiController]
    [Route("API/[controller]")]
    public class MaquillajeController : Controller
    {
        private readonly VentasServices _ventasServices;
        private readonly IConfiguration _configuration;
        private readonly IAmazonS3 _s3Client;
        private readonly IMapper _mapper;
        public MaquillajeController(VentasServices ventasServices, IMapper mapper, IConfiguration configuration)
        {
            _ventasServices = ventasServices;
            _mapper = mapper;
            _configuration = configuration;
            var awsOptions = _configuration.GetSection("AWS");
            _s3Client = new AmazonS3Client(
                awsOptions["AccessKey"],
                awsOptions["SecretKey"],
               Amazon.RegionEndpoint.USEast2
            );
        }

        [HttpPost("Subir")]
        public async Task<IActionResult> UploadImage(IFormFile file)
        {
            // Verificación de la extensión del archivo
            var allowedExtensions = new HashSet<string> { ".png", ".jpeg", ".svg", ".jpg", ".gif" };
            var fileExtension = Path.GetExtension(file.FileName).ToLower();
            if (!allowedExtensions.Contains(fileExtension))
            {
                return Ok(new { message = "Error", detail = "Extensión de archivo no permitida." });
            }

            // Define la carpeta de destino dentro de tu proyecto
            var uploadsFolderPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads");

            // Crea la carpeta si no existe
            if (!Directory.Exists(uploadsFolderPath))
            {
                Directory.CreateDirectory(uploadsFolderPath);
            }

            // Genera un nombre único para el archivo


            // Crea la ruta completa del archivo en el servidor
            var filePath = Path.Combine(uploadsFolderPath, file.FileName);

            try
            {
                // Copia el archivo a la carpeta especificada
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                return Ok(new { message = "Exito" });
            }
            catch (Exception e)
            {
                // Si ocurre un error, captura la excepción y devuélvela
                return StatusCode(500, $"General error: {e.ToString()}");
            }
        }

        [HttpGet("List")]
        public IActionResult Index()
        {
            var list = _ventasServices.ListadoMaquillaje();
            return Ok(list.Data);
        }






        [HttpPost("Create")]
        public IActionResult Insert(MaquillajeViewModel item)
        {
            var model = _mapper.Map<tbMaquillajes>(item);
            var modelo = new tbMaquillajes()
            {
                Maqu_Nombre = item.Maqu_Nombre,
                Maqu_PrecioCompra = item.Maqu_PrecioCompra,
                Maqu_PrecioVenta = item.Maqu_PrecioVenta,
                Maqu_PrecioMayor = item.Maqu_PrecioMayor,
                Maqu_Imagen = item.Maqu_Imagen,
                Maqu_Stock = item.Maqu_Stock,
                Prov_Id = item.Prov_Id,
                Marc_Id = item.Marc_Id,
                Maqu_UsuarioCreacion = 1,
                Maqu_FechaCreacion = DateTime.Now

            };
            var list = _ventasServices.InsertarMaquillaje(modelo);
            return Ok(new { success = true, message = list.Message });
        }




        [HttpGet("Fill/{id}")]

        public IActionResult Llenar(int id)
        {

            var list = _ventasServices.obterMaquillaje(id);
            return Json(list.Data);
        }


        [HttpPut("Edit")]
        public IActionResult Update(MaquillajeViewModel item)
        {
            _mapper.Map<tbMaquillajes>(item);
            var modelo = new tbMaquillajes()
            {
                Maqu_Id = item.Maqu_Id,
                Maqu_Nombre = item.Maqu_Nombre,
                Maqu_PrecioCompra = item.Maqu_PrecioCompra,
                Maqu_PrecioVenta = item.Maqu_PrecioVenta,
                Maqu_PrecioMayor = item.Maqu_PrecioMayor,
                Maqu_Imagen = item.Maqu_Imagen,
                Maqu_Stock = item.Maqu_Stock,
                Prov_Id = item.Prov_Id,
                Marc_Id = item.Marc_Id,
                Maqu_UsuarioModificacion = 1,
                Maqu_FechaModificacion = DateTime.Now
            };
            var list = _ventasServices.EditarMaquillaje(modelo);
            return Ok(new { success = true, message = list.Message });
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult Delete(string id)
        {
            var list = _ventasServices.EliminarMaquillaje(id);
            return Ok(new { success = true, message = list.Message });
        }
    }
}
