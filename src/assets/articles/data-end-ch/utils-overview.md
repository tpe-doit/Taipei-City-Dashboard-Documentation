---
title: 通用函式總覽

---

## 前言
通用函式為頻繁使用的程式碼抽出形成，未必能符合所有情況。若您同時是2024春季黑客松的參賽者，資料端並無限制技術，建議參賽者可選擇自己方便的方式，不一定需要採用本專案。下方將會列出本次開源的通用函式用途，可快速查閱是否有需要之片段。

## 通用函式一覽
* [通用函式-建表SQL](/data-end/utils-generate_sql)
產生用來建表的SQL。該SQL包含給定的資料欄位以及本專案標準表的 `_ctime`、`_mtime`、`ogc_fid` 欄位及適當的權限。
* [通用函式-抽取階段](/data-end/utils-extract)
包含下載、解壓縮、取得data.taipei API、取得data.taipei檔案更新時間、讀取GeoJSON的範例、讀取SHPfile的範例、讀取KML/KMZ的範例。
* [通用函式-轉換時間](/data-end/utils-transform-time)
包含處理民國年、標準化時間與時區、去除時間中有上下午中文的函式。
* [通用函式-轉換地理空間](/data-end/utils-transform-geometry)
包含3維Polygon轉成2維、LineString轉成MultiLineString、Polygon轉成MultiPolygon、將x, y座標轉為Point欄位、geometry轉成WKBGeometry。
* [通用函式-轉換地址](/data-end/utils-transform-address)
用於清洗、標準化、分解地址，建議適用於台北市地址。
* [通用函式-儲存階段](/data-end/utils-load)
將帶有地理資訊的表格、不帶地理資訊的表格存入DB。
* [通用函式-取得TDX token](/data-end/utils-tdx)
取得TDX平台token(需自行申請帳號)。

> **i01**
> 本專案的標準表定義請參閱[建立資料表](/data-end/dag-table)

> **w01**
> 若需要使用通用函式，務必閱讀下章節[確認設定檔](/data-end/dag-config)的內容。
