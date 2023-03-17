window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    const ProfitDom = document.getElementById("profit");
    // 販売手数料を計算する処理
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    // 出品価格から販売手数料を引く処理
    ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
});