window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const cal = inputValue / 10;
    addTaxDom.innerHTML = Math.floor(cal);

    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(inputValue - cal);
 })
});