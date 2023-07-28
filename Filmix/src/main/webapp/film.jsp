<%@ page import="java.io.InputStream" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.*" %>
<%@ page import="it.unisa.FilmixDatabase" %>


<!DOCTYPE html>
<html>
<head>
  <%
        FilmixDatabase db = new FilmixDatabase();
        try {
            String id = request.getParameter("titolo");
            String query = "SELECT * FROM Film WHERE titolo LIKE ?";
            PreparedStatement statement = db.getConnection().prepareStatement(query);
            statement.setString(1, "%" + id + "%");
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String titolo = resultSet.getString("titolo");
                String genere = resultSet.getString("genere");
                int annoUscita = resultSet.getInt("annoUscita");
                int prezzo = resultSet.getInt("prezzo");
                String trama = resultSet.getString("trama");
                int disponibilita = resultSet.getInt("disponibilita");
                Time durata = resultSet.getTime("durata");
                Blob imageBlob = resultSet.getBlob("img");%>
    <title><%=titolo %></title>
    <link rel="stylesheet" type="text/css" href="styles/film.css">
    <link rel="stylesheet" type="text/css" href="styles/footer.css">
    <link rel="stylesheet" type="text/css" href="styles/header.css">
    <link rel="stylesheet" type="text/css" href="styles/buttons.css">
</head>
<body>
<div class="container">
	<header>
	
    <%@include file="html/header.jsp"%>
    </header>
    <div class="content">
      <% 
                if (imageBlob != null) {
                    InputStream inputStream = imageBlob.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    inputStream.close();
                    byte[] imageBytes = outputStream.toByteArray();
                    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                    outputStream.close();
                    out.println("<img class='imgClass' src='data:image/jpeg;base64," + base64Image + "' alt='Immagine'>");
                    out.println("<div class=main>");
                    out.println("<div class='descrizione'>");
                    out.println("<h3 class='h'>Titolo</h3>");
                    out.println("<p class='p'>" + titolo + "</p>");
                    out.println("<h3 class='h'>Genere</h3>");
                    out.println("<p class='p'>" + genere + "</p>");
                    out.println("<h3 class='h'>Anno di uscita</h3>");
                    out.println("<p class='p'>" + annoUscita + "</p>");
                    out.println("<h3 class='h'>Prezzo</h3>");
                    out.println("<p class='p'>" + prezzo + "&euro;" + "</p>");
                    out.println("<h3 class='h'>Trama</h3>");
                    out.println("<p class='p'>" + trama + "</p>");
                    out.println("<h3 class='h'>Disponibilità</h3>");
                    out.println("<p class='p'>" + disponibilita + "</p>");
                    out.println("<h3 class='h'>Durata</h3>");
                    out.println("<p class='p'>" + durata + "</p>");
                   
                    out.println("</div>");
                    out.println("<div class='seleziona'>");
                    out.println("<h3 class='h'> Quantità: </h3>");
                    out.println("<select name='quantita' id='quantitySelect'>");
                  		  for (int i = 1; i <= disponibilita; i++) {
                  		      out.println("<option value='" + i + "'>" + i + "</option>");
                  			 }
                  	    out.println("</select>");
                        out.println("</div>");
                    	out.println("<button class='acquista' id='buyButton' data-titolo"+titolo+" >Acquista</button>");
                    out.println("</div>");
                  out.println("</div>");
                    
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.closeConnection();
        }
        %>
    </div>
</div>
<footer>
    <%@include file="html/footer.html"%>
</footer>
	<script src="scripts/ricerca.js"></script>

</body>
</html>
