var ostestStyle = {
  "version": 8,
  "sprite": "https://api.os.uk/maps/vector/v1/vts/resources/sprites/sprite",
  "glyphs": "https://api.os.uk/maps/vector/v1/vts/resources/fonts/{fontstack}/{range}.pbf",
  "sources": {
    "esri": {
      "type": "vector",
      "url": "https://api.os.uk/maps/vector/v1/vts"
    }
  },
  "layers": [
    {
      "id": "background",
      "type": "background",
      "paint": {
        "background-color": "#C5CDD0"
      }
    },
    {
      "id": "European_land/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "European_land",
      "maxzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#F1EFEC"
      }
    },
    {
      "id": "OS/GB_land/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "GB_land",
      "layout": {},
      "paint": {
        "fill-color": "#F1EFEC"
      }
    },
    {
      "id": "OS/National_parks/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "National_parks",
      "minzoom": 1,
      "maxzoom": 7,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4",
        "fill-opacity": 0.5
      }
    },
    {
      "id": "OS/Urban_areas/National/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Urban_areas",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 1,
      "maxzoom": 5,
      "layout": {},
      "paint": {
        "fill-color": "rgba(230,229,225,0.3)"
      }
    },
    {
      "id": "OS/Urban_areas/Regional/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Urban_areas",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 5,
      "maxzoom": 6,
      "layout": {},
      "paint": {
        "fill-color": "rgba(230,229,225,0.7)"
      }
    },
    {
      "id": "OS/Functional_sites/Air Transport/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Functional_sites",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#EEE7DD",
        "fill-opacity": 0.5
      }
    },
    {
      "id": "OS/Functional_sites/Education/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Functional_sites",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#EEE7DD",
        "fill-opacity": 0.5
      }
    },
    {
      "id": "OS/Functional_sites/Medical Care/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Functional_sites",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#EEE7DD",
        "fill-opacity": 0.5
      }
    },
    {
      "id": "OS/Functional_sites/Road Transport/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Functional_sites",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#EEE7DD",
        "fill-opacity": 0.5
      }
    },
    {
      "id": "OS/Functional_sites/Water Transport/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Functional_sites",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#EEE7DD",
        "fill-opacity": 0.5
      }
    },
    {
      "id": "OS/Greenspace:2/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Greenspace:2",
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#EAEEE7"
      }
    },
    {
      "id": "OS/Greenspace:2/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Greenspace:2",
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#EAEEE7",
        "line-width": {
          "stops": [
            [
              6,
              0
            ],
            [
              7,
              0
            ],
            [
              8,
              0
            ],
            [
              9,
              0
            ],
            [
              10,
              0.1
            ],
            [
              11,
              0.15
            ],
            [
              12,
              0.25
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicArea_1/Unclassified",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        48
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#efeee8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Landform Manmade",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        47
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#eae9e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Tidal Water",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        46
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Landform Natural",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        45
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#efece8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Glasshouse",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        44
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e1e5e1"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rail Natural",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        42
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e8e7e6"
      }
    },
    {
      "id": "OS/TopographicArea_1/Structure",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        43
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e0d2d1"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rail Manmade",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        41
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e8e7e6"
      }
    },
    {
      "id": "OS/TopographicArea_1/Path",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        40
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Inland Water",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        39
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Roadside Manmade",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        38
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#eae9e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Roadside Natural",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        37
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#efece8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Road Or Track",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        36
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Natural",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        34
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#efece8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Manmade",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        35
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#eae9e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Foreshore",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        30
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#E9E7E2"
      }
    },
    {
      "id": "OS/TopographicArea_1/Reeds/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        29
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Reeds/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        29
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Reeds/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Marsh/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        28
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#E4E5E4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Marsh/3",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        28
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Marsh/3"
      }
    },
    {
      "id": "OS/TopographicArea_1/Marsh/2",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        28
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Marsh/2"
      }
    },
    {
      "id": "OS/TopographicArea_1/Marsh/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        28
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Marsh/1"
      }
    },
    {
      "id": "OS/TopographicArea_1/Shingle",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        27
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e8e8e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Marsh/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        28
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Marsh/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Mud",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        26
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e9e7e2"
      }
    },
    {
      "id": "OS/TopographicArea_1/Sand",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        25
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e9e7e2"
      }
    },
    {
      "id": "OS/TopographicArea_1/Saltmarsh/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        24
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#e4e5e4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Heath/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        23
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e9ede6"
      }
    },
    {
      "id": "OS/TopographicArea_1/Saltmarsh/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        24
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Saltmarsh/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Heath/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        23
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Heath/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rough Grassland/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        22
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e9ede6"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rough Grassland/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        22
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Rough Grassland/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Scree/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        21
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e8e8e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Scree/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        21
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Scree/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rock/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        20
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e8e8e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rock/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        20
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Rock/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Boulders/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        19
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e8e8e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Boulders/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        19
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Boulders/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Scrub/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        18
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e9ede6"
      }
    },
    {
      "id": "OS/TopographicArea_1/Scrub/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        18
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Scrub/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Coppice Or Osiers/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        17
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Coppice Or Osiers/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        17
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Coppice Or Osiers/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Orchard/2",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        16
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Agricultural Land",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        15
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dde3da"
      }
    },
    {
      "id": "OS/TopographicArea_1/Orchard/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        16
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Orchard/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Coniferous Tree/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        14
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Coniferous Tree/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        14
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Coniferous Tree/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Nonconiferous Tree/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        13
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Nonconiferous Tree/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        13
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Nonconiferous Tree/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Mixed Woodland/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        12
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Footbridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        11
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e0d2d1"
      }
    },
    {
      "id": "OS/TopographicArea_1/Mixed Woodland/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        12
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Mixed Woodland/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Canal",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        10
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Step",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        9
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Track",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        8
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Pylon",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        7
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dddcd0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Traffic Calming",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        6
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Level Crossing",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Bridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e0d2d1"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rail Bridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dedddd"
      }
    },
    {
      "id": "OS/TopographicArea_1/Road Bridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Archway",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dddbd6"
      }
    },
    {
      "id": "OS/TopographicArea_1/Multi Surface",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#f2eee4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Cliff",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        32
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Cliff",
        "fill-opacity": 0.4
      }
    },
    {
      "id": "OS/TopographicArea_1/Slope",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        31
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Slope",
        "fill-opacity": 0.4
      }
    },
    {
      "id": "OS/Woodland:3/Local/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Woodland:3",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 8,
      "maxzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/Woodland:3/National/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Woodland:3",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 1,
      "maxzoom": 6,
      "layout": {},
      "paint": {
        "fill-color": "rgba(216,221,212,0.6)"
      }
    },
    {
      "id": "OS/Woodland:3/Regional/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Woodland:3",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 6,
      "maxzoom": 8,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/District_buildings/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "District_buildings",
      "minzoom": 6,
      "maxzoom": 8,
      "layout": {},
      "paint": {
        "fill-color": "#E1E0DB"
      }
    },
    {
      "id": "OS/Local_buildings/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Local_buildings",
      "minzoom": 8,
      "maxzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#E1E0DB"
      }
    },
    {
      "id": "OS/Contours/Index",
      "type": "line",
      "source": "esri",
      "source-layer": "Contours",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 3,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#857A6A",
        "line-width": {
          "stops": [
            [
              3,
              0.1
            ],
            [
              4,
              0.15
            ],
            [
              5,
              0.4
            ],
            [
              6,
              0.4
            ],
            [
              7,
              0.5
            ],
            [
              8,
              0.6
            ],
            [
              9,
              0.8
            ],
            [
              10,
              1
            ],
            [
              11,
              1
            ],
            [
              12,
              1.2
            ]
          ]
        },
        "line-opacity": 0.3
      }
    },
    {
      "id": "OS/Contours/Normal",
      "type": "line",
      "source": "esri",
      "source-layer": "Contours",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#857A6A",
        "line-width": {
          "stops": [
            [
              8,
              0.4
            ],
            [
              9,
              0.4
            ],
            [
              10,
              0.5
            ],
            [
              11,
              0.6
            ],
            [
              12,
              0.7
            ]
          ]
        },
        "line-opacity": 0.3
      }
    },
    {
      "id": "OS/Surfacewater/Local",
      "type": "fill",
      "source": "esri",
      "source-layer": "Surfacewater",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0",
        "fill-outline-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/Surfacewater/National/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Surfacewater",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 2,
      "maxzoom": 3,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/Surfacewater/Regional/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Surfacewater",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 3,
      "maxzoom": 7,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/Foreshore/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Foreshore",
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#E9E7E2"
      }
    },
    {
      "id": "OS/TopographicArea_2/Structure",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        6
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e0d2d1"
      }
    },
    {
      "id": "OS/TopographicArea_2/Manmade",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#eae9e8"
      }
    },
    {
      "id": "OS/TopographicArea_2/Building/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dddbd6"
      }
    },
    {
      "id": "OS/TopographicArea_2/Bridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e0d2d1"
      }
    },
    {
      "id": "OS/TopographicArea_2/Rail Bridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dedddd"
      }
    },
    {
      "id": "OS/TopographicArea_2/Road Bridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_2/Archway",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dddbd6"
      }
    },
    {
      "id": "OS/TopographicLine/Property Closing Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          6,
          6
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Step",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-width": {
          "stops": [
            [
              2,
              0.4
            ],
            [
              13,
              0.4
            ],
            [
              14,
              0.8
            ],
            [
              15,
              1.2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Mean High Water",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c5cdd0",
        "line-width": {
          "stops": [
            [
              2,
              0.8
            ],
            [
              13,
              0.9
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2.1
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Traffic Calming",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#ffffff",
        "line-dasharray": [
          4,
          4
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Standard Gauge Track",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#a7a39b",
        "line-width": {
          "stops": [
            [
              13,
              0.8
            ],
            [
              14,
              1.2
            ],
            [
              15,
              2.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Mean Low Water",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c5cdd0",
        "line-width": {
          "stops": [
            [
              13,
              0.5
            ],
            [
              14,
              1
            ],
            [
              15,
              1.6
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Path",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        6
      ],
      "minzoom": 11,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          6,
          4
        ],
        "line-width": {
          "stops": [
            [
              12,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Overhead Construction",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        7
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c4c3bf",
        "line-dasharray": [
          2,
          2
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Culvert",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        8
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c5cdd0",
        "line-width": {
          "stops": [
            [
              13,
              0.5
            ],
            [
              14,
              1
            ],
            [
              15,
              1.8
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Pylon",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        9
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#cfcfc9",
        "line-width": {
          "stops": [
            [
              13,
              1
            ],
            [
              14,
              1.8
            ],
            [
              15,
              2.6
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Ridge Or Rock Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        10
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-width": {
          "stops": [
            [
              13,
              1.3
            ],
            [
              14,
              2
            ],
            [
              15,
              2.6
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Narrow Gauge Track",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        11
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#a7a39b",
        "line-width": {
          "stops": [
            [
              13,
              0.5
            ],
            [
              14,
              1
            ],
            [
              15,
              1.8
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Railway Buffer",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        12
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#a7a39c",
        "line-width": {
          "stops": [
            [
              13,
              0.5
            ],
            [
              14,
              1
            ],
            [
              15,
              1.8
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Tunnel Edge",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        13
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#b0b6b7",
        "line-dasharray": [
          2.5,
          2.5
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.5
            ],
            [
              14,
              1
            ],
            [
              15,
              2.2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Line Of Posts",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        14
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#bababa",
        "line-dasharray": [
          4,
          4
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Drain",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        15
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c5cdd0",
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Default Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        16
      ],
      "minzoom": 11,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-width": {
          "stops": [
            [
              12,
              0.4
            ],
            [
              14,
              0.7
            ],
            [
              15,
              1.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicArea_1/Building/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        33
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dddbd6"
      }
    },
    {
      "id": "OS/TopographicLine/Building Outline",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        17
      ],
      "minzoom": 11,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#d5d4cd",
        "line-width": {
          "stops": [
            [
              12,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Edge Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        18
      ],
      "minzoom": 11,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          2,
          2
        ],
        "line-width": {
          "stops": [
            [
              12,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Road Or Track",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        19
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#d5d4cd",
        "line-dasharray": [
          4,
          4
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Building Division",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        20
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Inland water Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        21
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c5cdd0",
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/General Surface Natural Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        22
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          2,
          2
        ],
        "line-width": 0.7
      }
    },
    {
      "id": "OS/TopographicLine/Building Overhead Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        23
      ],
      "minzoom": 11,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          6,
          4
        ],
        "line-width": {
          "stops": [
            [
              12,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Landform Natural Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        24
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          4,
          4
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Historic Interest Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        25
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          4,
          4
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Landform Manmade Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        26
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          4,
          4
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Unclassified",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        27
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-width": {
          "stops": [
            [
              13,
              0.5
            ],
            [
              14,
              1
            ],
            [
              15,
              2.2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Waterlines/District",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 1
      }
    },
    {
      "id": "OS/Waterlines/Local",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 1
      }
    },
    {
      "id": "OS/Waterlines/Local_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 1
      }
    },
    {
      "id": "OS/Waterlines/MHW",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 8,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 1.6
      }
    },
    {
      "id": "OS/Waterlines/MHW_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 4,
      "maxzoom": 8,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 1.3
      }
    },
    {
      "id": "OS/Waterlines/MLW",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 6,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 0.8
      }
    },
    {
      "id": "OS/Waterlines/MLW_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 4,
      "maxzoom": 6,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 0.5
      }
    },
    {
      "id": "OS/Waterlines/National",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 1,
      "maxzoom": 2,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 0.4
      }
    },
    {
      "id": "OS/Waterlines/Regional",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 3,
      "maxzoom": 5,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 1
      }
    },
    {
      "id": "OS/Waterlines/Regional_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 2,
      "maxzoom": 3,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 0.5
      }
    },
    {
      "id": "OS/Roads/Tunnels,<Null>",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        19
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "line-color": "#4B4444",
        "line-dasharray": [
          4,
          2.5
        ],
        "line-width": {
          "stops": [
            [
              5,
              0.7
            ],
            [
              8,
              0.8
            ],
            [
              10,
              1.6
            ],
            [
              12,
              1.6
            ]
          ]
        },
        "line-opacity": 0.4
      }
    },
    {
      "id": "OS/Roads/A Road,0_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        6
      ],
      "minzoom": 3,
      "maxzoom": 4,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": 1.3
      }
    },
    {
      "id": "OS/Roads/Motorway,0_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 1,
      "maxzoom": 3,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": 2
      }
    },
    {
      "id": "OS/Roads/Primary,0_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 1,
      "maxzoom": 4,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              1.3
            ],
            [
              3,
              2
            ],
            [
              4,
              1.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/A Road,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        6
      ],
      "minzoom": 4,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              1.8
            ],
            [
              4,
              1.8
            ],
            [
              5,
              2.3
            ],
            [
              6,
              2.8
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.4
            ],
            [
              11,
              5.6
            ],
            [
              12,
              9.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/B Road,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        8
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              4,
              2.8
            ],
            [
              5,
              1.9
            ],
            [
              6,
              2.3
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.2
            ],
            [
              11,
              5.6
            ],
            [
              12,
              9.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Minor,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        10
      ],
      "minzoom": 6,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              5,
              1.875
            ],
            [
              6,
              1.875
            ],
            [
              8,
              2.5
            ],
            [
              9,
              3.3
            ],
            [
              10,
              4.2
            ],
            [
              11,
              4.6
            ],
            [
              12,
              6.7
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Local,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        13
      ],
      "minzoom": 8,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              9,
              2.3
            ],
            [
              10,
              2.9
            ],
            [
              11,
              3.75
            ],
            [
              12,
              5.4
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Restricted,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        15
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              9,
              2
            ],
            [
              10,
              2.7
            ],
            [
              11,
              3
            ],
            [
              12,
              4.2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Guided Busway,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        17
      ],
      "minzoom": 8,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              8,
              2
            ],
            [
              9,
              2
            ],
            [
              10,
              2.7
            ],
            [
              11,
              3.3
            ],
            [
              12,
              3.7
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Motorway,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 3,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              2,
              3
            ],
            [
              3,
              3
            ],
            [
              4,
              3.5
            ],
            [
              5,
              4
            ],
            [
              6,
              4.25
            ],
            [
              8,
              4.5
            ],
            [
              9,
              5
            ],
            [
              10,
              5.5
            ],
            [
              11,
              8
            ],
            [
              12,
              12
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Primary,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 4,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              2.5
            ],
            [
              4,
              2
            ],
            [
              5,
              2.5
            ],
            [
              6,
              3.3
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.6
            ],
            [
              11,
              6.7
            ],
            [
              12,
              10
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Motorway,1_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 1,
      "maxzoom": 3,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": 2
      }
    },
    {
      "id": "OS/Roads/Primary,1_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 1,
      "maxzoom": 4,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              1.3
            ],
            [
              3,
              2
            ],
            [
              4,
              1.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/A Road,1_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        7
      ],
      "minzoom": 3,
      "maxzoom": 4,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": 1.3
      }
    },
    {
      "id": "OS/Roads/A Road,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        7
      ],
      "minzoom": 4,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              1.9
            ],
            [
              4,
              1.9
            ],
            [
              5,
              2.3
            ],
            [
              6,
              2.8
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.4
            ],
            [
              11,
              5.6
            ],
            [
              12,
              9.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/B Road,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        9
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              4,
              2.8
            ],
            [
              5,
              1.9
            ],
            [
              6,
              2.3
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.2
            ],
            [
              11,
              5.6
            ],
            [
              12,
              9.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Minor,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        11
      ],
      "minzoom": 6,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              5,
              1.875
            ],
            [
              6,
              1.875
            ],
            [
              8,
              2.5
            ],
            [
              9,
              3.3
            ],
            [
              10,
              4.2
            ],
            [
              11,
              4.6
            ],
            [
              12,
              6.7
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Local,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        14
      ],
      "minzoom": 8,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              9,
              2.3
            ],
            [
              10,
              2.9
            ],
            [
              11,
              3.75
            ],
            [
              12,
              5.4
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Restricted,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        16
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              9,
              2
            ],
            [
              10,
              2.7
            ],
            [
              11,
              3
            ],
            [
              12,
              4.2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Guided Busway,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        18
      ],
      "minzoom": 8,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              8,
              2
            ],
            [
              9,
              2
            ],
            [
              10,
              2.7
            ],
            [
              11,
              3.3
            ],
            [
              12,
              3.7
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Motorway,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 3,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              2,
              3
            ],
            [
              3,
              3
            ],
            [
              4,
              3.5
            ],
            [
              5,
              4
            ],
            [
              6,
              4.25
            ],
            [
              8,
              4.5
            ],
            [
              9,
              5
            ],
            [
              10,
              5.5
            ],
            [
              11,
              8
            ],
            [
              12,
              12
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Primary,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 4,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              2.5
            ],
            [
              4,
              2
            ],
            [
              5,
              2.5
            ],
            [
              6,
              3.3
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.6
            ],
            [
              11,
              6.7
            ],
            [
              12,
              10
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Motorway,2_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 1,
      "maxzoom": 3,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": 2
      }
    },
    {
      "id": "OS/Roads/Primary,2_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 1,
      "maxzoom": 4,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              1.3
            ],
            [
              3,
              2
            ],
            [
              4,
              1.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Motorway,2/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 3,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              2,
              3
            ],
            [
              3,
              3
            ],
            [
              4,
              3.5
            ],
            [
              5,
              4
            ],
            [
              6,
              4.25
            ],
            [
              8,
              4.5
            ],
            [
              9,
              5
            ],
            [
              10,
              5.5
            ],
            [
              11,
              8
            ],
            [
              12,
              12
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Primary,2/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 4,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              2.5
            ],
            [
              4,
              2
            ],
            [
              5,
              2.5
            ],
            [
              6,
              3.3
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.5
            ],
            [
              11,
              6.7
            ],
            [
              12,
              10
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Minor,2/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        12
      ],
      "minzoom": 6,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              5,
              1.875
            ],
            [
              6,
              1.875
            ],
            [
              8,
              2.5
            ],
            [
              9,
              3.3
            ],
            [
              10,
              4.2
            ],
            [
              11,
              4.6
            ],
            [
              12,
              6.7
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Railways/Multi Track",
      "type": "line",
      "source": "esri",
      "source-layer": "Railways",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#a7a39c",
        "line-width": {
          "stops": [
            [
              6,
              0.75
            ],
            [
              7,
              0.75
            ],
            [
              8,
              0.75
            ],
            [
              9,
              0.75
            ],
            [
              10,
              0.75
            ],
            [
              11,
              1
            ],
            [
              12,
              0.8
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Railways/Narrow Gauge",
      "type": "line",
      "source": "esri",
      "source-layer": "Railways",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#a7a39c",
        "line-width": {
          "stops": [
            [
              8,
              0.2
            ],
            [
              9,
              0.2
            ],
            [
              10,
              0.2
            ],
            [
              11,
              0.25
            ],
            [
              12,
              0.25
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Railways/Single Track",
      "type": "line",
      "source": "esri",
      "source-layer": "Railways",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#a7a39c",
        "line-width": {
          "stops": [
            [
              6,
              0.6
            ],
            [
              7,
              0.6
            ],
            [
              8,
              0.6
            ],
            [
              9,
              0.6
            ],
            [
              10,
              0.6
            ],
            [
              11,
              0.8
            ],
            [
              12,
              0.8
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Railways/Tunnel",
      "type": "line",
      "source": "esri",
      "source-layer": "Railways",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "line-color": "#a7a39c",
        "line-dasharray": [
          4,
          2
        ],
        "line-width": {
          "stops": [
            [
              6,
              1
            ],
            [
              7,
              1
            ],
            [
              8,
              1
            ],
            [
              9,
              1
            ],
            [
              10,
              1
            ],
            [
              11,
              1.6
            ],
            [
              12,
              1.6
            ]
          ]
        }
      }
    },
    {
      "id": "OS/ETL",
      "type": "line",
      "source": "esri",
      "source-layer": "ETL",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#5B2F2F",
        "line-dasharray": [
          6,
          3
        ],
        "line-width": {
          "stops": [
            [
              9,
              1.3
            ],
            [
              10,
              1.3
            ],
            [
              11,
              2.2
            ],
            [
              12,
              1.8
            ]
          ]
        },
        "line-opacity": 0.3
      }
    },
    {
      "id": "OS/Railway_stations/Light Rapid Transit Station",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Railway_stations/Light Rapid Transit Station",
        "icon-size": {
          "stops": [
            [
              8,
              0.5
            ],
            [
              9,
              0.7
            ],
            [
              10,
              0.8
            ],
            [
              11,
              0.9
            ],
            [
              12,
              1
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/Light Rapid Transit Station And London Underground Station",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Railway_stations/Light Rapid Transit Station And London Underground Station",
        "icon-size": {
          "stops": [
            [
              8,
              0.5
            ],
            [
              9,
              0.7
            ],
            [
              10,
              0.8
            ],
            [
              11,
              0.9
            ],
            [
              12,
              1
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/Light Rapid Transit Station And London Underground Station_1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Railway_stations/Light Rapid Transit Station And London Underground Station_1",
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/Light Rapid Transit Station And Railway Station",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Railway_stations/Light Rapid Transit Station And Railway Station",
        "icon-size": {
          "stops": [
            [
              8,
              0.7
            ],
            [
              9,
              0.7
            ],
            [
              10,
              0.8
            ],
            [
              11,
              0.9
            ],
            [
              12,
              1
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/London Underground Station",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Railway_stations/London Underground Station",
        "icon-size": {
          "stops": [
            [
              8,
              0.6
            ],
            [
              9,
              0.7
            ],
            [
              10,
              0.8
            ],
            [
              11,
              0.9
            ],
            [
              12,
              1
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/Railway Station",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Railway_stations/Railway Station",
        "icon-size": {
          "stops": [
            [
              8,
              0.6
            ],
            [
              9,
              0.7
            ],
            [
              10,
              0.8
            ],
            [
              11,
              0.9
            ],
            [
              12,
              0.9
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/Railway Station And London Underground Station",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Railway_stations/Railway Station And London Underground Station",
        "icon-size": {
          "stops": [
            [
              8,
              0.6
            ],
            [
              9,
              0.8
            ],
            [
              10,
              0.8
            ],
            [
              11,
              0.9
            ],
            [
              12,
              1
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/Railway Station And London Underground Station_1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Railway_stations/Railway Station And London Underground Station_1",
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Airports",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Airports",
      "minzoom": 4,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Airports",
        "icon-size": {
          "stops": [
            [
              5,
              0.85
            ],
            [
              6,
              0.85
            ],
            [
              7,
              0.85
            ],
            [
              8,
              0.85
            ],
            [
              9,
              1
            ],
            [
              10,
              1
            ],
            [
              11,
              1
            ],
            [
              12,
              1
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-color": "#6A6F73",
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/TopographicPoint/Spot Height",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 12,
      "layout": {
        "icon-image": "OS/TopographicPoint/Spot Height",
        "icon-size": {
          "stops": [
            [
              13,
              0.6
            ],
            [
              14,
              1
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Site Of Heritage",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Site Of Heritage",
        "icon-size": {
          "stops": [
            [
              14,
              1.2
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Positioned Nonconiferous Tree",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Positioned Nonconiferous Tree",
        "icon-size": {
          "stops": [
            [
              14,
              1
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#89A489"
      }
    },
    {
      "id": "OS/TopographicPoint/Inland Water",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Inland Water",
        "icon-size": {
          "stops": [
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6C8499"
      }
    },
    {
      "id": "OS/TopographicPoint/Roadside",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Roadside",
        "icon-size": {
          "stops": [
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Overhead Construction",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Overhead Construction",
        "icon-size": {
          "stops": [
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Rail",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        6
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Rail",
        "icon-size": {
          "stops": [
            [
              14,
              1
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Positioned Coniferous Tree",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        7
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Positioned Coniferous Tree",
        "icon-size": {
          "stops": [
            [
              14,
              1
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#89A489"
      }
    },
    {
      "id": "OS/TopographicPoint/Triangulation Point Or Pillar",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        8
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Triangulation Point Or Pillar",
        "icon-size": {
          "stops": [
            [
              14,
              1.25
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Historic Interest",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        9
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Historic Interest",
        "icon-size": {
          "stops": [
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Landform",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        10
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Landform",
        "icon-size": {
          "stops": [
            [
              14,
              1
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Tidal Water",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        11
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Tidal Water",
        "icon-size": {
          "stops": [
            [
              14,
              1.4
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6C8499"
      }
    },
    {
      "id": "OS/TopographicPoint/Structure",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        12
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Structure",
        "icon-size": {
          "stops": [
            [
              14,
              1.4
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicSymbol/Culvert Symbol",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicSymbol",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/CartographicSymbol/Culvert Symbol",
        "icon-size": {
          "stops": [
            [
              14,
              1.6
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-rotate": [
          "get",
          "angle"
        ],
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicSymbol/Bench Mark Symbol",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicSymbol",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/CartographicSymbol/Bench Mark Symbol",
        "icon-size": {
          "stops": [
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-rotate": [
          "get",
          "angle"
        ],
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicSymbol/Road Related Flow Symbol",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicSymbol",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/CartographicSymbol/Road Related Flow Symbol",
        "icon-size": {
          "stops": [
            [
              14,
              1.2
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-rotate": [
          "get",
          "angle"
        ],
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/Names/National/Capital:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Capital:1",
      "maxzoom": 5,
      "layout": {
        "icon-image": "OS/Names/National/Capital:1",
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-color": "rgba(85,89,92,0)"
      }
    },
    {
      "id": "OS/Names/National/Country",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Country",
      "maxzoom": 5,
      "layout": {
        "icon-image": "OS/Names/National/Country",
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-color": "rgba(85,89,92,0)"
      }
    },
    {
      "id": "OS/CartographicText/label/Small Buildings - Rotate Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class79",
        79
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Light"
        ],
        "text-size": 12.4,
        "text-anchor": "center",
        "text-offset": [
          0.107527,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle79"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name79}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - NE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class64",
        64
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-letter-spacing": 0.05,
        "text-field": "{_name64}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - NE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class74",
        74
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle74"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name74}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - NE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class97",
        97
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle97"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name97}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - NE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class87",
        87
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle87"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name87}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class72",
        72
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-rotate": [
          "get",
          "_label_angle72"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name72}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - North (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class73",
        73
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle73"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name73}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - North (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class61",
        61
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom",
        "text-letter-spacing": 0.05,
        "text-field": "{_name61}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - South (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class99",
        99
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle99"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name99}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - North (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class96",
        96
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle96"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name96}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class95",
        95
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "center",
        "text-rotate": [
          "get",
          "_label_angle95"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name95}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - South (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class89",
        89
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle89"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name89}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - North (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class86",
        86
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle86"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name86}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class85",
        85
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-rotate": [
          "get",
          "_label_angle85"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name85}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - South (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class76",
        76
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle76"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name76}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - South (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class66",
        66
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-letter-spacing": 0.05,
        "text-field": "{_name66}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class53",
        53
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "center",
        "text-offset": [
          0.0952381,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle53"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name53}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - North (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class54",
        54
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle54"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name54}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - SW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class100",
        100
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle100"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name100}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - SW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class90",
        90
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle90"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name90}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - SW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class77",
        77
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle77"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name77}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - SW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class67",
        67
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-right",
        "text-letter-spacing": 0.05,
        "text-field": "{_name67}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - NE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class55",
        55
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle55"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name55}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - NW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class78",
        78
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle78"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name78}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - NW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class68",
        68
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-right",
        "text-letter-spacing": 0.05,
        "text-field": "{_name68}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - SE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class56",
        56
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle56"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name56}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - NW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class101",
        101
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle101"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name101}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - NW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class91",
        91
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle91"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name91}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - Rotate Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class69",
        69
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle69"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name69}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - South (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class57",
        57
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle57"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name57}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Rotate Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class92",
        92
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "center",
        "text-offset": [
          0.117647,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle92"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name92}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Rotate Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class82",
        82
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle82"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name82}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class60",
        60
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-letter-spacing": 0.05,
        "text-field": "{_name60}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - SW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class58",
        58
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle58"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name58}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - SE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class75",
        75
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle75"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name75}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - SE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class98",
        98
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle98"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name98}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - SE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class88",
        88
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle88"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name88}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - NW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class59",
        59
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle59"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name59}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - SE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class65",
        65
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-left",
        "text-letter-spacing": 0.05,
        "text-field": "{_name65}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Rotate West (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class52",
        52
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle52"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name52}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Rotate Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class50",
        50
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle50"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name50}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Rotate Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class40",
        40
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle40"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name40}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class43",
        43
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle43"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name43}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - North (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class44",
        44
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle44"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name44}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - NE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class45",
        45
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle45"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name45}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - SE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class46",
        46
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle46"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name46}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - South (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class47",
        47
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle47"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name47}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - SW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class48",
        48
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle48"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name48}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - NW(1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class49",
        49
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle49"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name49}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Rotate East (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class51",
        51
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle51"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name51}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Rotate West (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class42",
        42
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle42"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name42}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Small Buildings - Rotate East (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class80",
        80
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Light"
        ],
        "text-size": 12.4,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle80"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name80}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Rotate West (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class94",
        94
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle94"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name94}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Rotate West (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class84",
        84
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle84"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name84}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Rotate East (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class93",
        93
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle93"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name93}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Rotate East (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class83",
        83
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle83"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name83}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - Rotate West (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class71",
        71
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle71"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name71}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - West (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class63",
        63
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "right",
        "text-letter-spacing": 0.05,
        "text-field": "{_name63}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - East (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class62",
        62
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "left",
        "text-letter-spacing": 0.05,
        "text-field": "{_name62}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Rotate East (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class41",
        41
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle41"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name41}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - Rotate East (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class70",
        70
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle70"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name70}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Small Buildings - Rotate West (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class81",
        81
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Light"
        ],
        "text-size": 12.4,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle81"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name81}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - Rotate West (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class32",
        32
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle32"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name32}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - NW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class39",
        39
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle39"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name39}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - SW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class38",
        38
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle38"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name38}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - South (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class37",
        37
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle37"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name37}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - SE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class36",
        36
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle36"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name36}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - NE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class35",
        35
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle35"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name35}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - North (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class34",
        34
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle34"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name34}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class33",
        33
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "center",
        "text-offset": [
          0.0930233,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle33"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name33}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - Rotate Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class30",
        30
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "center",
        "text-offset": [
          0.0930233,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle30"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name30}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - Rotate East (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class31",
        31
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle31"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name31}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - Rotate Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class20",
        20
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle20"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name20}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - Rotate East (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class21",
        21
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle21"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name21}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - Rotate West (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class22",
        22
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle22"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name22}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class23",
        23
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle23"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name23}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - North (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class24",
        24
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle24"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name24}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - NE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class25",
        25
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle25"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name25}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - SE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class26",
        26
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle26"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name26}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - South (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class27",
        27
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle27"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name27}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - SW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class28",
        28
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle28"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name28}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - NW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class29",
        29
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle29"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name29}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Rotate West (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class12",
        12
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle12"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name12}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Rotate West (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class2",
        2
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle2"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name2}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Rotate East (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class11",
        11
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle11"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name11}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Rotate East (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class1",
        1
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle1"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name1}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Rotate Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class10",
        10
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "center",
        "text-offset": [
          0.117647,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle10"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name10}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Rotate Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class",
        0
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - South (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class17",
        17
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle17"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name17}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - South (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class7",
        7
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle7"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name7}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - NW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class19",
        19
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle19"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name19}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - NW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class9",
        9
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle9"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name9}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - SW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class18",
        18
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle18"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name18}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - SW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class8",
        8
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle8"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name8}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - SE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class16",
        16
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle16"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name16}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - SE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class6",
        6
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle6"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name6}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - NE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class15",
        15
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 10.5,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle15"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name15}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - NE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class5",
        5
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle5"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name5}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - North (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class14",
        14
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle14"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name14}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - North (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class4",
        4
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle4"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name4}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class13",
        13
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "center",
        "text-offset": [
          0.117647,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle13"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name13}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class3",
        3
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle3"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name3}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/Roads/label/Local Road 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        14
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "rgba(255,255,255,0.99)",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Local Road 22400-44800",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        15
      ],
      "minzoom": 8,
      "maxzoom": 9,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "rgba(255,255,255,0.99)",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Minor Road 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        12
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "rgba(255,255,255,0.99)",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Minor Road 22400-89600",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        13
      ],
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "rgba(255,255,255,0.99)",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Greenspace:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Greenspace:1",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Greenspace:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(0,0,0,0)",
        "text-color": "#89A489",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Sites",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Sites",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Sites",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Landform:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Landform:1",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Landform:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12.5,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/Landform:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Landform:2",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Landform:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/Landcover:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Landcover:3",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Landcover:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Landcover:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Landcover:2",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Landcover:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12.5,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/Water:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Water:2",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Water:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6C8499",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Water:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Water:1",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Water:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6C8499",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/Woodland:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Woodland:2",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Woodland:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#89A489",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Woodland:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Woodland:1",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Woodland:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#89A489",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/A & B Road 2800-11200",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        7
      ],
      "minzoom": 10,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 13,
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 2
      }
    },
    {
      "id": "OS/Roads/label/A & B Road 11200-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        8
      ],
      "minzoom": 9,
      "maxzoom": 10,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Regular"
        ],
        "text-size": 13,
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 2
      }
    },
    {
      "id": "OS/Roads/label/A & B Road 22400-358400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        9
      ],
      "minzoom": 5,
      "maxzoom": 9,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Regular"
        ],
        "text-size": 11,
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.6
      }
    },
    {
      "id": "OS/Roads/label/A & B Road Name 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        10
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "rgba(255,255,255,0.99)",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/A & B Road Name 22400-89600",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        11
      ],
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "rgba(255,255,255,0.99)",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Railway_stations/label/Station names 22400-89600",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_label_class1",
        1
      ],
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "top",
        "text-offset": {
          "property": "_symbol",
          "type": "categorical",
          "default": [
            0,
            0.0333333
          ],
          "stops": [
            [
              0,
              [
                0,
                0.631292
              ]
            ],
            [
              1,
              [
                0,
                0.359493
              ]
            ],
            [
              2,
              [
                0,
                0.609832
              ]
            ],
            [
              3,
              [
                0,
                0.629975
              ]
            ],
            [
              4,
              [
                0,
                0.625794
              ]
            ],
            [
              5,
              [
                0,
                0.410354
              ]
            ]
          ]
        },
        "text-letter-spacing": 0.05,
        "text-field": "{_name1}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FAFAF3",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Railway_stations/label/Station names 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_label_class",
        0
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-offset": {
          "property": "_symbol",
          "type": "categorical",
          "default": [
            0,
            0.1
          ],
          "stops": [
            [
              0,
              [
                0,
                0.638163
              ]
            ],
            [
              1,
              [
                0,
                0.393543
              ]
            ],
            [
              2,
              [
                0,
                0.618849
              ]
            ],
            [
              3,
              [
                0,
                0.636977
              ]
            ],
            [
              4,
              [
                0,
                0.633215
              ]
            ],
            [
              5,
              [
                0,
                0.439319
              ]
            ]
          ]
        },
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FAFAF3",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Small Settlement",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Small Settlement",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Small Settlement",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Regional/Landcover:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Landcover:1",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/Landcover:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 0.75
      }
    },
    {
      "id": "OS/Names/Local/Hamlet (Local)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Hamlet (Local)",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Hamlet (Local)",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 17,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/Hamlet:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Hamlet:2",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Hamlet:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Regional/Hamlet:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Hamlet:1",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/Hamlet:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Suburban Area:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Suburban Area:3",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Suburban Area:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 15,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Regional/Suburban Area:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Suburban Area:1",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/Suburban Area:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/Suburban Area:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Suburban Area:2",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Suburban Area:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Primary 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        3
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 13,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Primary 22400-179200",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        4
      ],
      "minzoom": 6,
      "maxzoom": 9,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 12,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Primary 179200-716800",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        5
      ],
      "minzoom": 4,
      "maxzoom": 6,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 11,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Primary Name 2800-44800",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        6
      ],
      "minzoom": 8,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Village:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Village:2",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Village:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 16.5,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.8
      }
    },
    {
      "id": "OS/Names/District/Village:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Village:3",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Village:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.8
      }
    },
    {
      "id": "OS/Names/Regional/Village:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Village:1",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/Village:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.1
      }
    },
    {
      "id": "OS/Roads/label/Motorway 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        0
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 13,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Motorway 22400-179200",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        1
      ],
      "minzoom": 6,
      "maxzoom": 9,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 12,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Motorway 179200-2867200",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        2
      ],
      "minzoom": 2,
      "maxzoom": 6,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 11,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Airports/label/Airport names 22400-179200",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Airports",
      "filter": [
        "==",
        "_label_class1",
        1
      ],
      "minzoom": 6,
      "maxzoom": 9,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12.5,
        "text-anchor": "top",
        "text-offset": [
          0,
          0.582306
        ],
        "text-field": "{_name1}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#F4F4EE",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Airports/label/Airport names 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Airports",
      "filter": [
        "==",
        "_label_class",
        0
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "top",
        "text-offset": [
          0,
          0.688753
        ],
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/National Park:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "National Park:3",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/National Park:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14.5,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#89A489",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 2
      }
    },
    {
      "id": "OS/Names/Local/Motorway Junctions",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Motorway Junctions",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Motorway Junctions",
        "icon-allow-overlap": true,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 14,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(168,0,0,0)",
        "text-color": "#FFFFFF",
        "text-halo-color": "#9C9C9C",
        "text-halo-width": 3
      }
    },
    {
      "id": "OS/Names/Local/Town:4",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Town:4",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Town:4",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 19,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 2.2
      }
    },
    {
      "id": "OS/Names/District/Town:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Town:1",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Town:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 16.5,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.7
      }
    },
    {
      "id": "OS/Names/Regional/Town:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Town:2",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/Town:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/National/Town:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Town:3",
      "maxzoom": 5,
      "layout": {
        "icon-image": "OS/Names/National/Town:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Regional/National Park:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "National Park:2",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/National Park:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14.5,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-allow-overlap": true,
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#89A489",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/National/National Park:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "National Park:1",
      "maxzoom": 5,
      "layout": {
        "icon-image": "OS/Names/National/National Park:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#89A489",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/City:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "City:3",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/City:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 21,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 3
      }
    },
    {
      "id": "OS/Names/District/City:4",
      "type": "symbol",
      "source": "esri",
      "source-layer": "City:4",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/City:4",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 17,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 2.2
      }
    },
    {
      "id": "OS/Names/Regional/City:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "City:1",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/City:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Semibold"
        ],
        "text-size": 17,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-allow-overlap": true,
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/National/City:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "City:2",
      "maxzoom": 5,
      "layout": {
        "icon-image": "OS/Names/National/City:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 16,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Capital:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Capital:3",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Capital:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 24,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 3
      }
    },
    {
      "id": "OS/Names/District/Capital:4",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Capital:4",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Capital:4",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 20,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 3
      }
    },
    {
      "id": "OS/Names/Regional/Capital:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Capital:2",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/Capital:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Semibold"
        ],
        "text-size": 18,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/National/Capital:1/label/Capital National",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Capital:1",
      "filter": [
        "==",
        "_label_class",
        0
      ],
      "minzoom": 1,
      "maxzoom": 5,
      "layout": {
        "text-font": [
          "Source Sans Pro Semibold"
        ],
        "text-size": 16,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/National/Country/label/Country National",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Country",
      "filter": [
        "==",
        "_label_class",
        0
      ],
      "minzoom": 1,
      "maxzoom": 5,
      "layout": {
        "text-font": [
          "Source Sans Pro Semibold"
        ],
        "text-size": 21,
        "text-anchor": "center",
        "text-letter-spacing": 0.75,
        "text-field": "{_name}",
        "text-allow-overlap": true,
        "text-optional": true
      },
      "paint": {
        "text-color": "rgba(85,89,92,0.5)",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/National/Capital:1/label/Capital National 1:5.7m+",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Capital:1",
      "filter": [
        "==",
        "_label_class1",
        1
      ],
      "maxzoom": 1,
      "layout": {
        "text-font": [
          "Source Sans Pro Semibold"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-offset": [
          0.270711,
          0.0292893
        ],
        "text-field": "{_name1}",
        "text-optional": true
      },
      "paint": {
        "text-color": "rgba(85,89,92,0.75)"
      }
    },
    {
      "id": "OS/Names/National/Country/label/Country National 1:5.7m+",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Country",
      "filter": [
        "==",
        "_label_class1",
        1
      ],
      "maxzoom": 1,
      "layout": {
        "text-font": [
          "Source Sans Pro Semibold"
        ],
        "text-size": 16,
        "text-anchor": "center",
        "text-letter-spacing": 0.5,
        "text-field": "{_name1}",
        "text-optional": true
      },
      "paint": {
        "text-color": "rgba(85,89,92,0.5)",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    }
  ]
};