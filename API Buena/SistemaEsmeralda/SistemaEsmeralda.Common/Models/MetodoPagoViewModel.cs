using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
  public  class MetodoPagoViewModel
    {

        public int Mepa_Id { get; set; }
        public string Mepa_Metodo { get; set; }
        public int? Mepa_UsuarioCreacion { get; set; }
        public DateTime? Mepa_FechaCreacion { get; set; }
        public int? Mepa_UsuarioModificacion { get; set; }
        public DateTime? Mepa_FechaModificacion { get; set; }
        public bool? Mepa_Estado { get; set; }
    }
}
