## Supported Data Types
All map data in this project should be in `geojson` format. This project supports all `geojson` geometry types: `Point`, `LineString`, `Polygon`, `MultiPoint`, `MultiLineString`, and `MultiPolygon`. It is also recommended that additional properties be attached to each geometric object to allow additional information to be displayed when a data point is clicked on the map.

>**i01**
>In the internal version of this project, raster maps served using [Geoserver](https://geoserver.org/) are also used in conjunction with `geojsons`. However, due to internal network concerns, all maps were transformed into `geojson` format and stored locally for the open-source version.
>
>Changing to a system to fetch remote `geojsons` or raster maps instead of storing maps locally is quite simple, and is just a matter of modifying the API calls already present in the `mapStore`.

>**t01**
>Learn more about the `geojson` format and how it’s visualized on a map at [geojson.io](https://geojson.io/) by Mapbox. Recommended if you are not familiar with `geojsons`.
