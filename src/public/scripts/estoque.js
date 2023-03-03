const stockStatus = document.querySelector('#estoque');

if(stockStatus.textContent.toLowerCase() === 'em estoque') {
    stockStatus.style.background = "green";
    stockStatus.style.fontWeight = 'bold'
} else {
    stockStatus.style.background = "red";
    stockStatus.style.fontWeight = 'bold'
}