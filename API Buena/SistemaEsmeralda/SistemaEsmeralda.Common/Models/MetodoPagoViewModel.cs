using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
  public  class MetodoPagoViewModel
    {

        public int Usua_ID { get; set; }
        public int Mepa_Id { get; set; }
        public string Mepa_Metodo { get; set; }
        public int? Mepa_UsuarioCreacion { get; set; }
        public DateTime? Mepa_FechaCreacion { get; set; }
        public int? Mepa_UsuarioModificacion { get; set; }
        public DateTime? Mepa_FechaModificacion { get; set; }
        public bool? Mepa_Estado { get; set; }

        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }
    }
}
