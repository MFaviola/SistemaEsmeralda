using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
   public class CategoriaViewModel
    {
        public int Usua_Id { get; set; }
        public int Cate_Id { get; set; }
        public string Cate_Categoria { get; set; }
        public int? Cate_UsuarioCreacion { get; set; }
        public DateTime? Cate_FechaCreacion { get; set; }
        public int? Cate_UsuarioModificacion { get; set; }
        public DateTime? Cate_FechaModificacion { get; set; }
        public bool? Cate_Estado { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }


    }
}
