﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaEsmeralda.Common.Models
{
  public   class MaterialViewModel
    {


        public int Mate_Id { get; set; }
        public string Mate_Material { get; set; }
        public int? Mate_UsuarioCreacion { get; set; }
        public DateTime? Mate_FechaCreacion { get; set; }
        public int? Mate_UsuarioModificacion { get; set; }
        public DateTime? Mate_FechaModificacion { get; set; }
        public bool? Mate_Estado { get; set; }

    }
}
