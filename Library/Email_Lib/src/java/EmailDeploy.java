import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Mike
 */
public class EmailDeploy {

    private Session session(final String username, final String password,
            boolean auth, boolean tls,
            String host, String port) throws Exception {

        Properties props = new Properties();

        props.put("mail.smtp.auth", auth);
        props.put("mail.smtp.starttls.enable", tls);
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        return session;
    }

    private static void addAttachment(Multipart multipart, BodyPart messageBodyPart, String filename) {
        try {
            multipart.addBodyPart(messageBodyPart);
            messageBodyPart = new MimeBodyPart();
            DataSource source = new FileDataSource(filename);
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(filename);
            multipart.addBodyPart(messageBodyPart);
        } catch (MessagingException ex) {
            Logger.getLogger(EmailDeploy.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void emailSender(final String username, final String password,
            boolean auth, boolean tls,
            String host, String port,
            String from, String to,
            String subject, String content) {

        try {
            EmailConfig config = new EmailConfig(username, password, auth, tls, host, port);
            Session session = session(config.getUsername(), config.getPassword(), config.isAuth(), config.isTls(), config.getHost(), config.getPort());
            Email email = new Email(from, to, subject, content);

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email.getFrom()));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email.getTo()));
            message.setSubject(subject);
            message.setText(content);

            Transport.send(message);
        } catch (Exception ex) {
            Logger.getLogger(EmailDeploy.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void emailSenderAttachFile(final String username, final String password,
            boolean auth, boolean tls,
            String host, String port,
            String from, String to,
            String subject, String content, String filename) {

        try {
            EmailConfig config = new EmailConfig(username, password, auth, tls, host, port);
            Session session = session(config.getUsername(), config.getPassword(), config.isAuth(), config.isTls(), config.getHost(), config.getPort());
            Email email = new Email(from, to, subject, content);

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email.getFrom()));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email.getTo()));
            message.setSentDate(new Date());
            message.setSubject(subject);

            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setText(content);

            Multipart multipart = new MimeMultipart();
            addAttachment(multipart, messageBodyPart, filename);
            message.setContent(multipart);

            Transport.send(message);
        } catch (Exception ex) {
            Logger.getLogger(EmailDeploy.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
