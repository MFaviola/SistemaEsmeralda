﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace SistemaEsmeralda.Entities.Entities
{
    public partial class tbFacturaCompraDetalle
    {
        public int FaCD_Id { get; set; }
        public int? FaCE_Id { get; set; }
        public bool? FaCD_Dif { get; set; }
        public int? Prod_Id { get; set; }
        public int? FaCD_Cantidad { get; set; }

        public virtual tbFacturaCompraEncabezado FaCE { get; set; }
    }
}