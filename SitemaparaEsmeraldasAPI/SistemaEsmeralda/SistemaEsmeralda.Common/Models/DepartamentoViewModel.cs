using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
  public  class DepartamentoViewModel
    {
        public string Depa_Codigo { get; set; }
        public string Depa_Departamento { get; set; }
        public int Depa_UsuarioCreacion { get; set; }
        public DateTime Depa_FechaCreacion { get; set; }
        public int? Depa_UsuarioModificacion { get; set; }
        public DateTime? Depa_FechaModificacion { get; set; }

    }
}
