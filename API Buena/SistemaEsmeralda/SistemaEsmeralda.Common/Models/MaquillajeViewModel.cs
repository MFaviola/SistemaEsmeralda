using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
    public class MaquillajeViewModel
    {
        public int Usua_ID { get; set; }
        public int Maqu_Stock { get; set; }
        public int Maqu_Id { get; set; }
        public string Maqu_Nombre { get; set; }
        public decimal Maqu_PrecioCompra { get; set; }
        public decimal Maqu_PrecioVenta { get; set; }
        public decimal Maqu_PrecioMayor { get; set; }
        public string Maqu_Imagen { get; set; }
        public int Prov_Id { get; set; }
        public int Marc_Id { get; set; }
        public int? Maqu_UsuarioCreacion { get; set; }
        public DateTime? Maqu_FechaCreacion { get; set; }
        public int? Maqu_UsuarioModificacion { get; set; }
        public DateTime? Maqu_FechaModificacion { get; set; }
        public bool? Maqu_Estado { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }
    }
}
