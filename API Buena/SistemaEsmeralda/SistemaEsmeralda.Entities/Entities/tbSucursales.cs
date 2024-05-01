﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace SistemaEsmeralda.Entities.Entities
{
    public partial class tbSucursales
    {
        public tbSucursales()
        {
            tbEmpleados = new HashSet<tbEmpleados>();
        }

        public int Sucu_Id { get; set; }
        public string Sucu_Nombre { get; set; }
        public string Muni_Codigo { get; set; }
        public int? Sucu_UsuarioCreacion { get; set; }
        public DateTime? Sucu_FechaCreacion { get; set; }
        public int? Sucu_UsuarioModificacion { get; set; }
        public DateTime? Sucu_FechaModificacion { get; set; }
        public bool? Sucu_Estado { get; set; }

        public virtual tbMunicipios Muni_CodigoNavigation { get; set; }
        public virtual tbUsuarios Sucu_UsuarioCreacionNavigation { get; set; }
        public virtual tbUsuarios Sucu_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbEmpleados> tbEmpleados { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }
    }
}