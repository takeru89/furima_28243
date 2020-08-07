window.addEventListener('load', function() {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price"); 
  const profit = document.getElementById("profit");

  const priceReg = /^([1-9]\d*|0)$/;
  const message = "半角数字のみ入力可能";

  priceInput.addEventListener("input", (function() {
    priceInt = priceInput.value;
    if (priceInt.match(priceReg)) {
      addTaxPrice.innerHTML = Math.floor(priceInt * 0.1);
      profit.innerHTML = Math.floor(priceInt * 0.9);
    } else {
      addTaxPrice.innerHTML = message;
      profit.innerHTML = message;
    }  
  }));
})