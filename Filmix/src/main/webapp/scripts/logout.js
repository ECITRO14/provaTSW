document.addEventListener('DOMContentLoaded', function() { 

  var logoutButton = document.getElementById('logout');
  logoutButton.addEventListener('click', function() {
        // Esegui la richiesta di logout asincrono
        $.ajax({
            url: "LogoutServlet", // URL del servlet per gestire il logout
            type: "GET",
            success: function(response) {
                // La richiesta di logout ha avuto successo
                // Reindirizza l'utente alla pagina di accesso dopo il logout
                window.location.href = "home.jsp";
            },
            error: function(xhr, status, error) {
                // Gestisci eventuali errori durante il logout
                alert("Errore durante il logout: " + status);
            }
        });
    });
});
