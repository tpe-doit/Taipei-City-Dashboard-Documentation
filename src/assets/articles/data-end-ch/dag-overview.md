
本專案藉由數個各有特色的資料流，提供開發者參考。2024 春季黑客松對資料端並無限制技術，建議參賽者可選擇自己方便的方式，不一定需要採用本專案。以下供快速確認本文件是否有幫助：

**_looks_one_** 下方將列出各個資料流特色，可快速查閱是否有需要之片段。

**_looks_two_** [資料流詳解](/data-end/dag-code)章節將詳細介紹一個資料流，對於理解其他資料流應有幫助。

**_looks_3_** 欲了解本專案通用函式者，請參閱[通用函式總覽](/data-end/utils-overview)章節。

**_looks_4_** 不熟悉如何在 PSQL 中建立表格者，請參閱[建立資料表](/data-end/dag-table)章節。

## 示範資料流一覽

| 名稱                | 內容                     | 來源                                                                                                                           | 特色                                                                                                                         |
| ------------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------- |
| simple_template     | 台北市醫院清冊           | [連結](https://data.taipei/dataset/detail?id=ffdd5753-30db-4c38-b65f-b77892773d60)                                             | 取得 data.taipei API 資料、取得 data.taipei 檔案更新時間、標準化時間、將 x, y 座標轉成 `Point` 資料、儲存具地理空間資料至 PSQL |
| building_permit     | 台北市當年度建造執照摘要 | [連結](https://data.taipei/dataset/detail?id=d8834353-ff8e-4a6c-9730-a4d3541f2669)                                             | 解析 XML、處理民國年、儲存無地理空間資料至 PSQL                                                                              |
| ubike_station       | YouBike 站點             | [連結](https://tdx.transportdata.tw/api-service/swagger/basic/2cc9b888-a592-496f-99de-9ab35b7fb70d#/Bike/BikeApi_Station_2180) | 從 TDX 取得資料、讀取 JSON 格式、處理數字欄位遺失值                                                                          |
| sidewalk            | 台北市人行道面量         | [連結](https://data.taipei/dataset/detail?id=715d3a83-8445-4496-b6bf-b0900538b7e7)                                             | 讀取 GeoJSON 檔案                                                                                                            |
| riverside_bike_path | 台北市河濱腳踏車道       | [連結](https://data.taipei/dataset/detail?id=4fefd1b3-58b9-4dab-af00-724c715b0c58)                                             | 解析 KML、`LineString` 轉為 `MultiLineString`                                                                                    |
| debris_area         | 土石流潛勢溪流影響範圍   | [連結](https://data.gov.tw/dataset/167441)                                                                                     | 讀取 SHPfile、`Polygon` 轉為 `MultiPolygon`、地理空間WKBGeometry轉為格式                                                        |
