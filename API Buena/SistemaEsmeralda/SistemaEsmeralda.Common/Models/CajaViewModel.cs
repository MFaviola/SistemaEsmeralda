using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
    public class CajaViewModel
    {
        public int caja_UsuarioCierre { get; set; }
        public decimal caja_MontoSistema { get; set; }
        public decimal caja_MontoFinal { get; set; }
        public decimal caja_MontoInicial { get; set; }
        public string caja_Observacion { get; set; }
        public int caja_Id { get; set; }

        public int caja_UsuarioApertura { get; set; }
        public int Sucu_Id { get; set; }



    }
}
