/****************************
        ATIVAR LINKS
****************************/

const links = document.querySelectorAll(".userpage_options a");

function ativarLink(link) {
  const url = location.href;
  const href = link.href;

  if (url.includes(href)) {
    link.classList.add("ativo");
  }
}

links.forEach(ativarLink);

/****************************
        MENU HAMBURGUER
****************************/

// const btnMobile = document.getElementById("btn-mobile");

// function toggleMenu(event) {
//   if (event.type === "touchstart") event.preventDefault();

//   const nav = document.getElementById("nav");
//   nav.classList.toggle("active");
//   const active = nav.classList.contains("active");
//   event.currentTarget.setAttribute("aria-expanded", active);
//   if (active) {
//     event.currentTarget.setAttribute("aria-label", "Fechar menu");
//   } else {
//     event.currentTarget.setAttribute("aria-label", "Abrir menu");
//   }
// }

// btnMobile.addEventListener("click", toggleMenu);
// btnMobile.addEventListener("touchstart", toggleMenu);

function menuShow() {
  let menuMobile = document.querySelector('.mobile-menu');
  if (menuMobile.classList.contains('open')) {
      menuMobile.classList.remove('open');
      document.querySelector('.icon').src = "./images/menu-hamburguer/menu_white_36dp.svg";
  } else {
      menuMobile.classList.add('open');
      document.querySelector('.icon').src = "./images/menu-hamburguer/close_white_36dp.svg";
  }
}

/****************************
        CARROSSEL 
****************************/

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");

  if (n > slides.length) {
    slideIndex = 1;
  }
  if (n < 1) {
    slideIndex = slides.length;
  }
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex - 1].style.display = "block";
  dots[slideIndex - 1].className += " active";
}

let slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides((slideIndex += n));
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides((slideIndex = n));
}
