﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
    public class FacturaCompraViewModel
    {
        public int FaCE_Id { get; set; }
        public int? Prov_Id { get; set; }
        public int? Mepa_Id { get; set; }
        public DateTime? FaCE_fechafinalizacion { get; set; }
        public int? FeCE_UsuarioCreacion { get; set; }
        public DateTime? FaCE_FechaCreacion { get; set; }
        public int? FaCE_UsuarioModificacion { get; set; }
        public DateTime? FaCE_FechaModificacion { get; set; }
        [NotMapped]
        public string Prov_Proveedor { get; set; }
        [NotMapped]
        public string Mepa_Metodo { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }
        [NotMapped]
        public string UsuarioModificacion { get; set; }
        [NotMapped]
        public int FaCD_Id { get; set; }
        [NotMapped]
        public bool? FaCD_Dif { get; set; }
        [NotMapped]
        public int? Prod_Id { get; set; }
        [NotMapped]
        public string NombreProducto { get; set; }
        [NotMapped]
        public int? FaCD_Cantidad { get; set; }
        [NotMapped]
        public decimal PrecioCompra { get; set; }
        [NotMapped]
        public decimal PrecioVenta { get; set; }
        [NotMapped]
        public decimal PrecioMayorista { get; set; }

    }
}
