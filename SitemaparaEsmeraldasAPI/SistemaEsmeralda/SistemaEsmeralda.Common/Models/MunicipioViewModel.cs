using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
   public class MunicipioViewModel
    {
        public string Muni_Codigo { get; set; }
        public string Muni_Municipio { get; set; }
        public string Depa_Codigo { get; set; }
        public int? Muni_UsuarioCreacion { get; set; }
        public DateTime? Muni_FechaCreacion { get; set; }
        public int? Muni_UsuarioModificacion { get; set; }
        public DateTime? Muni_FechaModificacion { get; set; }

        [NotMapped]
        public string Departamento { get; set; }

        

    }
}
