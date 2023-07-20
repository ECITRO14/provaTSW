<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Accedi Filmix</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel = "icon" href="images/icona.png " type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="styles/accedi.css">
	<link rel="stylesheet" type="text/css" href="styles/footerWhite.css">
</head>
<body>
	<div class="container">
		<header>
     			<a href="home.jsp" class="logo-link"><img class="logo-img" id="headerLogo" src="images/filmix.jpg" alt="Filmixlogo image"></a>
		</header>
		<form class="content" id="accessForm">
			<div class="h1">
				<H1> Accedi	</H1>
			</div>
			<div class=inputForm>
				<label class="label" for="email"> Email </label>
				<input class="input" type="email" id="email"required>
				<label class="label" for="psw"> Password </label>
				<input class="input" type="password" id="psw"required>
				<button type="submit" class="continua">Continua</button>
				<label class="label" id="oppure" for="registrati">Oppure</label>	
				<a href="registrazione.jsp" class="registrazione"><button type="button" id="registrati">Crea Account</button></a>
			</div>
		</form>
	</div>
		
	<footer>
		<%@include file="html/footer.html"%>
    </footer>	
     <script src="scripts/accesso.js"></script>
</body>
</html>