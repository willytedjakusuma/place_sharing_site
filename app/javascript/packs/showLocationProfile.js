import 'ol/ol.css';
import Map from 'ol/Map';
import View from 'ol/View';
import Feature from 'ol/Feature';
import Point from 'ol/geom/Point';
import {fromLonLat} from 'ol/proj';
import {Circle as CircleStyle, Fill, Stroke, Style} from 'ol/style';
import {OSM, Vector as VectorSource} from 'ol/source';
import {Tile as TileLayer, Vector as VectorLayer} from 'ol/layer';



let locFeatures = []
const locationsEl = document.getElementById('currentUserLocation');
let locations = locationsEl.dataset.locations;
JSON.parse(locations).forEach(element => {
  locFeatures.push(new Feature({ name: element.location_name, geometry: new Point(fromLonLat([element.longitude, element.latitude])) }));
});

var raster = new TileLayer({
  source: new OSM(),
});

var vector = new VectorLayer({
  source: new VectorSource({ features: locFeatures}),
  style: new Style({
    fill: new Fill({
      color: 'rgba(255, 255, 255, 0.2)',
    }),
    stroke: new Stroke({
      color: '#ffcc33',
      width: 2,
    }),
    image: new CircleStyle({
      radius: 7,
      fill: new Fill({
        color: '#ffcc33',
      }),
    }),
  }),
});

var map = new Map({
  layers: [raster, vector],
  target: 'currentUserPlaces',
  view: new View({
    center: [12549359.847966878, -810178.3174638947],
    zoom: 1,
  }),
});