/**
 * 
 */

 document.getElementById("registrationForm").addEventListener("submit", function(event) {
  event.preventDefault(); // Evita il ricaricamento della pagina

  var email = document.getElementById("email").value;
  var password = document.getElementById("psw").value;
	
	
  // Esegui l'elaborazione dei dati del form
  // Ad esempio, puoi inviare una richiesta AJAX al server per registrare l'account

  // Resetta i campi del form
  document.getElementById("registrationForm").reset();

  // Mostra un messaggio di successo o reindirizza l'utente alla pagina successiva
  alert("Account registrato con successo!");
});