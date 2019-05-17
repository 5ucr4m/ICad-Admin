require('jquery');
require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require('superagent');
require('popper.js');
require('bootstrap');
require('cleave.js');
require('cleave.js/dist/addons/cleave-phone.br');
require("channels");

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

/**
 * Generate elements after check errors
 * @param message
 */
function generateElement(message) {
  let el = document.createElement('div');
  el.setAttribute('class', 'invalid-feedback');
  el.innerHTML = message;
  return el;
}

/**
 * Remove elements before check errors
 * @param className
 */
function removeElements(className) {
  let elements = document.body.getElementsByClassName(className);
  while (elements.length > 0) {
    elements[0].parentNode.removeChild(elements[0]);
  }
}

/**
 * Remove is-invalid class before check errors
 * @param className
 */
function removeInvalidClass(className) {
  let inputs = document.body.getElementsByClassName(className);
  let labels = document.body.getElementsByClassName('label-invalid');
  while (inputs.length > 0) {
    inputs[0].classList.remove(className);
  }
  while (labels.length > 0) {
    labels[0].classList.remove('label-invalid');
  }
}

/**
 * Insert element after check errors
 * @param input
 * @param element
 */
function insertElement(input, element) {
  input.classList.add('is-invalid');
  input.nextSibling.after(element);
}

/**
 * Handle form errors
 * @param modelName
 * @param errors
 */
function handleFormErrors(modelName, errors) {
  let fields = Object.keys(errors);
  let inputs = document.querySelector('form').elements;

  for (let input = 0; input < inputs.length; input++) {
    fields.forEach(function (field, index) {
      let inputName = inputs[input].name.includes('_id]') ?
        modelName.id + '[' + field + '_id]' : modelName.id + '[' + field + ']';
      if (inputs[input].name === inputName) {
        inputs[input].labels[0].classList.add('label-invalid');
        if (errors[field].length > 1) {
          errors[field].forEach(function (f, i) {
            insertElement(inputs[input], generateElement(f));
          });
        } else {
          insertElement(inputs[input], generateElement(errors[field]));
        }
      }
    });
  }
}

/**
 * Remove invalid feedback elements and invalid input classes
 */
function removeInvalidFeedback() {
  removeElements('invalid-feedback');
  removeInvalidClass('is-invalid');
}

window.addEventListener('turbolinks:load', function (e) {
  const btnSubmit = document.querySelector('.btn-submit');
  const btnCancel = document.querySelector('.btn-cancel');

  if (btnSubmit) {
    btnSubmit.addEventListener('click', function (e) {
      document.body.addEventListener('ajax:error', function (event) {
        removeInvalidFeedback();
        handleFormErrors(document.querySelector('form'), event.detail[0]);
      });
    });
  }

  if (btnCancel) {
    btnCancel.addEventListener('click', function (e) {
      removeInvalidFeedback();
    });
  }
}, false);

