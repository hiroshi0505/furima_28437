window.addEventListener('click', function(){

  const input = document.getElementById('item_price');
  const addTax = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  input.addEventListener('input', function(){
    if (input.value.match(/^[0-9]+$/) ) {
      const tax = (input.value * 0.1)
      addTax.textContent = Math.floor(tax)
      profit.textContent = Math.floor(input.value - tax)
    } else {
      addTax.textContent = "半角数字のみ入力可能"
      profit.textContent = "半角数字のみ入力可能"
    }
    
  })
})