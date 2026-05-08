/*
  Exercise 3: Page Layout
  Lightbox image preview with fade-in and fade-out animations
  Author: Mateusz Caputa
  Date: 2026
*/


//Store  lightbox elements in global variable.
let lightboxImg = null;
let lightboxPopup = null;
let lightboxBtn = null;

//Function openLightbox shows popup @element - img element with src
function openLightbox(element) {
  lightboxImg.src = element.src;
  lightboxPopup.style.display = "flex";
}

//Animate closing popup box
function closeLightbox() {
  lightboxPopup.classList.add("hide");
}

//Wait for document to load
document.addEventListener("DOMContentLoaded", () => {
  //Store lightbox elements in global variable for easy access.
  lightboxImg = document.getElementById("imgLightbox");
  lightboxPopup = document.getElementById("lightbox");
  lightboxBtn = document.getElementById("btnLightbox");

  //Binds onclick events from popup and button to closeLightbox function
  lightboxPopup.onclick = () => closeLightbox();
  lightboxBtn.onclick = (e) => {
    e.stopPropagation();
    closeLightbox();
  };

  //Binds all image elements apart from the one in popup
  document.querySelectorAll("img").forEach((img) => {
    if (img.id === "imgLightbox") return;
    img.onclick = () => openLightbox(img);
  });

  //Hides popup element after hide animation ended
  lightboxPopup.addEventListener("animationend", () => {
    if (lightboxPopup.classList.contains("hide")) {
      lightboxPopup.classList.remove("hide");
      lightboxPopup.style.display = "none";
    }
  });
});
