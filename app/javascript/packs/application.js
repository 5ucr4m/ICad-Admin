require('jquery');
require("@rails/ujs").start();
require("@rails/activestorage").start();
require('superagent');
require('popper.js');
require('bootstrap');
require('cleave.js');
require('cleave.js/dist/addons/cleave-phone.br');
require('select2');
require("channels");

window.$ = window.jQuery = require('jquery');

import superagent from 'superagent';

function getZip(e) {
  let zip = e.target.value.replace('-', '').replace('.', '');
  if(zip) {
    const url = 'http://viacep.com.br/ws/' + zip + '/json';
    superagent.get(url).end(function(error, response) {
      if(!response.body.erro) {
        const address = response.body;
        document.querySelector('input[id$=\'_patio\']').value = address.logradouro;
        document.querySelector('input[id$=\'_district\']').value = address.bairro;
        document.querySelector('input[id$=\'_complement\']').value = address.complemento;
        //document.querySelector('input[id$=\'_city\']').value = address.localidade;
      }
    });
  }
}

function formatFederalRegistry(e) {
  const federalRegistry = new Cleave('.federal-registry', {
    numeral: true,
    numericOnly: true
  });
  const personType = document.querySelector('.person-type').value;
  if (personType === 'PF') {
    federalRegistry.destroy();
    new Cleave('.federal-registry', {
      delimiters: ['.', '.', '-'],
      blocks: [3, 3, 3, 2],
      delimiterLazyShow: true
    });
  } else {
    federalRegistry.destroy();
    new Cleave('.federal-registry', {
      delimiters: ['.', '.', '/', '-'],
      blocks: [2, 3, 3, 4, 2],
      delimiterLazyShow: true
    });
  }
}

window.addEventListener('DOMContentLoaded', function (e) {
  $('.select2').each(function(i, el) {
    $(el).select2({
      placeholder: 'Selecione',
      theme: 'bootstrap4',
      width: '100%'
    });
  });
}, false);

