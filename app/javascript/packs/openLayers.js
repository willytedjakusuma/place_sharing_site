import 'ol/ol.css';
import Map from 'ol/Map';
import View from 'ol/View';
import {toLonLat} from 'ol/proj';
import {Circle as CircleStyle, Fill, Stroke, Style} from 'ol/style';
import {Draw, Modify} from 'ol/interaction';
import {OSM, Vector as VectorSource} from 'ol/source';
import {Tile as TileLayer, Vector as VectorLayer} from 'ol/layer';

var raster = new TileLayer({
  source: new OSM(),
});

var vector = new VectorLayer({
  source: new VectorSource(),
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
  target: 'locationMap',
  view: new View({
    center: [12549359.847966878, -810178.3174638947],
    zoom: 1,
  }),
});

var modify = new Modify({source: vector.getSource()});
map.addInteraction(modify);

var lastFeature, draw;
var removeLastFeature = () => {
    if (lastFeature) vector.getSource().removeFeature(lastFeature);
};

function addInteraction() {
    if (draw) map.removeInteraction(draw);
    draw = new Draw({
        source: vector.getSource(),
        type: "Point"
    });
    draw.on('drawend', (e) => {
        removeLastFeature();
        lastFeature = e.feature;
        const coords = toLonLat(e.feature.getGeometry().getCoordinates());
        document.getElementById('location_longitude').value = coords[0];
        document.getElementById('location_latitude').value = coords[1];
    });
    map.addInteraction(draw);
};

addInteraction();
