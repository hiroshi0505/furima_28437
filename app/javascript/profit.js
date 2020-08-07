// clickした場合にイベント発火
window.addEventListener('click', function(){

  // 価格入力のidを取得し、item_price変数に代入
  const item_price = document.getElementById("item_price")
  // 販売手数料のidを取得し、add_tax変数に代入
  const add_tax = document.getElementById("add-tax-price")
  // 販売利益のidを取得し、profit変数に代入
  const profit = document.getElementById("profit")

  // item_priceにinputした場合にイベント発火
  item_price.addEventListener('input', function(){

    // valueメソッドでitem_priceの数値を取得し、0.1をかけ、tax変数に代入
    const tax = item_price.value * 0.1
    //item_price.valueが半角数字の場合 
    if (item_price.value.match(/[0-9]/)) {
      // 販売手数料をMath.floorメソッドで小数点切り捨てし、
      // toLocaleString()で3桁づつカンマ区切りにして、
      // innerHTMLメソッドでadd_taxのHTML要素の中身を取得
      add_tax.innerHTML = Math.floor(tax).toLocaleString()
      // 販売利益をMath.floorメソッドで小数点切り捨てし、
      // toLocaleString()で3桁づつカンマ区切りにして、
      // innerHTMLメソッドでprofitのHTML要素の中身を取得
      profit.innerHTML = Math.floor(item_price.value - tax).toLocaleString()
    }
    //item_price.valueが半角数字以外の場合の出力 
    else {
      add_tax.innerHTML = "半角数字のみ入力可能"
      profit.innerHTML = "半角数字のみ入力可能"
    }
  })
})