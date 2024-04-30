using MailKit;
using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.Extensions.Options;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaRestaurante.API.Herramientas
{
    public class MailService : IMailService
    {
        private readonly MailSettings _mailSettings;
        public MailService(IOptions<MailSettings> mailSettingsOptions)
        {
            _mailSettings = mailSettingsOptions.Value;
        }


        //public bool SendGmail(MailData mailData)
        //{
        //    MimeMessage mm = new MimeMessage();
        //    mm.From.Add(new MailboxAddress("smtp.gmail.com", "vespinozabenitez@gmail.com"));
        //    using SmtpClient client = new(new ProtocolLogger("smtp.log"));
        //    client.ServerCertificateValidationCallback = (s, c, h, e) => true;
        //    client.Connect("smtp.gmail.com", 587, SecureSocketOptions.StartTls);
        //    client.Authenticate("eduardo.jafet.varela.salinas@gmail.com", "adqj xjhn pltr pgbq"); // app password
        //    client.Send(mail);
        //    client.Disconnect(true);
        //    return true;
        //}
        public bool SendGmail(MailData mailData)
        {
            try
            {
                using (MimeMessage emailMessage = new MimeMessage())
                {
                    MailboxAddress emailFrom = new MailboxAddress(_mailSettings.SenderName, _mailSettings.SenderEmail);
                    emailMessage.From.Add(emailFrom);
                    MailboxAddress emailTo = new MailboxAddress(mailData.EmailToName, mailData.EmailToId);
                    emailMessage.To.Add(emailTo);



                    emailMessage.Subject = mailData.EmailSubject;

                    BodyBuilder emailBodyBuilder = new BodyBuilder();
                    emailBodyBuilder.TextBody = mailData.EmailBody;

                    emailMessage.Body = emailBodyBuilder.ToMessageBody();
                    //this is the SmtpClient from the Mailkit.Net.Smtp namespace, not the System.Net.Mail one
                    using (SmtpClient mailClient = new SmtpClient())
                    {
                        mailClient.Connect("smtp.gmail.com", 587, SecureSocketOptions.StartTls);
                        mailClient.Authenticate("eduardo.jafet.varela.salinas@gmail.com", "adqj xjhn pltr pgbq");
                        mailClient.Send(emailMessage);
                        mailClient.Disconnect(true);
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                // Exception Details
                return false;
            }
        }
    }
}

