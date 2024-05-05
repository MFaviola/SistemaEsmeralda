using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
    public class EmpleadoViewModel
    {
        public int Empl_Id { get; set; }
        public string Empl_Nombre { get; set; }
        public string Empl_Apellido { get; set; }
        public string Empl_Sexo { get; set; }
        public DateTime Empl_FechaNac { get; set; }
        public string Muni_Codigo { get; set; }
        public int Esta_Id { get; set; }
        public int Carg_Id { get; set; }
        public int Sucu_Id { get; set; }
        public int? Empl_UsuarioCreacion { get; set; }
        public DateTime? Empl_FechaCreacion { get; set; }
        public int? Empl_UsuarioModificacion { get; set; }
        public DateTime? Empl_FechaModificacion { get; set; }
        public bool? Empl_Estado { get; set; }

        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }

        [NotMapped]
        public string Muni_Municipio { get; set; }
        [NotMapped]
        public string Esta_EstadoCivil { get; set; }

        [NotMapped]
        public string Empl_Correo { get; set; }


        
    }
}
