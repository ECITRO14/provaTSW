<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Carrello-Filmix</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel = "icon" href="images/icona.png " type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="styles/shop.css">
	<link rel="stylesheet" type="text/css" href="styles/header.css">
	<link rel="stylesheet" type="text/css" href="styles/footer.css">
	<link rel="stylesheet" type="text/css" href="styles/shop-media.css">
	<link rel="stylesheet" type="text/css" href="styles/buttons.css">
</head>
<body>
<body>
		<div class="container">
    		<header>
     					<%@include file="html/header.jsp"%>
     			
   			</header>
   			
   			<div class="content">
   						<div class="cart">
   							<h2 class="testo">Il tuo carrello è vuoto.</h2>
   							<p class=testo>Il tuo carrello aspetta solo di essere riempito.Continua a fare acquisti sul sito filmix.it. Scopri le nostre sezioni <a class="link" href="home.jsp" id="venduti">I più venduti</a> e <a class="link" href="home.jsp">Novità</a></p>
   					</div>
   					<div class="cartBox">
   						<p	class="cartText">Prodotti: 0</p>
   						<p	class="cartText">Totale: 0&euro;</p>
   						<button class="confermaOrdine">Procedi all'acquisto</button>
   					</div>
   			</div>
   		<div class="boxSuggerimenti">
   			<h1 class="testoSuggerimenti">Suggerimenti</h1>	
   			<div class="suggerimenti">
   			<button class="prev-button">&#10094;</button>
   				<div class="carousel">
  					<div class="slide-container">
    					<div class="slide">
							<a href="film.jsp?titolo=The Wolf of  Wall Street"	class="film-a"><img class="film-img" src="images/film/consigliati1.jpg"></a>
						</div>
    					<div class="slide">
							<a href="film.jsp?titolo=Scarface"	class="film-a"><img class="film-img" src="images/film/consigliati2.jpg"></a>
    					</div>
   						 <div class="slide">
							<a href="film.jsp?titolo=Cronache di Narnia"	class="film-a"><img class="film-img" src="images/film/consigliati3.jpg"></a>
   				 		</div>
   				 		<div class="slide">
							<a href="film.jsp?titolo=Harry Potter e la pietra filosofale"	class="film-a"><img class="film-img" src="images/film/consigliati4.jpg"></a>  					   
						</div>
   				 		<div class="slide">
							<a href="film.jsp?titolo=Transformers"	class="film-a"><img class="film-img" src="images/film/consigliati5.jpg"></a>
    					 </div>
    					 <div class="slide">
							<a href="film.jsp?titolo=The conjuring"	class="film-a"><img class="film-img" src="images/film/consigliati6.jpg"></a> 
						</div>
 				 		<div class="slide">
							<a href="film.jsp?titolo= ...Hollywood"	class="film-a"><img class="film-img" src="images/film/consigliati7.jpg"></a>
						</div>						
				 		<div class="slide">
							<a href="film.jsp?titolo=Pirati dei caraibi: Ai confini del mondo"	class="film-a"><img class="film-img" src="images/film/consigliati8.jpg"></a>
						</div>			
   						 </div>
   					 </div>
   					<button class="next-button">&#10095;</button>			 
  				</div>
  			</div>
  		</div>
	<footer>
		<%@include file="html/footer.html"%>
    </footer>
    <script src="scripts/ricerca.js"></script>
    <script src="scripts/shop.js"></script>
</body>
</html>