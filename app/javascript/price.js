document.addEventListener("DOMContentLoaded", function () {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = parseFloat(priceInput.value);
      const commission = document.getElementById("add-tax-price");
      commission.innerHTML = Math.floor(inputValue * 0.1);
      commission.innerHTML = commissionValue;
      const profitNumber = document.getElementById("profit");
      const value_result = inputValue * 0.1;
      profitNumber.innerHTML = Math.floor(inputValue - value_result);
      profitNumber.innerHTML = profitValue;
    });
  }
});