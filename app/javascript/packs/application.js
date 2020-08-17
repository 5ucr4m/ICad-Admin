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
require('sweetalert2');
require('flatpickr');
require("chartkick").use(require("highcharts"));
require("trix");
require("@rails/actiontext");
require('channels');
require('@kollegorna/cocoon-vanilla-js');

import '../stylesheets/application';
import * as Pagy from './pagy.js.erb';
import superagent from 'superagent';
import * as $ from 'jquery';
import flatpickr from 'flatpickr';



window.Pagy = Pagy;
window.$ = window.jQuery = $;

require('select2')
require('select2/dist/js/i18n/pt-BR')

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
          return city
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

function ciapCodeSelect2() {
  $('.ciap-codes').select2({
    placeholder: 'Selecione',
    language: 'pt-BR',
    theme: 'bootstrap4',
    width: '100%',
    allowClear: true,
    ajax: {
      global: true,
      url: '/generic_models/carried_procedures.json',
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
        data = data.genericModels;
        return {
          results: data.map((cp) => {
            if (cp) {
              return {
                id: cp.id,
                text: `${cp.reference} - ${cp.name}`
              };
            }
          })
        };
      },
      cache: true
    }
  });
}

function cidCodeSelect2() {
  $('.cid-codes').select2({
    placeholder: 'Selecione',
    language: 'pt-BR',
    theme: 'bootstrap4',
    width: '100%',
    allowClear: true,
    ajax: {
      global: true,
      url: '/generic_models/carried_procedures.json',
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
        data = data.genericModels;
        return {
          results: data.map((cp) => {
            if (cp) {
              return {
                id: cp.id,
                text: `${cp.reference} - ${cp.name}`
              };
            }
          })
        };
      },
      cache: true
    }
  });
}

$(document).ready(function() {

  $('div').on('cocoon:after-insert', function (e, object) {
    $(object).find('.select2').select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true
    });
  });

  $('#patient-record-procedures').on('cocoon:after-insert', function(e, object) {
    $('.carried-procedures').select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/generic_models/carried_procedures.json',
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
          data = data.genericModels;
          return {
            results: data.map((cp) => {
              if (cp) {
                return {
                  id: cp.id,
                  text: `${cp.reference} - ${cp.name}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
  })

  $('#patient-soap-conditions').on('cocoon:after-insert', function(e, object) {
    ciapCodeSelect2();
    cidCodeSelect2();
  })

  $('#patient-soap-reasons').on('cocoon:after-insert', function(e, object) {
    ciapCodeSelect2();
    cidCodeSelect2();
  });

  $('#patient-soap-interventions').on('cocoon:after-insert', function(e, object) {
    ciapCodeSelect2();
    cidCodeSelect2();
  });

  $('#patient-soap-certificates').on('cocoon:after-insert', function(e, object) {
    ciapCodeSelect2();
    cidCodeSelect2();
  });

  $('#patient-soap-exams').on('cocoon:after-insert', function(e, object) {
    cidCodeSelect2();
    $('.exam-codes').select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/generic_models/exams.json',
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
          data = data.genericModels;
          return {
            results: data.map((cp) => {
              if (cp) {
                return {
                  id: cp.id,
                  text: `${cp.reference} - ${cp.name}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
  });

  $('#patient-soap-referrals').on('cocoon:after-insert', function(e, object) {
    cidCodeSelect2();
    $('.specialties').select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/generic_models/specialties.json',
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
          data = data.genericModels;
          return {
            results: data.map((cp) => {
              if (cp) {
                return {
                  id: cp.id,
                  text: `${cp.reference} - ${cp.name}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
  });

  $('#patient-soap-medicines').on('cocoon:after-insert', function(e, object) {
    $('.medicines').select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/medicines.json',
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
          data = data.medicines;
          return {
            results: data.map((medicine) => {
              if (medicine) {
                return {
                  id: medicine.id,
                  text: `${medicine.name}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
    $('.pharmaceutical-forms').select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/generic_models/pharmaceutical_forms.json',
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
          data = data.genericModels;
          return {
            results: data.map((cp) => {
              if (cp) {
                return {
                  id: cp.id,
                  text: `${cp.reference} - ${cp.name}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
    $('.administration-ways').select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/generic_models/administration_ways.json',
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
          data = data.genericModels;
          return {
            results: data.map((cp) => {
              if (cp) {
                return {
                  id: cp.id,
                  text: `${cp.reference} - ${cp.name}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
    $('.recipe-types').select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/generic_models/recipe_types.json',
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
          data = data.genericModels;
          return {
            results: data.map((cp) => {
              if (cp) {
                return {
                  id: cp.id,
                  text: `${cp.reference} - ${cp.name}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
    $('.dose-frequency-types').select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/generic_models/dose_frequencies.json',
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
          data = data.genericModels;
          return {
            results: data.map((cp) => {
              if (cp) {
                return {
                  id: cp.id,
                  text: `${cp.reference} - ${cp.name}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
    $('.duration-types').select2({
      placeholder: 'Selecione',
      language: 'pt-BR',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true,
      ajax: {
        global: true,
        url: '/generic_models/duration_types.json',
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
          data = data.genericModels;
          return {
            results: data.map((cp) => {
              if (cp) {
                return {
                  id: cp.id,
                  text: `${cp.reference} - ${cp.name}`
                };
              }
            })
          };
        },
        cache: true
      }
    });
  });
});

window.addEventListener('load', Pagy.init);

window.addEventListener('DOMContentLoaded', function (e) {
  const zipInput = document.querySelector('.zip');
  const federalRegistryCnpj = document.querySelector('.federal-registry');
  const federalRegistryCpf = document.querySelector('.cpf');
  const phoneInput = document.querySelector('.phone');
  const dateInput = document.querySelector('.datepicker');
  const dateTimeInput = document.querySelector('.datepicker-time');

  if (phoneInput) {
    new Cleave('.phone', {
      phone: true,
      phoneRegionCode: 'BR'
    });
  }

  flatpickr('.datepicker', {
    enableTime: false,
    inline: true
  });

  flatpickr('.datepicker-time', {
    enableTime: true
  });

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
    language: 'es',
    theme: 'bootstrap4',
    width: '100%',
    allowClear: true
  });

  $('.select2-multiple').select2({
    theme: 'bootstrap4',
    language: 'pt-BR',
    width: '100%',
    multiple: true,
    placeholder: 'Selecione'
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
          data = data.cities;
          return {
            results: data.map((city) => {
              if (city) {
                return {
                  id: city.id,
                  text: `${city.code} - ${city.name} - ${city.state}`
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
          data = data.genericModels;
          return {
            results: data.map((cboType) => {
              if (cboType) {
                return {
                  id: cboType.id,
                  text: `${cboType.reference} - ${cboType.name}`
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
          data = data.genericModels;
          return {
            results: data.map((cboType) => {
              if (cboType) {
                return {
                  id: cboType.id,
                  text: `${cboType.reference} - ${cboType.name}`
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
          data = data.genericModels;
          return {
            results: data.map((cboType) => {
              if (cboType) {
                return {
                  id: cboType.id,
                  text: `${cboType.reference} - ${cboType.name}`
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
        processResults: function (data) {
          data = data.families;
          return {
            results: data.map((data) => {
              if (data) {
                return {
                  id: data.id,
                  text: `${data.handbookNumber}`
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
          data = data.familyMembers;
          return {
            results: data.map((fm) => {
              if (fm) {
                return {
                  id: fm.id,
                  text: `${fm.cnsNumber} - ${fm.name}`
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

