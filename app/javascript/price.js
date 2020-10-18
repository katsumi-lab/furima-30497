window.addEventListener('load', () => {
  const contents = document.getElementById("item-price");
  const tax_field = document.getElementById("add-tax-price");
  const profit_field = document.getElementById("profit");
  
  contents.addEventListener("input",function(e){
  let price = contents.value;
  let tax = price * 0.1;
  let profit = (price - tax);
  tax_field.textContent = tax;
  profit_field.textContent = profit;
  })
});