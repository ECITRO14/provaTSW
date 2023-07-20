 document.addEventListener("DOMContentLoaded", function () {
  // Qui andrà tutto il codice JS che dipende dal caricamento del DOM

  // Ottieni tutti gli elementi degli slider (immagini)
  const slides = document.querySelectorAll(".slide");

  // Inizializza l'indice corrente dell'immagine visualizzata
  let currentSlideIndex = 0;

  // Funzione per nascondere tutte le immagini
  function hideSlides() {
    slides.forEach((slide) => {
      slide.style.display = "none";
    });
  }

  function showSlides(start, end) {
    for (let i = start; i <= end; i++) {
      slides[i].style.display = "block";
    }
  }

  // Funzione per gestire il click del bottone next
  function nextSlide() {
    hideSlides();
    currentSlideIndex += 4;
    if (currentSlideIndex >= slides.length) {
      currentSlideIndex = 0;
    }
    showSlides(currentSlideIndex, currentSlideIndex + 3);
  }

  // Funzione per gestire il click del bottone previous
  function previousSlide() {
    hideSlides();
    currentSlideIndex -= 4;
    if (currentSlideIndex < 0) {
      currentSlideIndex = slides.length - 4;
    }
    showSlides(currentSlideIndex, currentSlideIndex + 3);
  }

  // Mostra solo le prime 4 immagini all'avvio dello script
  showSlides(0, 3);

  // Ottieni i riferimenti ai bottoni previous e next
  const prevButton = document.querySelector(".prev-button");
  const nextButton = document.querySelector(".next-button");

  // Aggiungi gli event listener per i click dei bottoni
  prevButton.addEventListener("click", previousSlide);
  nextButton.addEventListener("click", nextSlide);
});
