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
                return Ok(new { message = "Error" });
            }
            var bucketName = _configuration["AWS:BucketName"];


            try
            {
                using (var stream = file.OpenReadStream())
                {
                    var fileTransferUtility = new TransferUtility(_s3Client);
                    await fileTransferUtility.UploadAsync(stream, bucketName, file.FileName);
                    return Ok(new { message = "Éxito" });
                }
            }
            catch (AmazonS3Exception e)
            {
                // Log e.ToString() or send it back as a response
                return StatusCode(500, $"AWS error: {e.ToString()}");
            }
            catch (Exception e)
            {
                // General exception catch, if something else went wrong
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
