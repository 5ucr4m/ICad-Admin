require('highcharts');
require('mapbox-gl');

import Highcharts from 'highcharts';
import {Calendar} from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interaction from '@fullcalendar/interaction';
import ptBrLocale from '@fullcalendar/core/locales/pt-br';
import Rails from '@rails/ujs';

const mapboxgl = require('mapbox-gl/dist/mapbox-gl');

function columnChart(options) {
  const superagent = require('superagent');

  let dimmer = document.getElementById(`dimmer_${options.id}`);
  let loader = document.getElementById(`loader_${options.id}`);

  if (dimmer) {
    dimmer.classList.add('active');
  }
  if (loader) {
    loader.classList.add('loader');
  }

  setTimeout(function () {
    superagent.get(options.url)
      .accept('application/json').end((err, res) => {
      if (res.body) {
        dimmer.classList.remove('active');
        loader.classList.remove('loader');
        Highcharts.chart(options.id, {
          title: false,
          yAxis: [{
            title: false
          }],
          xAxis: {
            categories: Object.keys(res.body)
          },
          series: [{
            name: options.name,
            type: 'column',
            colorByPoint: true,
            data: Object.values(res.body),
            showInLegend: false
          }]
        });
      }
    });
  }, 1000);
}

document.addEventListener('DOMContentLoaded', function () {
  if (document.getElementById('chart-families')) {
    columnChart({id: 'chart-families', url: '/charts/chart_families', name: 'Famílias'});
  }

  if (document.getElementById('chart-family-members')) {
    columnChart({id: 'chart-family-members', url: '/charts/chart_family_members', name: 'Membros Famíliares'});
  }

  if (document.getElementById('chart-home-registrations')) {
    columnChart({
      id: 'chart-home-registrations',
      url: '/charts/chart_home_registrations',
      name: 'Cadastros Residênciais'
    });
  }

  if (document.getElementById('chart-individual-registrations')) {
    columnChart({
      id: 'chart-individual-registrations',
      url: '/charts/chart_individual_registrations',
      name: 'Cadastros Individuais'
    });
  }

  if (document.getElementById('chart-home-visit-registrations')) {
    columnChart({
      id: 'chart-home-visit-registrations',
      url: '/charts/chart_home_visit_registrations',
      name: 'Visitas Famíliares'
    });
  }

  var calendar = document.getElementById('calendar');

  if (calendar) {
    var calendarInstance = new Calendar(calendar, {
      locale: ptBrLocale,
      selectable: true,
      header: {
        left: 'prev today',
        center: 'title',
        right: 'next'
      },
      defaultView: 'dayGridMonth',
      plugins: [dayGridPlugin, interaction],
      dateClick: function(info) {
        $('#appointment-date').val(info.dateStr);
        Rails.fire(document.querySelector('#form-search'), 'submit');
      }
    });

    calendarInstance.render();
  }

  $('#health-professional').on('change', function () {
    if ($(this).val() !== '') {
      Rails.fire(document.querySelector('#form-search'), 'submit');
    }
  });

  $(document).on('ajax:beforeSend', function() {
    $('.dimmer').addClass('active');
    $('.dimmer-content').html('<div class="card-body my-5"></div>');
  });
}, false);
