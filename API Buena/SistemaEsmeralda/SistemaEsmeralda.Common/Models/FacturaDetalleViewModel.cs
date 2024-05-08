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
 

    }
}
