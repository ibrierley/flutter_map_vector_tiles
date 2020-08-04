# flutter_map_vector_tile

Vector tiles for flutter_map

This is a proof of concept of using Vector Tiles (currently just Mapbox). It's not ready yet, but it's a base to be explored from.

There are quite a few caveats:

It currently works by downloading a tile as a new tileprovider, decodes the tile, and then creates a png out of it. This is so straight away it can work with the existing tile_layer code that flutter_map uses. This may be ok for speed of dragging a tile, but you will lose the appeal of vector graphics at inbetween zoom levels, as it will just be resizing the png, rather than creating new vectors. It will recreate a new set of tiles for each zoom level though, so it works okish.

Due to having the decode and generate the new tiles, it can be a bit slow on creating/downloading a new tile set, so it depends on your use case, as to how reasonable it will be. If you need fluid zooming it's probably too slow. If you need slow moving about like a satnav, it may be ok.

There's a default styling I've set. This needs coding to support styles probably through a constructor or similar, and is a future addition (anyone welcome to have a bash!)

My code isn't well optimised, so there are some potential improvements with normal coding, but the slowness is mainly from decoding/painting/saving to image, so I would work on that first, and keep the code easy to follow at first.

Future improvement thoughts....

Get custom styling working.
Get an option to work only as a canvas working. There are some issues with getting the flutter_map info into the tile_provider though, thoughts welcome.
Get alternate tiles working, like geojson tiles, and other providers.
Test out if it's possible to batch up draws better, rather than per feature, can we batch them per z-level and style.





