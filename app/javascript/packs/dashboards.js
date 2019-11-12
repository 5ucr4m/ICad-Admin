require('highcharts');
require('mapbox-gl');

import Highcharts from 'highcharts';

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
  columnChart({id: 'chart-families', url: '/charts/chart_families', name: 'Famílias'});
  columnChart({id: 'chart-family-members', url: '/charts/chart_family_members', name: 'Membros Famíliares'});
  columnChart({
    id: 'chart-home-registrations',
    url: '/charts/chart_home_registrations',
    name: 'Cadastros Residênciais'
  });
  columnChart({
    id: 'chart-individual-registrations',
    url: '/charts/chart_individual_registrations',
    name: 'Cadastros Individuais'
  });
  columnChart({
    id: 'chart-home-visit-registrations',
    url: '/charts/chart_home_visit_registrations',
    name: 'Visitas Famíliares'
  });
}, false);
