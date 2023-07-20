<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Filmix</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel = "icon" href="images/icona.png " type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="styles/home.css">
	<link rel="stylesheet" type="text/css" href="styles/buttons.css">
	<link rel="stylesheet" type="text/css" href="styles/header.css">
	<link rel="stylesheet" type="text/css" href="styles/footer.css">
</head>
<body>
	<div class="container">
		<header>
     		<%@include file="html/header.html"%>
   		</header>
		<div class="content">
				<div class="button-group">
					<button class="film-button" id="novita">Novità</button>
					<button class="film-button" id="venduti">I più venduti</button>
				</div>
				<div class="container-film">
					<h2 id="film-text" class="film-text">Consigliati</h2>
					<div class="films" id="group1">
						<a href="film.jsp?titolo=The Wolf of  Wall Street"	class="film-a"><img class="film-img" src="images/film/consigliati1.jpg"></a>
						<a href="film.jsp?titolo=Scarface"	class="film-a"><img class="film-img" src="images/film/consigliati2.jpg"></a>
						<a href="film.jsp?titolo=Cronache di Narnia"	class="film-a"><img class="film-img" src="images/film/consigliati3.jpg"></a>
						<a href="film.jsp?titolo=Harry Potter e la pietra filosofale"	class="film-a"><img class="film-img" src="images/film/consigliati4.jpg"></a>
					</div>
					<div class="films" id="group2">
						<a href="film.jsp?titolo=Transformers"	class="film-a"><img class="film-img" src="images/film/consigliati5.jpg"></a>
						<a href="film.jsp?titolo=The conjuring"	class="film-a"><img class="film-img" src="images/film/consigliati6.jpg"></a>
						<a href="film.jsp?titolo= ...Hollywood"	class="film-a"><img class="film-img" src="images/film/consigliati7.jpg"></a>
						<a href="film.jsp?titolo=Pirati dei caraibi: Ai confini del mondo"	class="film-a"><img class="film-img" src="images/film/consigliati8.jpg"></a>
					</div>
				</div>
		</div>
	</div>
	<script src="scripts/home.js"></script>
	<script src="scripts/ricerca.js"></script>
	<footer>
		<%@include file="html/footer.html"%>
    </footer>
</body>
</html>