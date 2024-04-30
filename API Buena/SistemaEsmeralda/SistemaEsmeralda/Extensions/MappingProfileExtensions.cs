using AutoMapper;
using SistemaEsmeralda.Common.Models;
using SistemaEsmeralda.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaEsmeralda.API.Extensions
{
    public class MappingProfileExtensions: Profile
    {
        public MappingProfileExtensions()
        {
            CreateMap<DepartamentoViewModel, tbDepartamentos>().ReverseMap();
            CreateMap<MunicipioViewModel, tbMunicipios>().ReverseMap();
            CreateMap<CargoViewModel, tbCargos>().ReverseMap();
            CreateMap<CategoriaViewModel, tbCategorias>().ReverseMap();
            CreateMap<EstadoCivilViewModel, tbEstadosCiviles>().ReverseMap();
            CreateMap<ImpuestoViewModel, tbImpuestos>().ReverseMap();
            CreateMap<MarcaViewModel, tbMarcas>().ReverseMap();
            CreateMap<MaterialViewModel, tbMateriales>().ReverseMap();
            CreateMap<MetodoPagoViewModel, tbMetodosPago>().ReverseMap();
            CreateMap<ClienteViewModel, tbClientes>().ReverseMap();










        }
    }
}
