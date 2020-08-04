import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'vector_tile_plugin.dart';

void main() {
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

  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        plugins: [
        ],
        //center: new LatLng(51.5, -0.09),
        center: new LatLng(50.8323646,-0.1871463),
        zoom: 15.3,
      ),
      layers: [
        TileLayerOptions(
            tileProvider: VectorTilesImageProvider(
              styles: {},
              tileLayerOptions: new TileLayerOptions(
                  ///urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                urlTemplate: 'http://a.tiles.mapbox.com/v4/mapbox.mapbox-streets-v8/{z}/{x}/{y}.mvt?access_token=pk.eyJ1IjoiZ2liYmxlIiwiYSI6ImNqbjBlZDB6ejFrODcza3Fsa3o3eXR1MzkifQ.pC89zLnuSWrRdCkDrsmynQ',
                  subdomains: ['a', 'b', 'c']
              ),
            ),
        ),
      ],
    );
  }
}
