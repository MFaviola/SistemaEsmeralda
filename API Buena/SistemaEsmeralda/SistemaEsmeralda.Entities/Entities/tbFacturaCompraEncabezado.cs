﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace SistemaEsmeralda.Entities.Entities
{
    public partial class tbFacturaCompraEncabezado
    {
        public tbFacturaCompraEncabezado()
        {
            tbFacturaCompraDetalle = new HashSet<tbFacturaCompraDetalle>();
        }
        [NotMapped]
        public int? Usua_Id { get; set; }
        [NotMapped]
        public string? Actualizar { get; set; }
        public int FaCE_Id { get; set; }
        public int? Prov_Id { get; set; }
        public int? Mepa_Id { get; set; }
        
        public DateTime? FaCE_fechafinalizacion { get; set; }
        public int? FeCE_UsuarioCreacion { get; set; }
        public DateTime? FaCE_FechaCreacion { get; set; }
        public int? FaCE_UsuarioModificacion { get; set; }
        public DateTime? FaCE_FechaModificacion { get; set; }
        [NotMapped]
        public int? faCE_Id { get; set; }
        [NotMapped]
        public int? prov_Id { get; set; }
        [NotMapped]
        public int? mepa_Id { get; set; }
        [NotMapped]
        public string prov_Proveedor { get; set; }
        [NotMapped]
        public string mepa_Metodo { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }
        [NotMapped]
        public string UsuarioModificacion { get; set; }
        [NotMapped]
        public int faCD_Id { get; set; }
        [NotMapped]
        public string? faCD_Dif { get; set; }
        [NotMapped]
        public int? prod_Id { get; set; }
        [NotMapped]
        public string nombreProducto { get; set; }
        [NotMapped]
        public int? faCD_Cantidad { get; set; }
        [NotMapped]
        public string precioCompra { get; set; }
        [NotMapped]
        public string precioVenta { get; set; }
        [NotMapped]
        public string precioMayorista { get; set; }
        [NotMapped]
        public int sucu_Id { get; set; }
        public virtual tbMetodosPago Mepa { get; set; }
        public virtual tbProveedores Prov { get; set; }
        public virtual ICollection<tbFacturaCompraDetalle> tbFacturaCompraDetalle { get; set; }
    }
}