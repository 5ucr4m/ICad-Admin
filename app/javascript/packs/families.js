window.$ = window.jQuery = require('jquery');
require('select2');

window.addEventListener('DOMContentLoaded', () => {
  const moneyInput = document.querySelector('.money');

  if(moneyInput) {
    new Cleave('.money', {
      numeral: true,
      numeralDecimalMark: ',',
      delimiter: '.',
      prefix: 'R$ ',
      noImmediatePrefix: true,
      completeDecimalsOnBlur: true
    });
  }
});
