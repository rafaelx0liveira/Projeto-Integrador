const closeMessage = document.querySelector("#close-message");
const msg = document.querySelector("#alert-update");
const img = document.querySelector("#imagem-produto");
const inputImg = document.querySelector("#imagem");
const selectAlcoolico = document.querySelector("#alcoolico");
const inputGraduacao = document.querySelector("#graduacao_alcoolica");

closeMessage.addEventListener("click", () => {
  msg.classList.remove("d-flex");
  msg.style.display = "none";
});

setTimeout(()=>{
  msg.classList.remove("d-flex");
  msg.style.display = "none";
},2200)

function modifyImage(){
  
  const newSrc = inputImg.value;
  img.setAttribute("src", newSrc)
  
}

function handleSelectAlcoolico(){
  let selected = selectAlcoolico.value;
  
  if(selected === "1"){    
    //console.log(typeof selected)
    inputGraduacao.removeAttribute("disabled");
  }else{
    inputGraduacao.setAttribute("disabled", "true");
    inputGraduacao.value = "";
  }
  
}

