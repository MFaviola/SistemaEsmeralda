using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
   public class EstadoCivilViewModel
    {
        public int Usua_Id { get; set; }
        public int Esta_Id { get; set; }
        public string Esta_EstadoCivil { get; set; }
        public int? Esta_UsuarioCreacion { get; set; }
        public DateTime? Esta_FechaCreacion { get; set; }
        public int? Esta_UsuarioModificacion { get; set; }
        public DateTime? Esta_FechaModificacion { get; set; }
        public bool? Esta_Estado { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }

    }
}
