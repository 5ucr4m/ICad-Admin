require('highcharts');

import Highcharts from 'highcharts';

function columnChart(options) {
  const superagent = require('superagent');
  const nocache = require('superagent-no-cache');

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
      .use(nocache).end((err, res) => {
      console.log(err);
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
  const data = {"01/06/2019": 2, "02/06/2019": 0, "03/06/2019": 1, "04/06/2019": 2, "05/06/2019": 0};

  columnChart({id: 'families', url: '/families/chart_by_day', name: 'Famílias'});
  columnChart({id: 'family-members', url: '/family_members/chart_by_day', name: 'Membros Famíliares'});
  columnChart({
    id: 'home-visit-registrations',
    url: '/home_visit_registrations/chart_by_day',
    name: 'Visitas Famíliares'
  });

}, false);
