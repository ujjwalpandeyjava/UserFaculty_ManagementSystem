package servlets;

import java.io.IOException;
import java.io.Serializable;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.validator.routines.EmailValidator;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;

import connection.DBConnection;
import entities.UserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}
	public static boolean validateEmailApache(String email) {
		email = email.trim();
		EmailValidator eValidator = EmailValidator.getInstance();
		if (eValidator.isValid(email)) {
			return true;
		} else {
			return false;
		}
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		try {
			String uFirstName = request.getParameter("uFirstName");
			String uLastName = request.getParameter("uLastName");
			String uEmail = request.getParameter("uEmail");
			String uPassword = request.getParameter("uPassword");
			String uType = request.getParameter("uType");

			boolean validateEmailApache = validateEmailApache(uEmail);
			if (!validateEmailApache) {
				session = request.getSession();
				session.setAttribute("reg-failed",
						"Registration Unsucessful, Given mail id is not valid email address.");
				response.sendRedirect("register.jsp");
			} else {
				Session sess = DBConnection.getFactory().openSession();
				UserDetails userDetails = (UserDetails) sess
						.get(UserDetails.class, uEmail);
				if (userDetails != null) {
					session = request.getSession();
					session.setAttribute("reg-failed", "This user email '"
							+ uEmail
							+ "' is already in use take something else.");
					response.sendRedirect("register.jsp");
				} else {
					UserDetails uDetails;
					if (uType != null) {

						uDetails = new UserDetails(uFirstName, uLastName,
								uEmail, uPassword, new Date(), uType);
						// DBConnection gives the factory.
						// Create session from the factory.

						// Create a transaction from the session.
						Transaction tr = sess.beginTransaction();
						// or sess.beginTransaction();

						Serializable iddd = sess.save(uDetails);
						System.out.println(iddd);

						tr.commit();
						// or sess.getTransaction().commit();
						sess.close();

						session = request.getSession();
						session.setAttribute("reg-sucess",
								"New '" + uType + "' Registered Sucesfull");
						response.sendRedirect("admin.jsp");
						sendmail(uEmail, uPassword,
								"new ".concat(uType).concat(" - ")
										.concat(uLastName).concat(uLastName));
					} else {

						uDetails = new UserDetails(uFirstName, uLastName,
								uEmail, uPassword, new Date(), "student");
						// DBConnection gives the factory.
						// Create session from the factory.

						// Create a transaction from the session.
						Transaction tr = sess.beginTransaction();
						// or sess.beginTransaction();

						Serializable iddd = sess.save(uDetails);
						System.out.println(iddd);

						tr.commit();
						// or sess.getTransaction().commit();
						sess.close();

						session = request.getSession();
						session.setAttribute("reg-sucess",
								"Registration Sucesfull");
						response.sendRedirect("register.jsp");
						sendmail(uEmail, uPassword,
								uFirstName.concat(uLastName));
					}
				}
			}
		} catch (ConstraintViolationException cve) {
			System.out.println("Duplicate maal");
		} catch (Exception e) {
			System.out.println("2nd exception is thrown\n");
			e.printStackTrace();
			session = request.getSession();
			// Will execute when connection with database is failed due to
			// various reason.
			session.setAttribute("reg-failed",
					"Registration Unsucessful, Something went wrong with server!! Come back in 10 min....");
			response.sendRedirect("register.jsp");
		}
	}
	public void sendmail(String receipent, String password, String name)
			throws MessagingException {
		Properties prop = new Properties();
		prop.setProperty("mail.smtp.auth", "true");
		prop.setProperty("mail.smtp.starttls.enable", "true");
		prop.setProperty("mail.smtp.host", "smtp.gmail.com");
		prop.setProperty("mail.smtp.port", "587");

		// Sender
		final String myAddress = "ujjwalpandey.apps@gmail.com";
		final String pass = "Goldenstar@123";

		javax.mail.Session sess = javax.mail.Session.getInstance(prop,
				new Authenticator() {
					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(myAddress, pass);
					}
				});
		Message mess = prepareMessage(sess, myAddress, receipent, password,
				name);
		Transport.send(mess);
	}
	private static Message prepareMessage(javax.mail.Session sess,
			String myAddress, String receipent, String pass, String name) {
		try {
			Message mess = new MimeMessage(sess);
			mess.setFrom(new InternetAddress(myAddress));
			mess.setRecipient(Message.RecipientType.TO,
					new InternetAddress(receipent));
			mess.setSubject("Welcome to Developers' Point ");
			// mess.setText("This is going to be the body.");
			String mailBody = "<h1> Welcome " + name
					+ " at Developers' Point </h1>"
					+ "<center> Initial detail of your account with mail id: "
					+ receipent + " are: " + "<br> Name: <b>" + name + "</b>"
					+ "<br> Password: <b>" + pass + "</b>"
					+ "<br> <a href='http://localhost:8081/User_Faculty_Institute_Workspace/login.jsp'>click here<a/> "
					+ "to login.<br>"
					+ "<b>Tip: Change password every 4 month to stay secure.</b>"
					+ "</center>";
			mess.setContent(mailBody, "text/html");
			return mess;
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("Sone extra");
		}
		return null;
	}
}
