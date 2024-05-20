using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
  public  class DepartamentoViewModel
    {
        public int Usua_Id { get; set; }
        public string Depa_Codigo { get; set; }
        public string Depa_Departamento { get; set; }
        public int Depa_UsuarioCreacion { get; set; }
        public DateTime Depa_FechaCreacion { get; set; }
        public int? Depa_UsuarioModificacion { get; set; }
        public DateTime? Depa_FechaModificacion { get; set; }

        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }

    }
}
