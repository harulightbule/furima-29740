window.addEventListener("load", function(){
  const price = document.getElementById("item-price")
  // *viewを反映させたい部分を取得して変数に代入
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener('keyup', function(){
    const value = price.value
    const  fee = Math.ceil(value * 0.1)
    const rate = Math.floor(value * 0.9)

    tax.innerHTML = fee
    profit.innerHTML = rate
  })
})




