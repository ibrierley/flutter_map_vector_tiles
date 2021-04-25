class Filters {

  static isAllowed(layerString, featureInfo) {

    /// not sure why we need true vals yet...maybe something more complex later
    /// eg remove any label except if overridden by a class ?
    ///
    Map<String, Map<String, bool>> includeExcludeLabels = {
      'layer_names': { 'building': true, 'structure': true, 'transit_stop_label': false, },
      'poi_label':  { 'sport_and_leisure': false, 'food_and_drink': false, 'food_and_drink_stores': false, 'store_like': false  },
    };

    /// exclude whole label names
    if(includeExcludeLabels['layer_names'].containsKey(layerString)) {
      if(!includeExcludeLabels['layer_names'][layerString]) return false;
    }

    /// exclude classes
    var myClass = featureInfo['class'];
    if(includeExcludeLabels.containsKey(layerString) && includeExcludeLabels[layerString].containsKey(myClass)) {
      if (includeExcludeLabels[layerString][myClass] == false) {
        return false;
      }
    }

    return true;
  }

  static layerDisplaySegments() {
    return [
      { 'water': true, 'landuse': true, 'motorway_junction': true, 'road': true, 'aeroway': true, 'structure': true },
      { 'structure': true, 'waterway': true, 'landuse_overlay' : true },
      { 'waterway_label': true, 'natural_label': true, 'road_label': true,  },
    ];
  }



}