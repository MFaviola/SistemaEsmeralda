using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
    public class FacturaCompraViewModel
    {
       public string mepa_Id { get; set; }

        public int sucu_Id { get; set; }

        public int? prov_Id { get; set; }

        public int? faCE_Id { get; set; }
        public int? Usua_Id { get; set; }

        public string? faCD_Dif { get; set; }

        public string? Actualizar { get; set; }

        public string nombreProducto { get; set; }
        public int prod_Id { get; set; }

        public int faCD_Cantidad { get; set; }

        public string? precioCompra { get; set; }

        public string? precioVenta { get; set; }

        public string? precioMayor { get; set; }
    }
}
