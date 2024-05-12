﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace SistemaEsmeralda.Entities.Entities
{
    public partial class tbFactura
    {
        public tbFactura()
        {
            tbFacturaDetalles = new HashSet<tbFacturaDetalles>();
        }
        [NotMapped]
        public string FaxD_Id { get; set; }
        [NotMapped]
        public string Prod_Id { get; set; }
        [NotMapped]
        public string Producto { get; set; }
        [NotMapped]
        public string Cantidad { get; set; }
        [NotMapped]
        public string Precio_Unitario { get; set; }
        [NotMapped]
        public string Total { get; set; }
        [NotMapped]
        public string Categoria { get; set; }
        [NotMapped]
        public string Impu_Impuesto { get; set; }
        [NotMapped]
        public string Mepa_Metodo { get; set; }
        [NotMapped]

        public string Clie_DNI { get; set; }

        [NotMapped]
        public string Muni_Municipio { get; set; }
        [NotMapped]

        public string Depa_Departamento { get; set; }
        [NotMapped]
        public string Empl_Nombre { get; set; }


        [NotMapped]
        public string Clie_Nombre { get; set; }
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
        [NotMapped]
        public string FechaModificacion { get; set; }

        [NotMapped]
        public string FechaCreacion { get; set; }
        public virtual tbClientes Clie { get; set; }
        public virtual tbEmpleados Empl { get; set; }
        public virtual tbUsuarios Fact_UsuarioCreacionNavigation { get; set; }
        public virtual tbUsuarios Fact_UsuarioModificacionNavigation { get; set; }
        public virtual tbImpuestos Impu { get; set; }
        public virtual tbMetodosPago Mepa { get; set; }
        public virtual ICollection<tbFacturaDetalles> tbFacturaDetalles { get; set; }
        [NotMapped]
        public string Fact_Finalizado { get; set; }

        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }
    }
}