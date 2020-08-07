console.log("OK")
window.addEventListener("keyup", function(){


    var Price = document.getElementById("item_price").value
   
     var SalesCommission = document.getElementById('add-tax-price')
     var SalesCommission = Price * 0.1;
     var Profit = document.getElementById('profit')
     var Profit = Price * 0.9;

     $('#add-tax-price').html(SalesCommission);
     $('#profit').html(Profit); 

 })

// keyup
// 入力した値を取得
// 販売手数料と販売利益を計算
// 計算した値を画面に表示

 //salesCommission = Number(SalesCommission).val();
 //profit = Number(Profit).val();
