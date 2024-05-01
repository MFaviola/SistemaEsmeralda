using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
   public class CargoViewModel
    {

        public int Carg_Id { get; set; }
        public string Carg_Cargo { get; set; }
        public int Carg_UsuarioCreacion { get; set; }
        public DateTime Carg_FechaCreacion { get; set; }
        public int? Carg_UsuarioModificacion { get; set; }
        public DateTime? Carg_FechaModificacion { get; set; }
        public bool? Carg_Estado { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }




    }
}
