window.$ = window.jQuery = require('jquery');
require('select2');

window.addEventListener('DOMContentLoaded', () => {
  const phoneInput = document.querySelector('.phone');
  if(phoneInput) {
    new Cleave('.phone', {
      phone: true,
      phoneRegionCode: 'BR'
    });
  }
});
