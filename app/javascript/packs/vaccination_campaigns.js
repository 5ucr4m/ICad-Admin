import superagent from 'superagent';
import * as $ from 'jquery';

function menMarker(color) {
  let divMale = document.createElement('div');
  let iconMale = document.createElement('i');
  iconMale.classList.add('fas');
  iconMale.classList.add('fa-male');
  iconMale.classList.add('fa-4x');
  iconMale.classList.add('text-' + color);
  divMale.append(iconMale);
  return divMale;
}

function womanMarker(color) {
  let divFemale = document.createElement('div');
  let iconFemale = document.createElement('i');
  iconFemale.classList.add('fas');
  iconFemale.classList.add('fa-female');
  iconFemale.classList.add('fa-4x');
  iconFemale.classList.add('text-' + color);
  divFemale.append(iconFemale);
  return divFemale;
}

function teenageMarker(color) {
  let divTeenage = document.createElement('div');
  let iconTeenage = document.createElement('i');
  iconTeenage.classList.add('fas');
  iconTeenage.classList.add('fa-male');
  iconTeenage.classList.add('fa-3x');
  iconTeenage.classList.add('text-' + color);
  divTeenage.append(iconTeenage);
  return divTeenage;
}

function childMarker(color) {
  let divChild = document.createElement('div');
  let iconChild = document.createElement('i');
  iconChild.classList.add('fas');
  iconChild.classList.add('fa-child');
  iconChild.classList.add('fa-3x');
  iconChild.classList.add('text-' + color);
  divChild.append(iconChild);
  return divChild;
}

function newbornMarker(color) {
  let divNewborn = document.createElement('div');
  let iconNewborn = document.createElement('i');
  iconNewborn.classList.add('fas');
  iconNewborn.classList.add('fa-baby');
  iconNewborn.classList.add('fa-3x');
  iconNewborn.classList.add('text-' + color);
  divNewborn.append(iconNewborn);
  return divNewborn;
}

function elderlyMarker(color) {
  let divElderly = document.createElement('div');
  let iconElderly = document.createElement('i');
  iconElderly.classList.add('fas');
  iconElderly.classList.add('fa-blind');
  iconElderly.classList.add('fa-4x');
  iconElderly.classList.add('text-' + color);
  divElderly.append(iconElderly);
  return divElderly;
}

function buildMarker(index, color) {
  switch (parseInt(index)) {
    case 0:
      return menMarker(color);
    case 1:
      return womanMarker(color);
    case 2:
      return teenageMarker(color);
    case 3:
      return childMarker(color);
    case 4:
      return newbornMarker(color);
    case 5:
      return elderlyMarker(color);
    default:
      return menMarker(color);
  }
}

function buildMap(data) {
  console.log(data);
  mapboxgl.accessToken = 'pk.eyJ1IjoidGlhZ29jYXNzaW8iLCJhIjoiY2p4dW1wbWs4MTZxczNjcW0xN2d2NmFjMiJ9.DmiiFFq3jPkdaDsoyjRDYw';

  var features = [];

  if (data) {
    features = data.map((v) => {
      var lng = v.lng;
      var lat = v.lat;
      var patientType = v.patientType;
      var vaccinated = v.vaccinated ? 'success' : 'danger';
      return {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [lng, lat]
        },
        properties: {
          active: true,
          name: v.name,
          url: v.url,
          gender: v.gender,
          age: v.age,
          patientType: patientType,
          vaccinated: vaccinated
        }
      };
    });
  }

  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/light-v10',
    center: [-42.8291298, -5.0944576],
    zoom: 11
  });

  var mapInfo = {
    type: 'FeatureCollection',
    features: features
  };

  mapInfo.features.forEach(function (marker) {
    if (marker.properties.active) {
      new mapboxgl.Marker(buildMarker(marker.properties.patientType, marker.properties.vaccinated))
        .setLngLat(marker.geometry.coordinates)
        .setPopup(new mapboxgl.Popup({offset: 25})
          .setHTML('<h4>' + '<a href="'+ marker.properties.url + '">'+ marker.properties.name +'</a>' + '</h4><p>IDADE: ' + marker.properties.age + '</p><p>GÊNERO: ' + marker.properties.gender + '</p>'))
        .addTo(map);
    }
  });
}

function getVaccinations(e) {
  e.preventDefault();
  let filterBy = $('#filter_by');
  let ageFrom = $('#age_from');
  let ageTo = $('#age_to');
  let vaccinated = $('#vaccinated');

  let query = {
    filter_by: filterBy.val() || '',
    age_from: ageFrom.val() || '',
    age_to: ageTo.val() || '',
    vaccinated: vaccinated.val() || ''
  };
  if (query) {
    superagent.get(`/vaccination_campaigns/${location.href.split('/')[4]}/update_map`)
      .set('Accept', 'text/javascript')
      .query(query)
      .end((err, res) => {
        if (res.body) {
          buildMap(res.body.data);
        }
      });
  }
}

$(document).ready(function () {
  console.log('test');
  const filterBy = $('#filter_by');
  const ageFrom = $('#age_from');
  const ageTo = $('#age_to');
  const vaccinated = $('#vaccinated');

  $(filterBy).on('change', function (e) {
    getVaccinations(e);
  });
  $(ageFrom).on('change', function (e) {
    getVaccinations(e);
  });
  $(ageTo).on('change', function (e) {
    getVaccinations(e);
  });
  $(vaccinated).on('change', function (e) {
    getVaccinations(e);
  });

  buildMap(null);
});
