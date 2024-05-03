﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace SistemaEsmeralda.Entities.Entities
{
    public partial class tbMunicipios
    {
        public tbMunicipios()
        {
            tbClientes = new HashSet<tbClientes>();
            tbEmpleados = new HashSet<tbEmpleados>();
            tbProveedores = new HashSet<tbProveedores>();
            tbSucursales = new HashSet<tbSucursales>();
        }
        [NotMapped]
        public string FechaModificacion { get; set; }

        [NotMapped]
        public string FechaCreacion { get; set; }
        public string Muni_Codigo { get; set; }
        public string Muni_Municipio { get; set; }
        public string Depa_Codigo { get; set; }
        public int? Muni_UsuarioCreacion { get; set; }
        public DateTime? Muni_FechaCreacion { get; set; }
        public int? Muni_UsuarioModificacion { get; set; }
        public DateTime? Muni_FechaModificacion { get; set; }
        [NotMapped]
        public string Departamento { get; set; }


        public virtual tbDepartamentos Depa_CodigoNavigation { get; set; }
        public virtual tbUsuarios Muni_UsuarioCreacionNavigation { get; set; }
        public virtual tbUsuarios Muni_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbClientes> tbClientes { get; set; }
        public virtual ICollection<tbEmpleados> tbEmpleados { get; set; }
        public virtual ICollection<tbProveedores> tbProveedores { get; set; }
        public virtual ICollection<tbSucursales> tbSucursales { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }
    }
}