window.$ = window.jQuery = require('jquery');

require('select2');

import superagent from 'superagent';

function getSelectedCity() {
  const cityInput = $('select[id$=\'city_id\']');
  superagent.get('/cities.json')
    .query({q: {search_cont: cityInput.value}})
    .end((err, res) => {
      if (res.body) {
        let data = res.body.data.map((city) => {
          return city.attributes
        });
        data = data[0];
        const newOption = new Option(`${data.code} - ${data.name} - ${data.state}`, data.id, true, true);
        $(cityInput).append(newOption).trigger('change');
        $(cityInput).val(data.id);
      }
    });
}

document.addEventListener('DOMContentLoaded', () => {

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

  new Cleave('.federal-registry', {
    numericOnly: true,
    delimiters: ['.', '.', '/', '-'],
    blocks: [2, 3, 3, 4, 2],
    delimiterLazyShow: true
  });
}, false);
