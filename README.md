# flutter_map_vector_tile

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/F1F8E2YBE)

Vector tiles for flutter_map

SEE examples/main.dart for example of how to run it...  
Main code is in lib/vector_tile_plugin.dart  
The lib/vector_tile_pb.. files were generated using the vector_tile.proto file



This is a proof of concept of using Vector Tiles (currently just Mapbox). It's not ready yet, but it's a base to be explored from.

Features that "should" work.

Mapbox Vector tile processing with a default optimised for Flutter styling.

Flexible UnderZoom tile loading (loading tile levels from a lower zoom, in order to reduce the amount of tiles to download).

Collision detection on labels. There's a LOT of potential overlapping text. So this reduces it.

Labels kept upright during rotation.

Road labels that are angled to a road contour (not curved along it though, possible future enhancement, but will be some performance issues likely).

You can use png images instead of vector tiles, it will simply paint them on the Canvas. To use
set useImages: true and make sure you set the correct tile url for pngs, rather than Vector tiles.

[Example in action](https://www.youtube.com/watch?v=GsXPMghCawA&t=4s)


There are quite a few caveats:

It currently is just mapbox (but I think won't be tooooo tricky to extend)

Drawing many thick lines is slow on the Canvas, so mileage may very. I'm currently getting around this by converting to hairline widths on pinchzoom only. This is an option and can be turned off.

There's a default styling I've set. This needs coding to support proper styles probably through a constructor or similar, and is a future addition (anyone welcome to have a bash!)

Also needs a styling option to be passed to the layer.

It needs alternate tiles working, like geojson tiles, and other providers.






