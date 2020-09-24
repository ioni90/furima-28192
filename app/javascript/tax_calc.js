function tax_calc() {
  
  const itemPrice = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  itemPrice.addEventListener('change', () => {
    //販売手数料 (10%)
    const formData = itemPrice.value;
    const taxCalc = formData * 0.1;
    addTaxPrice.innerHTML = Math.round(taxCalc);
    
    //販売利益
    profit.innerHTML = formData - Math.round(taxCalc);
  });
}

window.addEventListener("load", tax_calc);