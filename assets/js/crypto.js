var buttons = document.getElementsByClassName("crypto");

var showAddress = function () {
  let currency = this.getAttribute("currency");
  let wallet = this.getAttribute("wallet");
  prompt(currency, wallet);
};

for (var i = 0; i < buttons.length; i++) {
  buttons[i].addEventListener('click', showAddress, false);
}
