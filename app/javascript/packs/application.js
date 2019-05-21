window.$ = window.jQuery = require('jquery');
require("@rails/ujs").start();
require("@rails/activestorage").start();
require('superagent');
require('popper.js');
require('bootstrap');
require('cleave.js');
require('cleave.js/dist/addons/cleave-phone.br');
require('select2');
require("channels");

import superagent from 'superagent';

function addLoadingSpin() {
  let divSpin = document.createElement('div');
  divSpin.classList.add('loader');
  const dimmer = document.querySelector('.dimmer');
  dimmer.insertBefore(divSpin, dimmer.firstChild);
  dimmer.classList.add('active');
}

function removeLoadingSpin() {
  const dimmer = document.querySelector('.dimmer');
  dimmer.firstChild.remove();
  dimmer.classList.remove('active');
}

function addZipError() {
  const zipInput = document.querySelector('.zip');
  zipInput.classList.add('is-invalid');

  let divError = document.createElement('div');
  divError.classList.add('invalid-feedback');
  divError.appendChild(document.createTextNode('CEP inválido ou não encontrado.'));
  zipInput.parentNode.insertBefore(divError, document.querySelector('zip'));

  // Add button danger status
  const btnZip = document.querySelector('.btn-zip');
  btnZip.classList.remove('btn-primary');
  btnZip.classList.add('btn-danger');
}

function removeZipError() {
  let feedback = document.querySelector('.invalid-feedback');
  if(feedback) {
    feedback.remove();
  }
  document.querySelector('.zip').classList.remove('is-invalid');

  // Remove button danger status
  const btnZip = document.querySelector('.btn-zip');
  btnZip.classList.remove('btn-danger');
  btnZip.classList.add('btn-primary');
}

function getZip(e) {
  console.log('test');
  const zipValue = document.querySelector('.zip').value;
  console.log(zipValue);
  if (zipValue) {
    removeZipError();
    addLoadingSpin();
    const url = 'http://viacep.com.br/ws/' + zipValue.replace(/[^a-zA-Z0-9-. ]/g, '') + '/json';
    superagent.get(url).end(function (error, response) {
      const failed = response.body.erro;
      if (!failed) {
        const address = response.body;
        document.querySelector('input[id$=\'_patio\']').value = address.logradouro.toUpperCase();
        document.querySelector('input[id$=\'_district\']').value = address.bairro.toUpperCase();
        document.querySelector('input[id$=\'_complement\']').value = address.complemento.toUpperCase();
        //document.querySelector('input[id$=\'_city\']').value = address.localidade;
      }
      setTimeout(() => {
        removeLoadingSpin();
        if(failed) {
          addZipError();
        } else {
          removeZipError();
        }
      }, 1000);
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
  const zipInput = document.querySelector('.zip');

  $('.select2').each(function (i, el) {
    $(el).select2({
      placeholder: 'Selecione',
      theme: 'bootstrap4',
      width: '100%'
    });
  });

  if (zipInput) {
    new Cleave('.zip', {
      delimiters: ['-'],
      blocks: [5, 3],
      delimiterLazyShow: true
    });
  }

  document.querySelector('.btn-zip').addEventListener('click', getZip, {once: false});
}, false);

