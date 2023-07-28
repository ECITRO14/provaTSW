let formIsValid;

function validator() {
 let password = document.getElementById("psw").value;
 let alertElement=document.getElementById("errorPsw");
 
   alertElement.innerHTML = "";

 if (password.length < 8) {
    alertElement.innerHTML="La password deve contenere almeno 8 caratteri";
    formIsValid=false;
    return;
  }
 if (!password.match(/^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9]+$/)) {
     alertElement.innerHTML="La password deve essere alfanumerica.";
     formIsValid=false;
    return;
  }
   if(password.length >= 8 &&  password.match(/^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9]+$/))
	    formIsValid = true;

}


document.getElementById("registrationForm").addEventListener("submit", function(event) {

  let name = document.getElementById("name").value;
  let surname = document.getElementById("surname").value;
  let email = document.getElementById("email").value;
  let password = document.getElementById("psw").value;
  let verifica = document.getElementById("verifica").value;
	

	if(password!==verifica){
		alert("Le password non corrispondono");
   		 event.preventDefault(); // Interrompe l'invio del form se le password non corrispondono
		return;
	}
		
	
	 if (!formIsValid) {
    event.preventDefault(); 
    return;
  }
});
