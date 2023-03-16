const closeMessage = document.querySelector("#close-message");
const alert = document.querySelector("#alert-update");

closeMessage.addEventListener("click", () => {
  alert.classList.remove("d-flex");
  alert.style.display = "none";
});

setTimeout(()=>{
  alert.classList.remove("d-flex");
  alert.style.display = "none";
},2200)
