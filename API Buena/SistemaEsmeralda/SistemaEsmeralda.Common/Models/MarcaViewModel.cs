using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
   public class MarcaViewModel
    {
        public int Marc_Id { get; set; }
        public string Marc_Marca { get; set; }
        public int? Marc_UsuarioCreacion { get; set; }
        public DateTime? Marc_FechaCreacion { get; set; }
        public int? Marc_UsuarioModificacion { get; set; }
        public DateTime? Marc_FechaModificacion { get; set; }
        public bool? Marc_Estado { get; set; }
    }
}
