require("@rails/ujs").start();
require("@rails/activestorage").start();
require('superagent');
require('popper.js');
require('bootstrap');
require('cleave.js');
require('cleave.js/dist/addons/cleave-phone.br');
require('select2');
require("channels");

import './pagy.js.erb';

window.$ = window.jQuery = require('jquery');
window.Pagy = Pagy;
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

function getCity(cityCode) {
  superagent.get('/cities.json')
    .query({ q: {search_cont: cityCode} })
    .end((err, res) => {
      if(res.body) {
        let data = res.body.data.map((city) => { return city.attributes});
        data = data[0];
        data['id'] = res.body.data[0].id;
        console.log(data);
        const newOption = new Option(`${data.code} - ${data.name} - ${data.state}`, data.id, true, true);
        $('select[id$=\'_city_id\']').append(newOption).trigger('change');
      }
    });
}

function getZip(e) {
  const zipValue = document.querySelector('.zip').value;
  if (zipValue) {
    removeZipError();
    addLoadingSpin();
    const url = 'http://viacep.com.br/ws/' + zipValue.replace(/[^a-zA-Z0-9-. ]/g, '') + '/json';
    superagent.get(url).end(function (error, response) {
      const failed = response.body.erro;
      setTimeout(() => {
        if (!failed) {
          const address = response.body;
          document.querySelector('input[id$=\'_patio\']').value = address.logradouro.toUpperCase();
          document.querySelector('input[id$=\'_district\']').value = address.bairro.toUpperCase();
          document.querySelector('input[id$=\'_complement\']').value = address.complemento.toUpperCase();
          if(address.ibge) {
            getCity(address.ibge);
          }
        }
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

window.addEventListener('load', Pagy.init);

window.addEventListener('DOMContentLoaded', function (e) {
  const zipInput = document.querySelector('.zip');

  $('.select2').select2({
    placeholder: 'Selecione',
    theme: 'bootstrap4',
    width: '100%'
  });

  if (zipInput) {
    new Cleave('.zip', {
      delimiters: ['-'],
      blocks: [5, 3],
      delimiterLazyShow: true
    });
  }

  const btnZip = document.querySelector('.btn-zip');

  if(btnZip) {
    btnZip.onclick = getZip;
  }

  $('.cities').each((i, el) => {
    $(el).select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      ajax: {
        global: true,
        url: '/cities.json',
        dataType: 'json',
        delay: 300,
        minimumInputLength: 3,
        data: function (params) {
          return {
            q: {
              search_cont: params.term ? params.term : document.querySelector('.select2-selection__rendered').innerHTML.split(' - ')[1]
            },
            page: 1
          };
        },
        processResults: function (data) {
          return {
            results: data.data.map((city) => {
              if (city) {
                return {
                  id: city.id,
                  text: `${city.attributes.code} - ${city.attributes.name} - ${city.attributes.state}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
  });
}, false);

