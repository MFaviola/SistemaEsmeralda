﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace SistemaEsmeralda.Entities.Entities
{
    public partial class tbEstadosCiviles
    {
        public tbEstadosCiviles()
        {
            tbClientes = new HashSet<tbClientes>();
            tbEmpleados = new HashSet<tbEmpleados>();
        }

        public int Esta_Id { get; set; }
        public string Esta_EstadoCivil { get; set; }
        public int? Esta_UsuarioCreacion { get; set; }
        public DateTime? Esta_FechaCreacion { get; set; }
        public int? Esta_UsuarioModificacion { get; set; }
        public DateTime? Esta_FechaModificacion { get; set; }
        public bool? Esta_Estado { get; set; }

        public virtual tbUsuarios Esta_UsuarioCreacionNavigation { get; set; }
        public virtual tbUsuarios Esta_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbClientes> tbClientes { get; set; }
        public virtual ICollection<tbEmpleados> tbEmpleados { get; set; }
    }
}