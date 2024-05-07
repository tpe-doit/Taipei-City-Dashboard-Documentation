---
title: 資料流總覽

---

## 前言
本次開源僅為資料端的一小部分，藉由數個各有特色的資料流，提供開發者參考。若您同時是2024春季黑客松的參賽者，資料端並無限制技術，建議參賽者可選擇自己方便的方式，不一定需要採用本專案。以下供快速確認本文件是否有幫助:
1. 下方將會列出本次開源的各資料流特色，可快速查閱是否有需要之片段。
2. [資料流詳解](/data-end/dag-code)章節將詳細介紹一個資料流，對於理解各個資料流應有幫助。
3. 欲了解本專案通用函式者，請參閱[通用函式總覽](/data-end/utils-overview)章節。
4. 對於在PSQL中建立表格不熟悉者，請參閱[建立資料表](/data-end/dag-table)章節。

## 示範資料流一覽
| 資料流名稱 | 資料內容 | 資料文件 | 資料流特色 |
| -------- | -------- | -------- | -------- |
| simple_template     | 台北市醫院清冊 | [連結](https://data.taipei/dataset/detail?id=ffdd5753-30db-4c38-b65f-b77892773d60) | 取得data.taipei API資料、取得data.taipei檔案更新時間、標準化時間、將X、Y座標轉成Point資料、儲存具地理空間資料至PSQL |
| building_permit | 台北市當年度建造執照摘要 | [連結](https://data.taipei/dataset/detail?id=d8834353-ff8e-4a6c-9730-a4d3541f2669) | 解析XML、處理民國年、儲存無地理空間資料至PSQL |
| ubike_station | YouBike站點 | [連結](https://tdx.transportdata.tw/api-service/swagger/basic/2cc9b888-a592-496f-99de-9ab35b7fb70d#/Bike/BikeApi_Station_2180) | 從TDX取得資料、讀取JSON格式、處理數字欄位遺失值 |
| sidewalk | 台北市人行道面量 | [連結](https://data.taipei/dataset/detail?id=715d3a83-8445-4496-b6bf-b0900538b7e7) | 讀取GeoJSON檔案 |
| riverside_bike_path | 台北市河濱腳踏車道 | [連結](https://data.taipei/dataset/detail?id=4fefd1b3-58b9-4dab-af00-724c715b0c58) | 解析KML、LineString轉為MultiLineString |
| debris_area | 土石流潛勢溪流影響範圍 | [連結](https://data.gov.tw/dataset/167441) | 讀取SHPfile、Polygon轉為MultiPolygon、geometry格式轉為WKBGeometry |
