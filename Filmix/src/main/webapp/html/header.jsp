<html>
<head>
     <script src="scripts/logout.js"></script>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<header>
        <a href="home.jsp" class="logo-link"><img class="logo-img" id="headerLogo" src="images/filmix.jpg" alt="Filmixlogo image"></a>
        <nav>
            <ul class="dropdown">
                <li>
                    <a href="#" class="dropbtn">
                        <img class="menu-img" id="menuLogo" src="images/menu1.png" alt="Filmixmenu image">
                        <span>Generi</span>
                    </a>
        					<ul class="dropdown-content">
                        <li><a href="generi.jsp?genere=Azione" class="link-genere">Azione</a></li>
                        <li><a href="generi.jsp?genere=Drammatico"	class="link-genere">Drammatico</a></li>
                        <li><a href="generi.jsp?genere=Commedia"	class="link-genere">Commedia</a></li>
                        <li><a href="generi.jsp?genere=Romantico"	class="link-genere">Romantico</a></li>
                    	<li><a href="generi.jsp?genere=Sci-fi"	class="link-genere">Sci-fi</a></li>
        		    	<li><a href="generi.jsp?genere=Giallo"	class="link-genere">Giallo</a></li>
        				<li><a href="generi.jsp?genere=Horror"	class="link-genere">Horror</a></li>							
							</ul>
                </li>
            </ul>
        </nav>
        <div class="ricerca">
            <input type="text" placeholder="Ricerca Filmix.it">
            <button type="submit" class="cerca">Cerca</button>
        </div>
	<% if (session.getAttribute("name") != null) { %>
    <p style="color: white;">Ciao, <%=session.getAttribute("name")%> <%=session.getAttribute("surname")%></p>
    <p class="logout" id="logout">Logout</p> 
	<% } else { %>
    <div class="login">
        <a href="registrazione.jsp">
            <button class="registrati" id="buttonRegistrazione">Registrati</button>
        </a>
        <a href="accedi.jsp">
            <button class="accedi" id="buttonAccedi">Accedi</button>
        </a>
    </div>
	<% } %>
        <div class="carrello">
            <a href="shop.jsp" class="cart-link">
                <img class="cart-img" id="cartLogo" src="images/cart.png" alt="Filmixcart image">
            </a>
            <p class="cart-text"> Carrello</p>
        </div>
      </header>
   </div>
 </body>
</html>
        
