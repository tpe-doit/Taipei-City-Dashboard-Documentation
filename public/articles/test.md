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
