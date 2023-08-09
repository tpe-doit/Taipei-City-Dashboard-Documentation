## 支援的資料類型
本專案中的所有空間資料均應使用 `geojson` 格式儲存。本專案支援所有 `geojson` 的幾何類型：`Point`（點）、`LineString`（線）、`Polygon`（多邊形）、`MultiPoint`（多點）、`MultiLineString`（多線）、以及 `MultiPolygon`（多多邊形）。建議每個幾何物件中也包含幾個屬性資料(properties)，以便在點擊地圖上的數據點時能顯示額外資訊。

>**i01**
>在本專案的內部版本中，也使用了 [Geoserver](https://geoserver.org/) 提供的raster圖資。然而，由於此資料僅能經由市政府內網獲取，我們已將所有地圖都轉換為 `geojson` 格式並在本地儲存，以供開源版本使用。
>
>若要改為從遠端獲取 `geojson` 或raster地圖而非本地儲存，只需修改 `mapStore` 中已存在的 API 呼叫方式即可。

>**t01**
>如果您對 `geojson` 還不熟悉，建議參考 Mapbox 提供的 [geojson.io](https://geojson.io/) 平台，以了解其如何被渲染在地圖上。
