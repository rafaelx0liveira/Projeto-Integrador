console.log ('Script vinculado')

const inputCep = document.querySelector ('#cep')
const inputRua = document.querySelector ('#rua')
const inputNumero = document.querySelector ('#numero')
const inputBairro = document.querySelector ('#bairro')
const inputCidade = document.querySelector ('#cidade')
const inputEstado = document.querySelector ('#estado')
const URL_API_CEP = `https://brasilapi.com.br/api/cep/v2/`
const CONFIG = {       
    method: 'GET',
    headers: {
    'Content-Type': 'application/json'}
    }


inputCep.addEventListener ('keypress', verificarTamanhoCep)
inputCep.addEventListener ('blur', fetchData)

function verificarTamanhoCep (event) {
    if (event.target.value.length > 7){
       event.preventDefault () 
    }
}

async function fetchData (){
    const numero = inputCep.value
    const response = await fetch(`${URL_API_CEP}${numero}`, CONFIG)
    
    const data = await response.json()
    
    const { city:cidade, neighborhood:bairro, state:estado, street:rua } = data

    inputBairro.value = bairro
    inputCidade.value = cidade
    inputEstado.value = estado
    inputRua.value = rua
    
}
