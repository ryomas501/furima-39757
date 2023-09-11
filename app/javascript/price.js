document.addEventListener("DOMContentLoaded", function () {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log("inputValue:", inputValue);
      const commission = document.getElementById("add-tax-price");
      commission.innerHTML = Math.floor(inputValue * 0.1);
      console.log(commission);

      const profitNumber = document.getElementById("profit");
      const value_result =  Math.floor(inputValue * 0.1);
      profitNumber.innerHTML = Math.floor(inputValue - value_result);
      profitNumber.innerHTML = profitValue;
      console.log(profitNumber);
    });
  }
});