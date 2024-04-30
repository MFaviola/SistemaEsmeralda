using System;
using System.Collections.Generic;
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
    }
}
