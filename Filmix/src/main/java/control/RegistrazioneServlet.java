package control;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.FilmixDatabase;

@WebServlet("/RegistrazioneServlet")
public class RegistrazioneServlet extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	/**
	 *
	 */
	public RegistrazioneServlet() {
		super();
	}

	private String toHash(String password) {
		String hashString=null;
		try {
			java.security.MessageDigest digest=java.security.MessageDigest.getInstance("SHA-512");
			byte [] hash=digest.digest(password.getBytes(StandardCharsets.UTF_8));
			hashString= "";
			for (byte element : hash) {
				hashString += Integer.toHexString((element&0xFF)|0x100).toLowerCase().substring(1,3);
			}
		}
		catch(java.security.NoSuchAlgorithmException e) {
			System.out.println(e);
		}
		return hashString;
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String password = request.getParameter("psw");
        password=toHash(password);
        try {
            FilmixDatabase db = new FilmixDatabase();
            String queryCheckEmail = "SELECT COUNT(*) FROM UTENTE WHERE email = ?";
            PreparedStatement checkEmailStatement = db.getConnection().prepareStatement(queryCheckEmail);
            checkEmailStatement.setString(1, email);
            ResultSet emailResult = checkEmailStatement.executeQuery();
            emailResult.next();
            int emailCount = emailResult.getInt(1);

            if (emailCount > 0) {
                // L'email esiste già nel database, mostra un messaggio di errore
                request.setAttribute("error", "L'email inserita è già utilizzata da un altro utente.");
                request.getRequestDispatcher("registrazione.jsp").forward(request, response);
            } else {
                // Procedi con l'inserimento dell'utente nel database
                String query = "INSERT INTO UTENTE (nome,cognome,email,psw) VALUES (?,?,?,?);";
                PreparedStatement statement = db.getConnection().prepareStatement(query);
                statement.setString(1, name);
                statement.setString(2, surname);
                statement.setString(3, email);
                statement.setString(4, password);

                int righeModificate = statement.executeUpdate();

                // Ora puoi verificare il numero di righe modificate se necessario
                if (righeModificate > 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute("email", email);
                    session.setAttribute("name", name);
                    session.setAttribute("surname", surname);
                    // L'inserimento è avvenuto con successo, puoi reindirizzare a una pagina di conferma
                    response.sendRedirect("home.jsp");
                } else {
                    // Potresti gestire il caso in cui l'inserimento non ha avuto successo
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            // Gestisci eventuali errori del database o di elaborazione
            // Reindirizza a una pagina di errore o mostra un messaggio di errore
        }
    }
}
