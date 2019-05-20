window.$ = window.jQuery = require('jquery');
require('select2');

window.addEventListener('DOMContentLoaded', () => {
  $('select').each(function(i, el) {
    $(el).select2({
      placeholder: 'Selecione',
      theme: 'bootstrap4',
      width: '100%'
    });
  });

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
