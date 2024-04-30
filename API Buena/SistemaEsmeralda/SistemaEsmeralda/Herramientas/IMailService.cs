using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaRestaurante.API.Herramientas
{
    public interface IMailService
    {
        bool SendGmail(MailData mailData);
    }
}
