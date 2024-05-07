using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
    public class ClienteViewModel
    {
        [NotMapped]
        public string Clie_DNI { get; set; }
        public int Clie_Id { get; set; }
        public string Clie_Nombre { get; set; }
        public string Clie_Apellido { get; set; }
        public DateTime Clie_FechaNac { get; set; }
        public string Clie_Sexo { get; set; }
        public string Muni_Codigo { get; set; }
        public int Esta_Id { get; set; }
        public int? Clie_UsuarioCreacion { get; set; }
        public DateTime? Clie_FechaCreacion { get; set; }
        public int? Clie_UsuarioModificacion { get; set; }
        public DateTime? Clie_FechaModificacion { get; set; }
        public bool? Clie_Estado { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }


        [NotMapped]
        public string Muni_Municipio { get; set; }
        [NotMapped]
        public string Esta_EstadoCivil { get; set; }
    }
}
