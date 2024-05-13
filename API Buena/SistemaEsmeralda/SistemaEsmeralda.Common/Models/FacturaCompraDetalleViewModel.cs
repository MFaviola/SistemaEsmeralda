using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
    public class FacturaCompraDetalleViewModel
    {
        public int FaCD_Id { get; set; }
        public int? FaCE_Id { get; set; }
        public bool? FaCD_Dif { get; set; }
        public int? Prod_Id { get; set; }
        public string NombreProducto { get; set; }
        public int? FaCD_Cantidad { get; set; }

        public string NombreProveedor { get; set; }

        public string Prov_Id { get; set; }
        public string mepa_Metodo {get; set;}

        public string faCE_Finalizada { get; set; }
    }
}
