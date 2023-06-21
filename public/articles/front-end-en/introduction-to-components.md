## Overview
Components are collections of data that make up dashboards. All components, with the exception of map layers components, contain statistical data that can be displayed in a chart or graphical form. Components can also optionally contain geographical and historical data.

### Map Layers
Map layer components are components that only contain geographical data. As mentioned in the previous section, map layer components are aggregated and displayed in the map layers dashboard.

## Component Configuration
Regardless of type, all component configurations (Object) are stored in a single object where the keys are the IDs of each component. The complete list of parameters for normal components and map layer components can be found below.

> **i01**
> Statistical, geographical, and historical data for each component is stored separately as mentioned in [this previous article](/front-end/file-system).

### Normal
```json
"7": {
      "id": 7, // Number; ID number
      "index": "patrol_criminalcase", // String; index
      "history_data": false, // Boolean; whether historical data is available
      "map_config": null, // Object || null; see 2nd info box below for details
      "Chart_config": {
       },  // Object; see 3rd info box below for details
      "name": "刑事統計", // String; component name
      "source": "警察局", // String; source name
      "time_from": "2023-01-01T23:59:59+08:00", // String || null; data time frame (from)
      "time_to": "2023-05-01T23:59:59+08:00", // String || null; data time frame (to)
      "update_freq": 1, // Number || null; update frequency 
      "update_freq_unit": "month", // String; update frequency unit
      "short_desc": "...", // String; short description
      "long_desc": "...", // String; long description
      "use_case": "...", // String; use case description
      "links": "https://…", // String || null; related links
      "tags": ["..."] // Array; of tags that describe the component
    },
```

### Map Layers
``` json
"115": {
      "id": 115, // Number; ID number
      "index": "6f3842dd",  // String; index
      "map_config": {}, // Object; see 2nd info box below for details
      "chart_config": {
        "types": ["MapLegend"]
      }, // Object; Always this value for map layer components
      "chart_data": [
        { 
          "color": "#c87a74", // String; hex color code 
          "type": "fill", // String; map type
          "name": "高潛勢", // String; name
          "value": null, // Number || null; number of data points if applicable
          "unit": null, // String || null; unit of data points
         },
      ], // Array; of objects
      "name": "土壤液化潛勢", // String; component name
      "source": "工務局", // String; source name
      "time_from": null, // String || null; data time frame (from)
      "time_to": null, // String || null; data time frame (to)
      "update_freq": null, // Number || null; update frequency
      "update_freq_unit": null  // String; update frequency unit
    }
```
> **i02**
> If the component has geographical data, pass in a map configuration object. If not, pass in null. The map configuration object will be explained in greater detail in [this later article](/front-end/supported-map-types).

> **i03**
> All normal components have statistical data and a chart configuration object should be included in the component configuration. The chart configuration object will be explained in greater detail in [this later article](/front-end/supported-chart-types).

> **i04**
> All dates should be in the following format: `YYYY-MM-DDThh:mm:ssTZD` (e.g. 2023-06-16T18:20:00+08:00)
