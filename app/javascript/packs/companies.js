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
          return city
        });
        data = data[0];
        const newOption = new Option(`${data.code} - ${data.name} - ${data.state}`, data.id, true, true);
        $(cityInput).append(newOption).trigger('change');
        $(cityInput).val(data.id);
      }
    });
}

document.addEventListener('DOMContentLoaded', () => {

  new Cleave('.federal-registry', {
    numericOnly: true,
    delimiters: ['.', '.', '/', '-'],
    blocks: [2, 3, 3, 4, 2],
    delimiterLazyShow: true
  });
}, false);
