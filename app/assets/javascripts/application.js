//= require cocoon

$(document).ready(function() {

  $('div').on('cocoon:before-insert', function (e, object) {
    $(object).find('.select2').select2({
      placeholder: 'Selecione',
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
});
