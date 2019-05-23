+++
title = "Privacy Policy"

date = 2018-06-28T00:00:00
draft = false

# [header]
# image = ""
# caption = ""

+++

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
    <title>World Map Cup - Challenge #3</title>
    <meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.53.0/mapbox-gl.js'></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.53.0/mapbox-gl.css' rel='stylesheet' />
    <style>
        body { margin:0; padding:0; }
        #map { position:absolute; top:0; bottom:0; width:100%; }
    </style>
</head>
<body>

<style>
#map {
    position: fixed;
    width:50%;
}
.marker {
  background-image: url('red_pin.png');
  background-size: cover;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  cursor: pointer;
}
#features {
    width: 50%;
    margin-left: 50%;
    font-family: Tw Cen MT;
    overflow-y: scroll;
    background-color: #fafafa;
}
section {
    padding:  25px 50px;
    line-height: 25px;
    border-bottom: 1px solid #ddd;
    opacity: 0.25;
    font-size: 20px;
}
section.active {
    opacity: 1;
}
section:last-child {
    border-bottom: none;
    margin-bottom: 1000px;
}
</style>

<div id='map'></div>
<div id='features'>
    <section id='welcome' class='active'>
        <h3>The rise of Kpop in Chicago</h3>
        <p>Some text about Kpop</p>
    </section>
    <section id='section1' class='active'>
        <h3>Rosemont theatre</h3>
        <p>some text and a chart</p>
    </section>
    <section id='section2'>
        <h3>Allstate arena</h3>
        <p>Some text and a chart</p>
    </section>
    <section id='section3'>
        <h3>United center</h3>
        <p>Some more text and a chart</p>
    </section>
    <section id='section4'>
        <h3>Soldier field stadium</h3>
        <p>Some more text and a chart</p>
    </section>
</div>

<script>
mapboxgl.accessToken = 'pk.eyJ1Ijoid2NoYXNlMTQiLCJhIjoiY2p2dnYwOXBvMGJvNDQzcDkxcTZqNWd3dCJ9.UqxE9xtZJevAQem-lKCYnA';
var map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/wchase14/cjvzpvfxp1gy21co9wznzkg8z',
  center: [-87.567135,41.752585],
  zoom: 8.38
});

var geojson = {
  type: 'FeatureCollection',
  features: [{
    type: 'Feature',
    geometry: {
      type: 'Point',
      coordinates: [-87.86429301870476,41.976397596477256]
    },
    properties: {
      title: 'Rosemont theatre',
      description: 'BTS, The Red Bullet tour, 2015'
    }
  },
  {
    type: 'Feature',
    geometry: {
      type: 'Point',
      coordinates: [-87.88777282207525,42.0054804204529]
    },
    properties: {
      title: 'Allstate arena',
      description: 'BTS, Wings tour, 2017'
    }
  },
  {
    type: 'Feature',
    geometry: {
      type: 'Point',
      coordinates: [-87.67411877975991,41.880905127979304]
    },
    properties: {
      title: 'United center',
      description: 'BTS, Love Yourself tour, 2018'
    }
  },
  {
    type: 'Feature',
    geometry: {
      type: 'Point',
      coordinates: [-87.61671118585048,41.86244589403236]
    },
    properties: {
      title: 'Soldier Field stadium',
      description: 'BTS, Love Yourself - Speak Yourself tour, 2019'
    }
  }]
};
// add markers to map
geojson.features.forEach(function(marker) {

  // create a HTML element for each feature
  var el = document.createElement('div');
  el.className = 'marker';

  // make a marker for each feature and add to the map
  new mapboxgl.Marker(el)
    .setLngLat(marker.geometry.coordinates)
    .addTo(map);
});

var chapters = {
    'welcome': {
        bearing: 14.40,
        center: [-87.567135,41.752585],
        zoom: 8.38,
        speed: 0.6,
        pitch: 53.50
    },
    'section1': {
        bearing: 8.00,
        center: [-87.863541,41.976718],
        zoom: 16.27,
        speed: 0.5,
        pitch: 59.50
    },
    'section2': {
        center: [-87.887091,42.004897],
        bearing: 14.40,
        zoom: 16.00,
        speed: 0.5,
        pitch: 53.50
    },
    'section3': {
        bearing: 14.40,
        center: [-87.673674,41.880015],
        zoom: 16.00,
        speed: 0.5,
        pitch: 53.50
    },
    'section4': {
        bearing: 0.00,
        center: [-87.615715,41.861087],
        zoom: 15.78,
        speed: 0.5,
        pitch: 60.00
    },
};
// On every scroll event, check which element is on screen
window.onscroll = function() {
    var chapterNames = Object.keys(chapters);
    for (var i = 0; i < chapterNames.length; i++) {
        var chapterName = chapterNames[i];
        if (isElementOnScreen(chapterName)) {
            setActiveChapter(chapterName);
            break;
        }
    }
};
var activeChapterName = 'welcome';
function setActiveChapter(chapterName) {
    if (chapterName === activeChapterName) return;
    map.flyTo(chapters[chapterName]);
    document.getElementById(chapterName).setAttribute('class', 'active');
    document.getElementById(activeChapterName).setAttribute('class', '');
    activeChapterName = chapterName;
}
function isElementOnScreen(id) {
    var element = document.getElementById(id);
    var bounds = element.getBoundingClientRect();
    return bounds.top < window.innerHeight && bounds.bottom > 0;
}


</script>
</body>
</html>

