using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
   public class JoyasViewModel
    {
        public int Usua_Id { get; set; }
        public int Joya_Stock { get; set; }
        public int Joya_Id { get; set; }
        public string Joya_Nombre { get; set; }
        public decimal Joya_PrecioCompra { get; set; }
        public decimal Joya_PrecioVenta { get; set; }
        public decimal Joya_PrecioMayor { get; set; }
        public string Joya_Imagen { get; set; }
        public int Prov_Id { get; set; }
        public int Mate_Id { get; set; }
        public int Cate_Id { get; set; }
        public int? Joya_UsuarioCreacion { get; set; }
        public DateTime? Joya_FechaCreacion { get; set; }
        public int? Joya_UsuarioModificacion { get; set; }
        public DateTime? Joya_FechaModificacion { get; set; }
        public bool? Joya_Estado { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }
    }
}
