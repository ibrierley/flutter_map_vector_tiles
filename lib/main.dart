import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'vector_tile_plugin.dart';
import 'package:flutter_map_vector_tile/VectorTileWidget.dart';
import 'package:flutter_map_vector_tile/styles.dart';
import 'parse_expressions.dart';
import 'apikeys.dart';
import 'quickstyles.dart';
import 'osteststyle.dart';
import 'mapboxteststyle.dart';
import 'osmteststyle.dart';


void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintLayerBordersEnabled = true;
  //debugPaintPointersEnabled = false;
  //debugRepaintRainbowEnabled = false;
  //debugRepaintTextRainbowEnabled = false;
  //debugCheckElevationsEnabled = false;
  //debugDisableClipLayers = false;
  //debugDisablePhysicalShapeLayers = false;
  //debugDisableOpacityLayers = false;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vector Tile Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Vector Tile Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title = "Flutter Map"}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MapController? mapController;
  bool mapControllerReady = false;


  @override
  void initState() {
    super.initState();
    mapController = MapController();
    mapController?.onReady.then((_){print("mapcontroller ready...."); mapControllerReady = true; });

  }

  Widget build(BuildContext context) {

    var orientation = MediaQuery.of(context).orientation;
    print("${MediaQuery.of(context).orientation}");

    var testStylexx = {
      'default': ( paramsMap ) {
        return {
          'include': true,
          ///'default': [ [0, 22, { 'color': Colors.purple, 'strokeWidth': 0.0 }], ],
          'default': [ [0, 22, { 'color': ( params ) {
            if(params['type'] == "LINESTRING") {
              return Colors.black;
            } else {
              return Colors.brown;
            }
          }, 'strokeWidth': 0.0 }], ],
        };
      }
    };


    Optimisations optimisations = Optimisations(
        pinchZoomOption: true, // use hairlines for speed when zooming
        hairlineOption: true, // use hairlines on paths at low zoom (true recommended)
        useIsolates: false
    );
    DebugOptions debugOptions = DebugOptions(
        tiles: true, // show a tile border
        labels: false, // show a label border thats used for label collision checks
        decoding: false, // show http gets and when decoding is done
        featureSummary: false,
        features: false,
        roads: false,
        skipRoadLabels: false,
        missingFeatures: false,
    );

    print("$mapController $mapControllerReady");

    if(mapControllerReady && mapController != null)
      print("mapready ${mapController?.center}");

    var fmap =  FlutterMap(
      //key: ValueKey(MediaQuery.of(context).orientation),
            mapController: mapController,
            options: new MapOptions(
              plugins: [
                VectorTilePlugin(),
              ],
              interactiveFlags: InteractiveFlag.all, // MapEventMoveStart& ~InteractiveFlag.rotate,
              center: LatLng(50.8323646,-0.1871463),
              zoom: 8.3,
              //rotation: 45,
            ),
            layers: [
              VectorTileLayerPluginOptions(
                //urlTemplate: 'https://api.os.uk/maps/vector/v1/vts/tile/{z}/{y}/{x}.pbf?srs=3857&key=' + APIKeys.OS,
                urlTemplate: 'https://api.mapbox.com/v4/mapbox.mapbox-streets-v8/{z}/{x}/{y}.mvt?mapbox://styles/gibble/ckoe1dv003l7s17pb219opzj0&access_token=' + APIKeys.mapbox,

                ///subdomains: ['a', 'b', 'c'],
                ///urlTemplate: "https://tiles.stadiamaps.com/data/openmaptiles/{z}/{x}/{y}.pbf?api_key=" + APIKeys.stadia,
                ///urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                ///urlTemplate: "https://tiles.wmflabs.org/osm-no-labels/{z}/{x}/{y}.png",
                ///urlTemplate: "https://a.basemaps.cartocdn.com/rastertiles/voyager_labels_under/{z}/{x}/{y}@2x.png",
                ///urlTemplate: "https://a.basemaps.cartocdn.com/rastertiles/voyager_nolabels/{z}/{x}/{y}@2x.png",
                ///urlTemplate: "https://a.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}@2x.png",
                ///urlTemplate: "https://a.basemaps.cartocdn.com/dark_nolabels/{z}/{x}/{y}@2x.png",
                ///https://gis.stackexchange.com/questions/334057/base-map-with-no-labels-in-qgis
                ///https://wiki.openstreetmap.org/wiki/Tile_servers
                ///https://www.thunderforest.com/docs/vector-maps-api/
                ///https://mran.microsoft.com/snapshot/2018-03-29/web/packages/mapmisc/vignettes/mapLayers.html
                ///https://stamen.com/open-source/

                highZoomCanvas: 1000,
                useCanvas: true,
                useImages: false, //disabled, code currently removed, but could be added, not sure I currently see the benefit
                useBackupTiles: true, //use a previously loaded tile if current one not available yet
                usePerspective: false, // experimental, doesn't work with rotate on
                underZoom: 0, // how many zoom levels above current one to use instead, try 1 or 2 for example
                debugOptions: debugOptions,
                mapController: mapController,
                optimisations: optimisations,
                ///vectorStyle: Styles.stadiaClassColorStyles,
                //vectorStyle: //DefaultQuickStyles.mapBoxClassColorStyles,
                vectorStyle: mapboxtestStyle,
                ///vectorStyle: osmtestStyle
                ///vectorStyle: testStyle,
              ),


            ],
          );

        return fmap;

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


}

