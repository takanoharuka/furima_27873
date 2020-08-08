$(function(){
  $('.price-input').on("keyup" , function(e){
    let price = $(".price-input").val();
    let Sales_profit = price * (1 - 10/100);
    let fee_amount = price * 10/100
    $('#add-tax-price').html(Sales_profit);
    $('#profit').html(fee_amount);
  })
});