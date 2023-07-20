document.addEventListener('DOMContentLoaded', function() {
	
	// Get the reference to the "Cerca" button and the input field
const cercaButton = document.querySelector('.cerca');
const ricercaInput = document.querySelector('.ricerca input[type="text"]');

// Add a click event listener to the "Cerca" button
cercaButton.addEventListener('click', function() {
  // Get the value of the input field
  const searchText = ricercaInput.value;
  
  // Construct the URL to the cerca.jsp page with the search query as a parameter
  const cercaURL = `ricerca.jsp?cerca=${encodeURIComponent(searchText)}`;
  
  // Redirect to the cerca.jsp page
  window.location.href = cercaURL;
	});
});

/**
 * 
 */