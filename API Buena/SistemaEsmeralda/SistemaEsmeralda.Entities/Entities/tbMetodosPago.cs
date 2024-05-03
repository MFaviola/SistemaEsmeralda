﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace SistemaEsmeralda.Entities.Entities
{
    public partial class tbMetodosPago
    {
        public tbMetodosPago()
        {
            tbFactura = new HashSet<tbFactura>();
        }

        public int Mepa_Id { get; set; }
        public string Mepa_Metodo { get; set; }
        public int? Mepa_UsuarioCreacion { get; set; }
        public DateTime? Mepa_FechaCreacion { get; set; }
        public int? Mepa_UsuarioModificacion { get; set; }
        public DateTime? Mepa_FechaModificacion { get; set; }
        public bool? Mepa_Estado { get; set; }
        [NotMapped]
        public string FechaModificacion { get; set; }

        [NotMapped]
        public string FechaCreacion { get; set; }
        public virtual tbUsuarios Mepa_UsuarioCreacionNavigation { get; set; }
        public virtual tbUsuarios Mepa_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbFactura> tbFactura { get; set; }

        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }
    }
}