const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const commission = document.getElementById("add-tax-price")
  commission.innerHTML = (Math.floor(inputValue * 0.1));
   console.log(commission);

   const profitNumber = document.getElementById("profit")
    const value_result = inputValue * 0.1
    console.log(value_result)
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
      console.log(profitNumber);
})