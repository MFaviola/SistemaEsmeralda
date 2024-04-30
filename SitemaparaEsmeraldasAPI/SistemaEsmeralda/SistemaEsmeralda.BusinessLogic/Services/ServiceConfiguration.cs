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



            SistemaEsmeraldaContex.BuildConnectionString(conn);
        }
        public static void BusinessLogic(this IServiceCollection service)
        {
            service.AddScoped<GeneralServices>();

        }
    }
}
