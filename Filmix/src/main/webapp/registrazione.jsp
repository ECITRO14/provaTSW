<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registrazione Filmix</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel = "icon" href="images/icona.png " type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="styles/registrazione.css">
	<link rel="stylesheet" type="text/css" href="styles/footerWhite.css">
	
</head>
<body>
	<div class="container">
		<header>
     			<a href="home.jsp" class="logo-link"><img class="logo-img" id="headerLogo" src="images/filmix.jpg" alt="Filmixlogo image"></a>
		</header>
		<form class="content" id="registrationForm">
			<div class="h1">
				<H1> Crea Account	</H1>
			</div>
			<div class=inputForm>
				<label class="label"  for="name"> Nome </label>
				<input class="input" type="text" id="name" required>
				<label class="label" for="email"> Email </label>
				<input class="input"type="email" id="email"required>
				<label class="label" for="psw"> Password </label>
				<input class="input" type="password" id="psw"required>
				<label class="label"  for="verifica"> Verifica Password </label>
				<input class="input"type="password"id="verifica" required>
				<button type="submit" class="continua">Continua</button>
			</div>
		</form>
	</div>
		
	<footer>
   		<%@include file="html/footer.html"%>
    </footer>	
    <script src="scripts/registrazione.js"></script>
</body>
</html>