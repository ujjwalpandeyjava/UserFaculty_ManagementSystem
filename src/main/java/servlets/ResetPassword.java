package servlets;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import connection.DBConnection;
import entities.UserDetails;
import enums.MailDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ResetPassword() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sess = request.getSession();

		String email = request.getParameter("emailPassReset");
		String phone = request.getParameter("phonePassReset");

		if (!email.isBlank()) {
			UserDetails a = isMailInDatabase(email);
			if (a != null) {
				String emailFromDatabase = a.getEmail();

				boolean validMail = Validate_code_source.isAddressValid(emailFromDatabase);

				if (validMail) {
					try {
						sendmail(email, a.getContactNumber(), a.getPassword());
						sess.setAttribute("resetProbCause",
								"Details has been sent to the " + emailFromDatabase + ", check for mail");
						response.sendRedirect("forget.jsp");
					} catch (MessagingException e) {
						sess.setAttribute("resetProbCause", "Server problem, try in 15 min.");
						response.sendRedirect("forget.jsp");
						e.printStackTrace();
					}
				} else {
					sess.setAttribute("resetProbCause",
							"User found attached to this E-mail id, but this mail id is fake.Try with phone number.");
					response.sendRedirect("forget.jsp");
				}

			} else if (a == null) {
				sess.setAttribute("resetProbCause", "No user found attached to this E-mail id.");
				response.sendRedirect("forget.jsp");
			}
		} else if (!phone.isBlank()) {
			List<UserDetails> phoneInDatabase = isPhoneInDatabase(phone);
			if (phoneInDatabase.isEmpty()) {
				sess.setAttribute("resetProbCause",
						"No user found attached to this number. User hint or contact us throught contact form");
				response.sendRedirect("forget.jsp");
			} else {
				for (UserDetails userD : phoneInDatabase) {
					if (userD.getEmail() != null) {
						boolean validMail = Validate_code_source.isAddressValid(userD.getEmail());
						if (validMail) {
							try {
								sendmail(userD.getEmail(), userD.getContactNumber(), userD.getPassword());
//								sess.setAttribute("resetProbCause", "Details has been sent to the attached mail: " + userD.getEmail() + ", check for details in it.");
								sess.setAttribute("resetProbCause", "Details has been sent to the attached mail, Check your registered e-mail for details");
								response.sendRedirect("forget.jsp");
							} catch (MessagingException e) {
								System.out.println(e.getMessage());
								sess.setAttribute("resetProbCause", "Server problem, try in 15 min.");
								response.sendRedirect("forget.jsp");
								e.printStackTrace();
							}
						} else {
							sess.setAttribute("resetProbCause",
									"User found attached to this number, but the mail id is fake. Try contact us.");
							response.sendRedirect("forget.jsp");
						}

					} else if (userD.getEmail() == null) {
						sess.setAttribute("resetProbCause", "User found with number, but has no attached mail id.");
						response.sendRedirect("forget.jsp");
					}

				}

			}

		} else {
			sess.setAttribute("resetProbCause", "Provide atleast 1 field");
			response.sendRedirect("forget.jsp");
		}
	}

	UserDetails isMailInDatabase(String email) {
		org.hibernate.Session sess = DBConnection.getFactory().openSession();
		sess.beginTransaction();
		UserDetails usd = (UserDetails) sess.get(UserDetails.class, email);
		sess.close();
		return usd;
	};

	public void sendmail(String receipent) throws MessagingException {
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
		Transport.send(mess);
	}

	public void sendmail(String receipent, String phone, String password) throws MessagingException {
		Properties prop = new Properties();
		prop.setProperty("mail.smtp.auth", "true");
		prop.setProperty("mail.smtp.starttls.enable", "true");
		prop.setProperty("mail.smtp.host", "smtp.gmail.com");
		prop.setProperty("mail.smtp.port", "587");

		// Sender
		/*
		 * final String myAddress = "ujjwalpandey.apps@gmail.com"; final String pass =
		 * "Goldenstar@123";
		 */
		final String myAddress = MailDetails.FROM.getValue();
		final String pass = MailDetails.CODE.getValue();
		Session sess = Session.getInstance(prop, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(myAddress, pass);
			}
		});
		Message mess = prepareMessage(sess, myAddress, receipent, phone, password);
		Transport.send(mess);
	}

	private static Message prepareMessage(Session sess, String myAddress, String receipent) {
		try {
			Message mess = new MimeMessage(sess);
			mess.setFrom(new InternetAddress(myAddress));
			mess.setRecipient(Message.RecipientType.TO, new InternetAddress(receipent));
			mess.setSubject("Developers' Point Details");
			// mess.setText("This is going to be the body.");
			String mailBody = "<center> The number registered with " + receipent + "</center>";
			mess.setContent(mailBody, "text/html");
			return mess;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return null;
	};

	private static Message prepareMessage(Session sess, String myAddress, String receipent, String phone, String pass) {
		try {
			Message mess = new MimeMessage(sess);
			mess.setFrom(new InternetAddress(myAddress));
			mess.setRecipient(Message.RecipientType.TO, new InternetAddress(receipent));
			mess.setSubject("Developers' Point Details");
			// mess.setText("This is going to be the body.");
			String mailBody = "<center> Details attached to mail id: " + receipent + " are: <br> Phone number: <b> "
					+ ((phone != null) ? phone : "") + "</b>, <br> Password: <b>" + pass + "</b>"
					+ "<br> <a href='http://localhost:8081/User_Faculty_Institute_Workspace/login.jsp'>click here<a/> "
					+ "to login.<br>" + "<b>Tip: Change password every 4 month to stay secure.</b>" + "</center>";
			mess.setContent(mailBody, "text/html");
			return mess;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return null;
	}

	List<UserDetails> isPhoneInDatabase(String phone) {
		String query = "FROM UserDetails WHERE contactNumber = '" + phone + "'";
		System.out.println(phone + " ____ " + query);
		org.hibernate.Session sess1 = DBConnection.getFactory().openSession();
		List<UserDetails> resultList = sess1.createQuery(query, UserDetails.class).getResultList();
		sess1.close();
		return resultList;
	};

}