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
});
