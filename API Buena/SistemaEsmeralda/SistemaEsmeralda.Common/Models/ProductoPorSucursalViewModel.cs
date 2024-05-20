using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
    public class ProductoPorSucursalViewModel
    {
        public int Usua_Id { get; set; }
        public string FacturaEncabezado { get; set; }
        public int Prxs_Id { get; set; }

        public int Pren_Id { get; set; }
        public string? Prxs_Dif { get; set; }

        public string? Prod_Nombre { get; set; }
        public int? Prod_Id { get; set; }
        public int? Prsx_Stock { get; set; }
        public int? Sucu_Id { get; set; }
    }
}
