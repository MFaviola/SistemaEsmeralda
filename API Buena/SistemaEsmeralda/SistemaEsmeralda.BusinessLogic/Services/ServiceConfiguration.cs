using Microsoft.Extensions.DependencyInjection;
using SistemaEsmeralda.DataAccess;
using SistemaEsmeralda.DataAccess.Repository;
using SistemaEsmeralda.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Text;

namespace SistemaEsmeralda.BusinessLogic.Services
{
    public static class ServiceConfiguration
    {
        public static void DataAccess(this IServiceCollection service, string conn)
        {
            service.AddScoped<DepartamentosRepository>();
            service.AddScoped<MunicipioRepository>();
            service.AddScoped<CategoriaRepository>();
            service.AddScoped<CargosRepository>();
            service.AddScoped<EstadoCivilRepository>();
            service.AddScoped<ImpuestoRepository>();
            service.AddScoped<MarcaRepository>();
            service.AddScoped<MateriaRepositorycs>();
            service.AddScoped<MetodoPagoRepository>();
            service.AddScoped<ClienteRepository>();
            service.AddScoped<EmpleadoRepository>();
            service.AddScoped<ProveedorRepository>();












            SistemaEsmeraldaContex.BuildConnectionString(conn);
        }
        public static void BusinessLogic(this IServiceCollection service)
        {
            service.AddScoped<GeneralServices>();

        }
    }
}
