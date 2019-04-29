require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

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
  input.parentNode.insertBefore(element, input.nextSibling);
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

