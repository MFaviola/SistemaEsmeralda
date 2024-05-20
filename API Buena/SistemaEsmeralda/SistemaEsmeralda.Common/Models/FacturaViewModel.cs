using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
    public class FacturaViewModel
    {


        public string? Pago { get; set; }
        public string? PagoCambio { get; set; }
        public string Sucu_Id { get; set; }
        public string? Actualizar { get; set; }
        public int Faxd_Cantidad { get; set; }
        public string? Faxd_Dif { get; set; }
        public int? Usua_Id { get; set; }
        public string? Prod_Nombre { get; set; }
        public int Fact_Id { get; set; }
        public int Clie_Id { get; set; }
        public int Empl_Id { get; set; }
        public int Mepa_Id { get; set; }
        public int Impu_Id { get; set; }
        public int? Fact_UsuarioCreacion { get; set; }
        public DateTime? Fact_FechaCreacion { get; set; }
        public int? Fact_UsuarioModificacion { get; set; }
        public DateTime? Fact_FechaModificacion { get; set; }
    }
}
