window.addEventListener('load', () => {
    const priceInput = document.getElementById("price");
console.log(priceInput)
    priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue*0.1)
    profit.innerHTML = Math.floor(inputValue*1.1)
})
})
