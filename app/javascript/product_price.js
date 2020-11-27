window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  const benefitInput = document.getElementById("profit")
  const feeInput = document.getElementById("add-tax-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    feeInput.innerHTML = Math.floor(inputValue * 0.1)
  benefitInput.innerHTML = Math.floor(inputValue - (inputValue * 0.1))
  })
})









