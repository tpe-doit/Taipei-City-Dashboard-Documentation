## Map Config
To correctly render map data, several parameters need to be set and passed into the component configuration as mentioned in [this previous article](/front-end/introduction-to-components#component-configuration). 

This project supports more than one map for each component. As such, the `map_config` parameter in the component configuration takes an array of map config objects, with each map config representing one map. When a component is expanded in the map view, all maps attached to that component will be rendered simultaneously.

The complete map config object can be found below.
```json
"map_config": [
    {
        // String; must be unique and the same as the map data file name
        "index": "socl_welfare", 
        // Object; supports all Mapbox paint properties. See 1st info box below for details.
        "paint": {
            "fill-color": [] // See 1st warning box for details.
        }, 
        "property": [
	        // key: String; a property name in the map data
	        // name: String; Display name in the user interface
            { "key": "vil", "name": "里界" },
            { "key": "cnt_low_income", "name": "低收入人口數" },
        ], // Array of Objects; properties to show in map popup
        "title": "社福人口", // String; map name
        "type": "fill", // String; pass in 1 of the 5 available map types
        "size": null, // String || null; additional preset style setting. See next section.
        "icon": null // String || null; additional preset style setting. See next section
    },
    …
],
```

>**i01**
>In Mapbox, each map type supports numerous paint properties that control visual details such as color, size, blur, etc. To customize a map beyond its default form, simply pass in any paint property supported by Mapbox. ([Mapbox layers docs](https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/))

>**w01**
>The color paint property for all map types should ALWAYS be specified or nothing will be rendered.

## Map Types
5 map types are supported in this project. Each map type has preset default styling applied which is listed in the file `mapConfig.js` located at `/src/assets/configs/mapbox`. Several maps also support preset variations to the default styling. This is achieved by specifying the size or icon parameters in the map config.

### Circle
The circle map type renders points as circles on the map. Size variations include `small` and `big`. Icon variations include `heatmap` which blurs the dots to create a heatmap-like effect when zoomed out.

### Fill
The fill map type renders polygons onto the map. There are no preset variations. 

### Fill-extrusion
The fill-extrusion map type protrudes a 3D rendering of polygons from the map. There are no preset variations.

### Line
The line map type renders lines onto the map. Size variations include `wide`. Icon variations include `dash` which renders dashed lines instead of solid ones.

### Symbol
The symbol map type renders points as icons. For symbol maps, the icon parameter must be passed into the map config. Available icons include `metro`, `metro-density`, `triangle_green`, `triangle_white`, `youbike`, and `bus`.
