window.addEventListener('DOMContentLoaded', () => {
  const moneyInput = document.querySelector('.money');

  if (moneyInput) {
    new Cleave('.money', {
      numeral: true,
      numeralDecimalMark: ',',
      delimiter: '.',
      prefix: 'R$ ',
      noImmediatePrefix: true,
      completeDecimalsOnBlur: true
    });
  }

  document.getElementById('pets')
    .addEventListener('cocoon:before-insert', function (e) {
    console.log(e);
    $(e.target).find('.select2').select2({
      placeholder: 'Selecione',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true
    });
  });
});
