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
		<form class="content" id="accessForm" action="AccessoServlet" method="post">
			<div class="h1">
				<H1> Accedi	</H1>
			</div>
			<div class=inputForm>
				<label class="label" for="email" > Email </label>
				<input class="input" type="email" name="email" id="email"required>
				<label class="label" for="psw"> Password </label>
				<input class="input" type="password" name="psw"  id="psw"required>
				<input type="submit" value="Accedi" class="accedi">
				<label class="label" id="oppure" for="registrati">Oppure</label>	
				<a href="registrazione.jsp" class="registrazione"><button type="button" id="registrati">Crea Account</button></a>
			</div>
		</form>
	</div>
					<% if (request.getAttribute("error") != null) { %>
       <p style="color: red;"><%=request.getAttribute("error")%></p>
    <% } %>
	<footer>
		<%@include file="html/footer.html"%>
    </footer>
</body>
</html>