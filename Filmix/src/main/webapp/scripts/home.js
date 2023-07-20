document.addEventListener('DOMContentLoaded', function() {
	
  var novitaButton = document.getElementById('novita');
  var vendutiButton = document.getElementById('venduti');
  novitaButton.addEventListener('click', function() {
	  
	 var nomiFilm=["Il re leone","La sirenetta","Avengers","Doctor Strange","Joker","Insidious","Avatar","Spider-man"];
	 
	var h2Element = document.getElementById("film-text");
	h2Element.textContent="Novit\u00E0";
	var filmLinks=document.querySelectorAll('.film-a');
    var filmImgs = document.querySelectorAll('.film-img');
    for (var i = 0; i < filmImgs.length; i++) {
      var originalSrc = filmImgs[i].getAttribute('src');
      var newSrc;
      if(originalSrc.includes('consigliati'))
      	newSrc = originalSrc.replace('consigliati', 'novita');
      else
      	newSrc= originalSrc.replace('venduti', 'novita');
      filmImgs[i].setAttribute('src', newSrc);
      filmLinks[i].setAttribute('href',"film.jsp?titolo="+nomiFilm[i]);
    }
  });

  vendutiButton.addEventListener('click', function() {
	var nomiFilm=["Titanic","Jurassic World","Fast & Furious 7","Deadpool 2","Harry Potter e i doni della morte parte 2","Il cavaliere oscuro","Il Padrino","Inception"];
	var h2Element = document.getElementById("film-text");
	var filmLinks=document.querySelectorAll('.film-a');
	h2Element.textContent="I pi\u00F9 venduti";
    var filmImgs = document.querySelectorAll('.film-img');
    for (var i = 0; i < filmImgs.length; i++) {
      var originalSrc = filmImgs[i].getAttribute('src');
      var newSrc;
      if(originalSrc.includes('consigliati'))
      	newSrc = originalSrc.replace('consigliati', 'venduti');
      else
      	newSrc = originalSrc.replace('novita', 'venduti');
      filmImgs[i].setAttribute('src', newSrc);
      filmLinks[i].setAttribute('href',"film.jsp?titolo="+nomiFilm[i]);

    }
  });
});
