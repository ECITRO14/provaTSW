<%@ page import="java.io.InputStream" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.*" %>
<%@ page import="it.unisa.FilmixDatabase" %>


<!DOCTYPE html>
<html>
<head>
	<%String id = request.getParameter("genere"); %>
    <title>Filmix - <%=id%></title>
    <link rel="stylesheet" type="text/css" href="styles/generi.css">
    <link rel="stylesheet" type="text/css" href="styles/buttons.css">
    <link rel="stylesheet" type="text/css" href="styles/header.css">
    <link rel="stylesheet" type="text/css" href="styles/footer.css">
</head>
<body>
<div class="container">
    <header>
           <%@include file="html/header.jsp"%>
       
    </header>
    <div class="content">
        <%
        FilmixDatabase db = new FilmixDatabase();
        try {
            String query = "SELECT * FROM Film WHERE genere LIKE ?";
            PreparedStatement statement = db.getConnection().prepareStatement(query);
            statement.setString(1,"%"+id + "%");
            ResultSet resultSet = statement.executeQuery();
            out.println("<div class='main'>");                               
            while (resultSet.next()) {
                String titolo = resultSet.getString("titolo");
                String genere = resultSet.getString("genere");
                int annoUscita = resultSet.getInt("annoUscita");
                int prezzo = resultSet.getInt("prezzo");
                String trama = resultSet.getString("trama");
                int disponibilita = resultSet.getInt("disponibilita");
                Time durata = resultSet.getTime("durata");
                Blob imageBlob = resultSet.getBlob("img");
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
                    String titoloModificato = titolo.replace("'", "&#39;");
                    %>
                    <div class='film'>           
                    <a class='film-a' href='film.jsp?titolo=<%=titoloModificato%>'><img class='imgClass' src='data:image/jpeg;base64,<%=base64Image%>' alt='Immagine'></a>
                     <div class='descrizione'>    
                    	<h3><%=titoloModificato%></h3>
                    	<p><%=trama%></p>
                   	 </div>
                    </div>
                    <% 
            }
          }
            %>
          </div>
            <%
        }
            catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.closeConnection();
        }
        %>
    </div>
	<footer>
    	<%@include file="html/footer.html"%>
	</footer>
	<script src="scripts/ricerca.js"></script>
</body>
</html>
