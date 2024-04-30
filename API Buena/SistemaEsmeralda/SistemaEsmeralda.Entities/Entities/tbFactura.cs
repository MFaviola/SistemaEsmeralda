﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace SistemaEsmeralda.Entities.Entities
{
    public partial class tbFactura
    {
        public tbFactura()
        {
            tbFacturaDetalles = new HashSet<tbFacturaDetalles>();
        }

        public int Fact_Id { get; set; }
        public int Clie_Id { get; set; }
        public int Empl_Id { get; set; }
        public int Mepa_Id { get; set; }
        public int Impu_Id { get; set; }
        public int? Fact_UsuarioCreacion { get; set; }
        public DateTime? Fact_FechaCreacion { get; set; }
        public int? Fact_UsuarioModificacion { get; set; }
        public DateTime? Fact_FechaModificacion { get; set; }
        public bool? Fact_Estado { get; set; }

        public virtual tbClientes Clie { get; set; }
        public virtual tbEmpleados Empl { get; set; }
        public virtual tbUsuarios Fact_UsuarioCreacionNavigation { get; set; }
        public virtual tbUsuarios Fact_UsuarioModificacionNavigation { get; set; }
        public virtual tbImpuestos Impu { get; set; }
        public virtual tbMetodosPago Mepa { get; set; }
        public virtual ICollection<tbFacturaDetalles> tbFacturaDetalles { get; set; }
    }
}