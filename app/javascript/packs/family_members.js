window.$ = window.jQuery = require('jquery');
require('select2');

window.addEventListener('DOMContentLoaded', () => {
  new Cleave('.phone', {
    phone: true,
    phoneRegionCode: 'BR'
  });
});
