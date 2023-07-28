package control;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.FilmixDatabase;

@WebServlet("/AccessoServlet")
public class AccessoServlet extends HttpServlet {
    
	public AccessoServlet() {
		super();
	}
	
	private String toHash(String password) {
		String hashString=null;
		try {
			java.security.MessageDigest digest=java.security.MessageDigest.getInstance("SHA-512");
			byte [] hash=digest.digest(password.getBytes(StandardCharsets.UTF_8));
			hashString= "";
			for(int i=0;i< hash.length;i++) {
				hashString += Integer.toHexString((hash[i]&0xFF)|0x100).toLowerCase().substring(1,3);
			}
		}
		catch(java.security.NoSuchAlgorithmException e) {
			System.out.println(e);
		}
		return hashString;
	}
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("psw");
        password=toHash(password);
        try {
            FilmixDatabase db = new FilmixDatabase();
            String query = "SELECT * FROM UTENTE WHERE email = ?";
            PreparedStatement statement = db.getConnection().prepareStatement(query);
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                // L'utente con l'email specificata esiste nel database
                String pass = resultSet.getString("psw");
                
                // Verifica la password utilizzando l'algoritmo di hashing
                if(pass.equals(password)) {
                    // Autenticazione riuscita
                    // Salvare l'informazione dell'utente in una sessione
                    HttpSession session = request.getSession();
                    session.setAttribute("email", email);
                    session.setAttribute("name", resultSet.getString("nome"));
                    session.setAttribute("surname", resultSet.getString("cognome"));

                    // Reindirizza all'homepage o ad altre pagine riservate agli utenti autenticati
                    response.sendRedirect("home.jsp");
                    return;
                }
            }

            // Autenticazione fallita, mostra un messaggio di errore
            request.setAttribute("error", "Credenziali di accesso non valide.");
            request.getRequestDispatcher("accedi.jsp").forward(request, response);

        } catch (SQLException ex) {
            ex.printStackTrace();
            // Gestisci eventuali errori del database o di elaborazione
            // Reindirizza a una pagina di errore o mostra un messaggio di errore
        }
    }
}
