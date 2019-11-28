import "core-js/stable";
import "regenerator-runtime/runtime";

require('jquery');
require("@rails/ujs").start();
require("@rails/activestorage").start();
require('superagent');
require('popper.js');
require('bootstrap/dist/js/bootstrap.bundle');
require('cleave.js');
require('selectize');
require('cleave.js/dist/addons/cleave-phone.br');
require('select2');
require("chartkick").use(require("highcharts"));
require("channels");

import '../stylesheets/application';
import * as Pagy from './pagy.js.erb';
import superagent from 'superagent';
import * as $ from 'jquery';

window.Pagy = Pagy;
window.$ = window.jQuery = $;

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
  if (feedback) {
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
    .query({q: {search_cont: cityCode}})
    .end((err, res) => {
      if (res.body) {
        let data = res.body.data.map((city) => {
          return city.attributes
        });
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
    const url = 'https://viacep.com.br/ws/' + zipValue.replace(/[^a-zA-Z0-9-. ]/g, '') + '/json';
    superagent.get(url).end(function (error, response) {
      const failed = response.body.erro;
      setTimeout(() => {
        if (!failed) {
          const address = response.body;
          document.querySelector('input[id$=\'_patio\']').value = address.logradouro.toUpperCase();
          document.querySelector('input[id$=\'_district\']').value = address.bairro.toUpperCase();
          document.querySelector('input[id$=\'_complement\']').value = address.complemento.toUpperCase();
          if (address.ibge) {
            getCity(address.ibge);
          }
        }
        removeLoadingSpin();
        if (failed) {
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
  const federalRegistryCnpj = document.querySelector('.federal-registry');
  const federalRegistryCpf = document.querySelector('.cpf');

  if (federalRegistryCpf) {
    new Cleave('.cpf', {
      delimiters: ['.', '.', '-'],
      blocks: [3, 3, 3, 2],
      delimiterLazyShow: true
    });
  }

  $('[data-toggle="card-collapse"]').on('click', function (e) {
    const card = 'div.card';
    const $card = $(this).closest(card);
    $card.toggleClass('card-collapsed');
    e.preventDefault();
    return false;
  });

  $('.select2').select2({
    placeholder: 'Selecione',
    theme: 'bootstrap4',
    width: '100%',
    allowClear: true
  });

  $('.select2-multiple').select2({
    theme: 'bootstrap4',
    width: '100%',
    multiple: true,
    placeholder: 'Selecione os Grupos'
  });

  $('.selectize').selectize();

  if (zipInput) {
    new Cleave('.zip', {
      delimiters: ['-'],
      blocks: [5, 3],
      delimiterLazyShow: true
    });
  }

  if (federalRegistryCnpj) {
    new Cleave('.federal-registry', {
      delimiters: ['.', '.', '/', '-'],
      blocks: [2, 3, 3, 4, 2],
      delimiterLazyShow: true
    });
  }

  const btnZip = document.querySelector('.btn-zip');

  if (btnZip) {
    btnZip.onclick = getZip;
  }

  $('.cities').each((i, el) => {
    $(el).select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
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

  $('.address-types').each((i, el) => {
    $(el).select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/generic_models/address_types.json',
        dataType: 'json',
        delay: 300,
        minimumInputLength: 3,
        data: function (params) {
          return {
            q: {
              search_cont: params.term ? params.term : 'a'
            },
            page: 1
          };
        },
        processResults: function (data) {
          return {
            results: data.data.map((cboType) => {
              if (cboType) {
                return {
                  id: cboType.id,
                  text: `${cboType.attributes.reference} - ${cboType.attributes.name}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
  });

  $('.cbo-types').each((i, el) => {
    $(el).select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/generic_models/cbo_types.json',
        dataType: 'json',
        delay: 300,
        minimumInputLength: 3,
        data: function (params) {
          return {
            q: {
              search_cont: params.term ? params.term : 'a'
            },
            page: 1
          };
        },
        processResults: function (data) {
          return {
            results: data.data.map((cboType) => {
              if (cboType) {
                return {
                  id: cboType.id,
                  text: `${cboType.attributes.reference} - ${cboType.attributes.name}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
  });

  $('.ethnicity-types').each((i, el) => {
    $(el).select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/generic_models/ethnicity_types.json',
        dataType: 'json',
        delay: 300,
        minimumInputLength: 3,
        data: function (params) {
          return {
            q: {
              search_cont: params.term ? params.term : 'a'
            },
            page: 1
          };
        },
        processResults: function (data) {
          return {
            results: data.data.map((cboType) => {
              if (cboType) {
                return {
                  id: cboType.id,
                  text: `${cboType.attributes.reference} - ${cboType.attributes.name}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
  });

  $('.families').each((i, el) => {
    $(el).select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/families.json',
        dataType: 'json',
        delay: 300,
        minimumInputLength: 3,
        data: function (params) {
          return {
            q: {
              search_cont: params.term ? params.term : $(el).text()
            },
            page: 1
          };
        },
        processResults: function (response) {
          return {
            results: response.data.map((data) => {
              if (data) {
                return {
                  id: data.id,
                  text: `${data.attributes.handbookNumber}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
  });

  $('.family-members').each((i, el) => {
    $(el).select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/family_members.json',
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
            results: data.data.map((fm) => {
              if (fm) {
                return {
                  id: fm.id,
                  text: `${fm.attributes.cnsNumber} - ${fm.attributes.name}`
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
