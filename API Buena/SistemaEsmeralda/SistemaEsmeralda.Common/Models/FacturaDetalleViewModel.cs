using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
   public  class FacturaDetalleViewModel
    {


        public int FaxD_Id { get; set; }
        public bool? FaxD_Dif { get; set; }
        public int? Prod_Id { get; set; }
        public int? FaxD_Cantidad { get; set; }
        public int? Fact_Id { get; set; }
        [NotMapped]
        public string? TotalFinal { get; set; }


        [NotMapped]
        public string? Genero { get; set; }

        [NotMapped]
        public string? TotalCompras { get; set; }

        [NotMapped]
        public string? Producto { get; set; }



        [NotMapped]
        public string? NombreProducto { get; set; }



        [NotMapped]
        public string? TotalVendido { get; set; }



        [NotMapped]
        public string? Cantidad { get; set; }

        [NotMapped]
        public string? TipoProducto { get; set; }


        [NotMapped]
        public string? PrecioVenta { get; set; }


        [NotMapped]
        public string? VentasJoyas { get; set; }
        [NotMapped]
        public string? VentasMaquillaje { get; set; }

    }
}
