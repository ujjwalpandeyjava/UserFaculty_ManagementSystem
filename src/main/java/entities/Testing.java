package entities;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.validator.routines.EmailValidator;

import servlets.Validate_code_source;

public class Testing {

	public static void main(String[] args) throws MessagingException {
		createMail("ujjwalpandey.aps@gmail.com");
	}
	public static void createMail(String receipent) {

		String validateEmailApache = validateEmailApache(receipent);
		System.out.println(validateEmailApache);
		
		
		boolean obj = Validate_code_source.isAddressValid(receipent);
		System.out.println("mail id exixt? " + obj);
		Properties prop = new Properties();
		prop.setProperty("mail.smtp.auth", "true");
		prop.setProperty("mail.smtp.starttls.enable", "true");
		prop.setProperty("mail.smtp.host", "smtp.gmail.com");
		prop.setProperty("mail.smtp.port", "587");

		// Sender
		final String myAddress = "ujjwalpandey.apps@gmail.com";
		final String pass = "Goldenstar@123";

		Session sess = Session.getInstance(prop, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(myAddress, pass);
			}
		});
		Message mess = prepareMessage(sess, myAddress, receipent);
		try {
			Transport.send(mess);
		} catch (MessagingException e) {
			System.out.println("Mail not sent");
			e.printStackTrace();
		}
		System.out.println("message sent");

	}

	private static Message prepareMessage(Session sess, String myAddress,
			String receipent) {
		try {
			Message mess = new MimeMessage(sess);
			mess.setFrom(new InternetAddress(myAddress));
			mess.setRecipient(Message.RecipientType.TO,
					new InternetAddress(receipent));
			mess.setSubject("This is subject");
			// mess.setText("This is going to be the body.");
			String mailBody = "<center><div class=\"forget-tip-form \">\r\n"
					+ "			<h2 class=\"text-center my-4 \">\r\n"
					+ "				<i class=\"fa fa-question\"></i> Forgot password\r\n"
					+ "			</h2>\r\n" + "</div></center>"
					+ "hii moti this message is sent automatically";
			mess.setContent(mailBody, "text/html");
			return mess;
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("Sone extra");
		}
		return null;
	}
	public static String validateEmailApache(String email) {
		email = email.trim();
		EmailValidator eValidator = EmailValidator.getInstance();
		if (eValidator.isValid(email)) {
			return email + " is a valid email address.";
		} else {
			return email + " is not a valid email address.";
		}
	}
}