﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace SistemaEsmeralda.Entities.Entities
{
    public partial class tbProveedores
    {
        public tbProveedores()
        {
            tbJoyas = new HashSet<tbJoyas>();
            tbMaquillajes = new HashSet<tbMaquillajes>();
        }

        [NotMapped]
        public string Muni_Municipio { get; set; }
        public int Prov_Id { get; set; }
        public string Prov_Proveedor { get; set; }
        public string Prov_Telefono { get; set; }
        public string Muni_Codigo { get; set; }
        public int Prov_UsuarioCreacion { get; set; }
        public DateTime Prov_FechaCreacion { get; set; }
        public int? Prov_UsuarioModificacion { get; set; }
        public DateTime? Prov_FechaModificacion { get; set; }
        public bool? Prov_Estado { get; set; }

        public virtual tbMunicipios Muni_CodigoNavigation { get; set; }
        public virtual tbUsuarios Prov_UsuarioCreacionNavigation { get; set; }
        public virtual tbUsuarios Prov_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbJoyas> tbJoyas { get; set; }
        public virtual ICollection<tbMaquillajes> tbMaquillajes { get; set; }
    }
}