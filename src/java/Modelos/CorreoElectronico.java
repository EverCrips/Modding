//Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.
package Modelos;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import org.apache.commons.lang3.RandomStringUtils;

/**
 *
 * @author EverCripsMSI
 */
public class CorreoElectronico {
    
    //ENVIAR CORREO AL CLIENTE 
    public boolean enviarCorreoCliente(String mensaje, String para, String asunto2){
        boolean enviado=false;
        String clave="qwerty123456qwerty";
        String emisor="moddingmafires@hotmail.com";
        String destinatario=para;
        String asunto = asunto2;
        try{
            
            String host="smtp-mail.outlook.com";
            Properties prop = System.getProperties();
            prop.put("mail.smtp.starttls.enable","true");
            prop.put("mail.smtp.host", host);
            prop.put("mail.smtp.user",emisor);
            prop.put("mail.smtp.password",clave);
            prop.put("mail.smtp.port",587);
            prop.put("mail.smtp.auth","true");
            
            Session sesion = Session.getDefaultInstance(prop,null);
            
            MimeMessage message = new MimeMessage(sesion);
            
            message.setFrom(new InternetAddress(emisor));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            
            /*BodyPart texto = new MimeBodyPart();
            texto.setText(mensaje);
            
            BodyPart adjunto = new MimeBodyPart();
            adjunto.setDataHandler(new DataHandler(new FileDataSource(recurso)));
            adjunto.setFileName(recurso);  
            
            MimeMultipart multiParte = new MimeMultipart();

            multiParte.addBodyPart(texto);
            multiParte.addBodyPart(adjunto);
            
            message.setSubject(asunto);
            message.setContent(multiParte);*/
            
            message.setSubject(asunto);
            message.setText(mensaje);
            
            Transport transport = sesion.getTransport("smtp");
            
            transport.connect(host, emisor, clave);
            
            transport.sendMessage(message, message.getAllRecipients());
            
            transport.close();
            
            enviado = true;
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        return enviado;
    }
    
    //ENVIAR CORREO AL ADMINISTRADOR 
    public boolean enviarCorreoAdministracion(String mensaje, String asunto2){
        boolean enviado=false;
        String clave="qwerty123456qwerty";
        String emisor="moddingmafires@hotmail.com";
        String destinatario="moddingmafires@hotmail.com";
        String asunto = asunto2;
        try{
            
            String host="smtp-mail.outlook.com";
            Properties prop = System.getProperties();
            prop.put("mail.smtp.starttls.enable","true");
            prop.put("mail.smtp.host", host);
            prop.put("mail.smtp.user",emisor);
            prop.put("mail.smtp.password",clave);
            prop.put("mail.smtp.port",587);
            prop.put("mail.smtp.auth","true");
            
            Session sesion = Session.getDefaultInstance(prop,null);
            
            MimeMessage message = new MimeMessage(sesion);
            
            message.setFrom(new InternetAddress(emisor));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            
            /*BodyPart texto = new MimeBodyPart();
            texto.setText(mensaje);
            
            BodyPart adjunto = new MimeBodyPart();
            adjunto.setDataHandler(new DataHandler(new FileDataSource(recurso)));
            adjunto.setFileName(recurso);  
            
            MimeMultipart multiParte = new MimeMultipart();

            multiParte.addBodyPart(texto);
            multiParte.addBodyPart(adjunto);
            
            message.setSubject(asunto);
            message.setContent(multiParte);*/
            
            message.setSubject(asunto);
            message.setText(mensaje);
            
            Transport transport = sesion.getTransport("smtp");
            
            transport.connect(host, emisor, clave);
            
            transport.sendMessage(message, message.getAllRecipients());
            
            transport.close();
            
            enviado = true;
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        return enviado;
    }
    
    public static void main(String args[]){
        CorreoElectronico co = new CorreoElectronico();
        co.enviarCorreoCliente("asd", "xevercrips@hotmail.com", "bansito");
    }
}
