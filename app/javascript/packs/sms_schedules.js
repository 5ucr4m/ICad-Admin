window.$ = window.jQuery = require('jquery');
require('select2');
require('sweetalert2');

import Swal from 'sweetalert2';
import superagent from 'superagent';
import Rails from '@rails/ujs';

window.addEventListener('DOMContentLoaded', () => {
  const phoneInput = document.querySelector('.phone');
  if (phoneInput) {
    new Cleave('.phone', {
      phone: true,
      phoneRegionCode: 'BR'
    });
  }
});

$(document).ready(function() {
  $('.btn-send-sms').on('click', function(e) {
    console.log($(this).data('schedule'));
    Swal.fire({
      title: 'Deseja realmente disparar as Mensagens?',
      text: "Este processo não pode ser revertido!",
      icon: 'question',
      showCancelButton: true,
      confirmButtonText: 'Sim',
      cancelButtonText: 'Não',
      reverseButtons: true
    }).then((result) => {
      if (result.value) {
        Rails.ajax({
          type: 'POST',
          url: `/sms_schedules/${$(this).data('schedule')}/send_sms_messages`,
          success: function(response) {
            Swal.fire(
              'Enviado!',
              'Em alguns instantes, os SMS irão ser recebidos.',
              'success')
          },
          error: function(error) {
            if(error) {
              Swal.fire(
                'Erro!',
                'Houve um erro ao enviar o lote de SMS.',
                'error'
              )
            }
          }
        });
      } else if (
        result.dismiss === Swal.DismissReason.cancel
      ) {
        Swal.fire(
          'Cancelado!',
          'O envio dos SMS foi cancelado.',
          'error'
        )
      }
    })
  })
});
