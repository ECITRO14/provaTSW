package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Ottieni la sessione corrente dell'utente (se esiste)
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Rimuovi tutti gli attributi relativi all'utente dalla sessione
            session.removeAttribute("name");
            session.removeAttribute("surname");
            session.removeAttribute("email");

            // Invalida la sessione (elimina completamente la sessione)
            session.invalidate();
        }

        // Reindirizza l'utente alla pagina di accesso dopo il logout
        response.sendRedirect("home.jsp");
    }
}
