﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace SistemaEsmeralda.Entities.Entities
{
    public partial class tbUsuarios
    {
        public tbUsuarios()
        {
            tbCargosCarg_UsuarioCreacionNavigation = new HashSet<tbCargos>();
            tbCargosCarg_UsuarioModificacionNavigation = new HashSet<tbCargos>();
            tbCategoriasCate_UsuarioCreacionNavigation = new HashSet<tbCategorias>();
            tbCategoriasCate_UsuarioModificacionNavigation = new HashSet<tbCategorias>();
            tbClientesClie_UsuarioCreacionNavigation = new HashSet<tbClientes>();
            tbClientesClie_UsuarioModificacionNavigation = new HashSet<tbClientes>();
            tbDepartamentosDepa_UsuarioCreacionNavigation = new HashSet<tbDepartamentos>();
            tbDepartamentosDepa_UsuarioModificacionNavigation = new HashSet<tbDepartamentos>();
            tbEmpleadosEmpl_UsuarioCreacionNavigation = new HashSet<tbEmpleados>();
            tbEmpleadosEmpl_UsuarioModificacionNavigation = new HashSet<tbEmpleados>();
            tbEstadosCivilesEsta_UsuarioCreacionNavigation = new HashSet<tbEstadosCiviles>();
            tbEstadosCivilesEsta_UsuarioModificacionNavigation = new HashSet<tbEstadosCiviles>();
            tbFacturaFact_UsuarioCreacionNavigation = new HashSet<tbFactura>();
            tbFacturaFact_UsuarioModificacionNavigation = new HashSet<tbFactura>();
            tbImpuestosImpu_UsuarioCreacionNavigation = new HashSet<tbImpuestos>();
            tbImpuestosImpu_UsuarioModificacionNavigation = new HashSet<tbImpuestos>();
            tbJoyasJoya_UsuarioCreacionNavigation = new HashSet<tbJoyas>();
            tbJoyasJoya_UsuarioModificacionNavigation = new HashSet<tbJoyas>();
            tbMaquillajesMaqu_UsuarioCreacionNavigation = new HashSet<tbMaquillajes>();
            tbMaquillajesMaqu_UsuarioModificacionNavigation = new HashSet<tbMaquillajes>();
            tbMarcasMarc_UsuarioCreacionNavigation = new HashSet<tbMarcas>();
            tbMarcasMarc_UsuarioModificacionNavigation = new HashSet<tbMarcas>();
            tbMaterialesMate_UsuarioCreacionNavigation = new HashSet<tbMateriales>();
            tbMaterialesMate_UsuarioModificacionNavigation = new HashSet<tbMateriales>();
            tbMetodosPagoMepa_UsuarioCreacionNavigation = new HashSet<tbMetodosPago>();
            tbMetodosPagoMepa_UsuarioModificacionNavigation = new HashSet<tbMetodosPago>();
            tbMunicipiosMuni_UsuarioCreacionNavigation = new HashSet<tbMunicipios>();
            tbMunicipiosMuni_UsuarioModificacionNavigation = new HashSet<tbMunicipios>();
            tbPantallasPant_UsuarioCreacionNavigation = new HashSet<tbPantallas>();
            tbPantallasPant_UsuarioModificacionNavigation = new HashSet<tbPantallas>();
            tbProveedoresProv_UsuarioCreacionNavigation = new HashSet<tbProveedores>();
            tbProveedoresProv_UsuarioModificacionNavigation = new HashSet<tbProveedores>();
            tbRolesRole_UsuarioCreacionNavigation = new HashSet<tbRoles>();
            tbRolesRole_UsuarioModificacionNavigation = new HashSet<tbRoles>();
            tbSucursalesSucu_UsuarioCreacionNavigation = new HashSet<tbSucursales>();
            tbSucursalesSucu_UsuarioModificacionNavigation = new HashSet<tbSucursales>();
        }
        [NotMapped]
        public string Sucu_Nombre { get; set; }
        [NotMapped]
        public string Sucu_Id { get; set; }
        [NotMapped]
        public string Role_Rol { get; set; }
        [NotMapped]
        public string Usua_Administradores { get; set; }
        [NotMapped]


        public string Empl_Nombre { get; set; }
        public int Usua_Id { get; set; }
        public string Usua_Usuario { get; set; }
        public string Usua_Contraseña { get; set; }
        public bool Usua_Administrador { get; set; }
        public int Empl_Id { get; set; }
        public int Role_Id { get; set; }
        public int? Usua_UsuarioCreacion { get; set; }
        public DateTime? Usua_FechaCreacion { get; set; }
        public int? Usua_UsuarioModificacion { get; set; }
        public DateTime? Usua_FechaModificacion { get; set; }

        [NotMapped]
        public string FechaModificacion { get; set; }

        [NotMapped]
        public string FechaCreacion { get; set; }


        [NotMapped]
        public string pant_descripcion { get; set; }

        [NotMapped]
        public string empl_Correo { get; set; }
        public virtual ICollection<tbCargos> tbCargosCarg_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbCargos> tbCargosCarg_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbCategorias> tbCategoriasCate_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbCategorias> tbCategoriasCate_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbClientes> tbClientesClie_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbClientes> tbClientesClie_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbDepartamentos> tbDepartamentosDepa_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbDepartamentos> tbDepartamentosDepa_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbEmpleados> tbEmpleadosEmpl_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbEmpleados> tbEmpleadosEmpl_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbEstadosCiviles> tbEstadosCivilesEsta_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbEstadosCiviles> tbEstadosCivilesEsta_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbFactura> tbFacturaFact_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbFactura> tbFacturaFact_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbImpuestos> tbImpuestosImpu_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbImpuestos> tbImpuestosImpu_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbJoyas> tbJoyasJoya_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbJoyas> tbJoyasJoya_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbMaquillajes> tbMaquillajesMaqu_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbMaquillajes> tbMaquillajesMaqu_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbMarcas> tbMarcasMarc_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbMarcas> tbMarcasMarc_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbMateriales> tbMaterialesMate_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbMateriales> tbMaterialesMate_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbMetodosPago> tbMetodosPagoMepa_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbMetodosPago> tbMetodosPagoMepa_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbMunicipios> tbMunicipiosMuni_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbMunicipios> tbMunicipiosMuni_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbPantallas> tbPantallasPant_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbPantallas> tbPantallasPant_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbProveedores> tbProveedoresProv_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbProveedores> tbProveedoresProv_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbRoles> tbRolesRole_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbRoles> tbRolesRole_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbSucursales> tbSucursalesSucu_UsuarioCreacionNavigation { get; set; }
        public virtual ICollection<tbSucursales> tbSucursalesSucu_UsuarioModificacionNavigation { get; set; }


        [NotMapped]
        public string UsuarioCreacion { get; set; }

        [NotMapped]
        public string UsuarioModificacion { get; set; }
    }
}