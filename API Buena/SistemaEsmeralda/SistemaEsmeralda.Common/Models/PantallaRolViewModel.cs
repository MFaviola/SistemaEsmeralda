using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
   public  class PantallaRolViewModel
    {
        public int Usua_ID { get; set; }
        public int Paxr_Id { get; set; }
        public int? Role_Id { get; set; }
        public int? Pant_Id { get; set; }
        [NotMapped]
        public int? Pantalla { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }
        [NotMapped]
        public string Role_Rol { get; set; }

    }
}
