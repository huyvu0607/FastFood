function toggleSearch() {
  const searchBox = document.getElementById("search-box");
  searchBox.style.display = (searchBox.style.display === "none" || searchBox.style.display === "") 
    ? "block" 
    : "none";
}
    window.onload = function() {
    const greetingElement = document.getElementById('greeting');
    const currentHour = new Date().getHours();
    if (currentHour >= 5 && currentHour < 12) {
      greetingElement.textContent = 'Good Morning'; 
    } else if (currentHour >= 12 && currentHour < 18) {
      greetingElement.textContent = 'Good Afternoon';  
    } else {
      greetingElement.textContent = 'Good Night';  
    }
  };
