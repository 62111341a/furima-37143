window.addEventListener('load', () => {
    const priceInput = document.getElementById("price");
    priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue*0.1)
    profit.innerHTML = Math.floor(priceInput.value-(inputValue*0.1))
})
})
