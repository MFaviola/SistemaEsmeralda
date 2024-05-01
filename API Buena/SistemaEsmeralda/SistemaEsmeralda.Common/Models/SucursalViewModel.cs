using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
   public class SucursalViewModel
    {
        public int Sucu_Id { get; set; }
        public string Sucu_Nombre { get; set; }
        public string Muni_Codigo { get; set; }
        public int? Sucu_UsuarioCreacion { get; set; }
        public DateTime? Sucu_FechaCreacion { get; set; }
        public int? Sucu_UsuarioModificacion { get; set; }
        public DateTime? Sucu_FechaModificacion { get; set; }
        public bool? Sucu_Estado { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }
    }
}
