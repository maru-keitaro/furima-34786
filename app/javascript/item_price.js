window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(addTaxDom);

    const profitNumber = document.getElementById("profit");
    const addTaxValue = (Math.floor(inputValue * 0.1));
    addTaxDom.innerHTML = addTaxValue;
    profitNumber.innerHTML = (Math.floor(inputValue - addTaxValue));
    console.log(profitNumber);

  });
});
