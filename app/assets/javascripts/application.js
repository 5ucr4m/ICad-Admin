//= require cocoon

$(document).ready(function() {

  $('div').on('cocoon:before-insert', function (e, object) {
    console.log(object);
    $(object).find('.select2').select2({
      placeholder: 'Selecione',
      theme: 'bootstrap4',
      width: '100%',
      allowClear: true
    });
  });
});
