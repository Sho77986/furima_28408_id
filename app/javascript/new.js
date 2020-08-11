
window.addEventListener("load", function(){

  const priceField =document.getElementById("item_price")

  priceField.addEventListener("keyup", function(){ 


    const Price = document.getElementById("item_price").value
  
    let SalesCommission = document.getElementById('add-tax-price')
    let SalesCommission = Price * 0.1;
    let Profit = document.getElementById('profit')
    let Profit = Price * 0.9;
 
    $('#add-tax-price').html(SalesCommission);
    $('#profit').html(Profit); 
 
   })

});

// keyup
// 入力した値を取得
// 販売手数料と販売利益を計算
// 計算した値を画面に表示

 //salesCommission = Number(SalesCommission).val();
 //profit = Number(Profit).val();
