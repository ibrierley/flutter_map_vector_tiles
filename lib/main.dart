import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'vector_tile_plugin.dart';
import 'package:flutter_map_vector_tile/VectorTileWidget.dart';


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

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  Widget build(BuildContext context) {

    Optimisations optimisations = Optimisations(
        pinchZoomOption: true, // use hairlines for speed when zooming
        hairlineOption: true, // use hairlines on paths at low zoom (true recommended)
    );
    DebugOptions debugOptions = DebugOptions(
        tiles: false, // show a tile border
        labels: false, // show a label border thats used for label collision checks
        decoding: false, // show http gets and when decoding is done
        featureSummary: false,
        features: false,
        roads: false,
        skipRoadLabels: false
    );

    var fmap =  FlutterMap(
            mapController: mapController,
            options: new MapOptions(
              plugins: [
                VectorTilePlugin(),
              ],
              interactiveFlags: InteractiveFlag.all, // MapEventMoveStart& ~InteractiveFlag.rotate,
              center: LatLng(50.8323646,-0.1871463),
              zoom: 17.3,
              //rotation: 45,
            ),
            layers: [
              VectorTileLayerPluginOptions(
                urlTemplate: 'https://api.mapbox.com/v4/mapbox.mapbox-streets-v8/{z}/{x}/{y}.mvt?mapbox://styles/gibble/ckoe1dv003l7s17pb219opzj0&access_token=pk.eyJ1IjoiZ2liYmxlIiwiYSI6ImNqbjBlZDB6ejFrODcza3Fsa3o3eXR1MzkifQ.pC89zLnuSWrRdCkDrsmynQ',
                subdomains: ['a', 'b', 'c'],
                ///urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",



                useCanvas: false,
                useImages: false, //disabled, code currently removed, but could be added, not sure I currently see the benefit
                useBackupTiles: true, //use a previously loaded tile if current one not available yet
                usePerspective: false, // experimental, doesn't work with rotate on
                underZoom: 0, // how many zoom levels above current one to use instead, try 1 or 2 for example
                debugOptions: debugOptions,
                mapController: mapController,
                optimisations: optimisations,
              ),
            ],
          );

        return fmap;

  }


}

