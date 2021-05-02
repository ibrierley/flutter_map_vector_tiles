import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'vector_tile_plugin.dart';
import 'package:flutter_map_vector_tile/VectorTileWidget.dart';
import 'package:flutter/rendering.dart';
import 'styles.dart';


void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = false;
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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Vector Tile Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  Widget build(BuildContext context) {
    var start = DateTime.now();

    var fmap =  FlutterMap(
            mapController: mapController,
            options: new MapOptions(
              plugins: [
                VectorTilePlugin(),
              ],
              interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              center: LatLng(50.8323646,-0.1871463),
              zoom: 12.3,
              ///rotation: 45,
            ),
            layers: [
              VectorTileLayerPluginOptions(
                urlTemplate: 'https://api.mapbox.com/v4/mapbox.mapbox-streets-v8/{z}/{x}/{y}.mvt?access_token=pk.eyJ1IjoiZ2liYmxlIiwiYSI6ImNqbjBlZDB6ejFrODcza3Fsa3o3eXR1MzkifQ.pC89zLnuSWrRdCkDrsmynQ',
                //subdomains: ['a', 'b', 'c'],
                useCanvas: true,
                useImages: false, //disabled,
                useBackupImages: false, //disabled
                usePerspective: false,
                levelUpDiff: 0,
                //vectorStyle: vectorStyle,
              ),
            ],
          );

        var end = DateTime.now().difference(start).inMicroseconds;
        print ("TIMING! Flutter_map main end time took $end");
        return fmap;
        return Text("Loading style...");

  }


}

