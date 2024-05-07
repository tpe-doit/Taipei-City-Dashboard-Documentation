---
title: 建立資料表

---

## 標準資料表
資料端的應用資料應儲存於 `db:dashboard/dashboard/{table_name}`，一個標準的本專案資料表如下:
| data_time | column_1 | column_2 | ... | wkb_geometry | _ctime | _mtime | ogc_fid |
| -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- |
| 2024-01-01 00:00:00+08 | value | value | ... | 010101010101 | 2024-01-02 00:00:00+8 | 2024-01-03 00:00:00+8 | 15312 |

除了資料本身資訊的 `column_1`、`column_2` 等不固定欄位，其他欄位說明如下:

### data_time
建議但非必須。紀錄資料內容的時間。不同於資料回傳時間、更新時間等...一筆資料可以是現在回傳，但來源更新於昨天，而內容是上個月的資訊。若資料本身無時間資訊，建議可採更新時間代替。

### wkb_geometry
若資料無空間資訊，則不須此欄位。紀錄該資料的地理空間資訊，以國際通用的 `EPSG:4326` 坐標系紀錄，並採WKBGeometry格式紀錄，以減少占用空間。

### _ctime
自動產生欄位，紀錄該列資料的create time。

> **w01**
> 自動產生的方式，請見下文。

### _mtime
自動產生欄位，紀錄該列資料的modify time。

> **i01**
> _ctime與_mtime大部分時間是一樣的，只有在執行過update的列會有所不同。

### ogc_fid
自動產生欄位，使用流水數字以作為PK使用。若資料表有其他適合的PK，則不需要此欄位。


## 利用通用函示建表
當你想創建一張本專案的標準表，強烈建議使用 `/dags/utils/generate_sql_to_create_DB_table.py` 產生適當的SQL，然後利用pgAdmin或類似操作建表。只需修改 `generate_sql_to_create_DB_table` 當中的 `table_name`、`col_map` 變數以符合你的資料，執行程式後就可產生一段SQL。SQL包含你所需要的資料欄位，還會產生以上提及的自動欄位 `_ctime`、`_mtime`、`ogc_fid` 及適當的權限。
詳細說明請參閱[通用函式-建表SQL](/data-end/utils-generate_sql)。
