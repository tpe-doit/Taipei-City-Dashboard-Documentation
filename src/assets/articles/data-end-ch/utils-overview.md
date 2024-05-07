## 前言

通用函式為頻繁使用的程式碼抽出形成，未必能符合所有情況。若您同時是 2024 春季黑客松的參賽者，資料端並無限制技術，建議參賽者可選擇自己方便的方式，不一定需要採用本專案。下方將會列出本次開源的通用函式用途，可快速查閱是否有需要之片段。

## 通用函式一覽

### 建表 SQL

產生用來建表的 SQL。該 SQL 包含給定的資料欄位以及本專案標準表的 `_ctime`、`_mtime`、`ogc_fid` 欄位及適當的權限。[文章連結](/data-end/utils-generate-sql)。

### 抽取階段

包含下載、解壓縮、取得 data.taipei API、取得 data.taipei 檔案更新時間、讀取 GeoJSON 的範例、讀取 SHPfile 的範例、讀取 KML/KMZ 的範例。[文章連結](/data-end/utils-extract)。

### 轉換時間

包含處理民國年、標準化時間與時區、去除時間中有上下午中文的函式。[文章連結](/data-end/utils-transform-time)。

### 轉換地理空間

包含 3 維 Polygon 轉成 2 維、LineString 轉成 MultiLineString、Polygon 轉成 MultiPolygon、將 x, y 座標轉為 Point 欄位、geometry 轉成 WKBGeometry。[文章連結](/data-end/utils-transform-geometry)。

### 轉換地址

用於清洗、標準化、分解地址，建議適用於台北市地址。[文章連結](/data-end/utils-transform-address)。

### 儲存階段

將帶有地理資訊的表格、不帶地理資訊的表格存入 DB。[文章連結](/data-end/utils-load)。

### 取得 TDX token

取得 TDX 平台 token(需自行申請帳號)。[文章連結](/data-end/utils-tdx)。

> **i01**
> 本專案的標準表定義請參閱[建立資料表](/data-end/dag-table)

> **w01**
> 若需要使用通用函式，務必閱讀下章節[確認設定檔](/data-end/dag-config)的內容。
