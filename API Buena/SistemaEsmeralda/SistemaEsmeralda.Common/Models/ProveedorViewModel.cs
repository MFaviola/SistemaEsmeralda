using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
   public class ProveedorViewModel
    {
        public int Prov_Id { get; set; }
        public string Prov_Proveedor { get; set; }
        public string Prov_Telefono { get; set; }
        public string Muni_Codigo { get; set; }
        public int Prov_UsuarioCreacion { get; set; }
        public DateTime Prov_FechaCreacion { get; set; }
        public int? Prov_UsuarioModificacion { get; set; }
        public DateTime? Prov_FechaModificacion { get; set; }
        public bool? Prov_Estado { get; set; }
    }
}
