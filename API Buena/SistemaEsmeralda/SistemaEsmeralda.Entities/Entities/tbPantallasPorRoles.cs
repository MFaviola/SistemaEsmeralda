﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace SistemaEsmeralda.Entities.Entities
{
    public partial class tbPantallasPorRoles
    {
        public int Paxr_Id { get; set; }
        public int? Role_Id { get; set; }
        public int? Pant_Id { get; set; }
        [NotMapped]
        public int? Pantalla { get; set; }

        public virtual tbPantallas Pant { get; set; }
        public virtual tbRoles Role { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }
        [NotMapped]
        public string Role_Rol { get; set; }
    }
}