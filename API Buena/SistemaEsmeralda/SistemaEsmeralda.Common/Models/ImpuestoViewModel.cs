using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
   public class ImpuestoViewModel
    {
        public int Impu_Id { get; set; }
        public decimal? Impu_Impuesto { get; set; }
        public int? Impu_UsuarioCreacion { get; set; }
        public DateTime? Impu_FechaCreacion { get; set; }
        public int? Impu_UsuarioModificacion { get; set; }
        public DateTime? Impu_FechaModificacion { get; set; }
        public bool? Impu_Estado { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }
    }
}
