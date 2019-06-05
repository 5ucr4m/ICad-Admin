require('highcharts');

import Highcharts from 'highcharts';

function columnChart(options) {
  const superagent = require('superagent');
  const nocache = require('superagent-no-cache');

  superagent.get(options.url)
    .use(nocache).end((err, res) => {
    if (res.body) {
      document.getElementById(`loader_${options.id}`).classList.remove('loader');
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
}

document.addEventListener('DOMContentLoaded', function () {
  const data = {"01/06/2019": 2, "02/06/2019": 0, "03/06/2019": 1, "04/06/2019": 2, "05/06/2019": 0};

  columnChart({id: 'families', url: '/families/chart_by_day', name: 'Famílias'});
  columnChart({id: 'family-members', url: '/family_members/chart_by_day', name: 'Membros Famíliares'});

}, false);
