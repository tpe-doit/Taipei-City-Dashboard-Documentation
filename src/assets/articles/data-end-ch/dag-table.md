## 標準資料表

資料端的應用資料應儲存於 `db:dashboard/dashboard/{table_name}`，一個標準的本專案資料表如下：
| data_time | column_1 | column_2 | ... | wkb_geometry | 
| -------- | -------- | -------- | -------- | -------- | 
| 2024-01-01 00:00:00+08 | value | value | ... | 010101010101 |

除了資料本身資訊的 `column_1`, `column_2` 等不固定欄位，其他欄位說明如下：

### data_time

建議但非必須。紀錄資料內容的時間。不同於資料回傳時間、更新時間等...一筆資料可以是現在回傳，但來源更新於昨天，而內容是上個月的資訊。若資料本身無時間資訊，建議可採更新時間代替。

### wkb_geometry

若資料無空間資訊，則不須此欄位。紀錄該資料的地理空間資訊，以國際通用的 `EPSG:4326` 坐標系紀錄，並採 WKBGeometry 格式紀錄，以減少占用空間。

## 利用通用函示建表

當您想創建一張本專案的標準表，強烈建議使用 `/dags/utils/generate_sql_to_create_DB_table.py` 產生適當的 SQL，然後利用 pgAdmin 或類似操作建表。只需修改 `generate_sql_to_create_DB_table` 當中的 `table_name`, `col_map` 變數以符合您的資料，執行程式後就可產生一段 SQL。SQL 包含您所需要的資料欄位及適當的權限。

> **i01**
> 詳細說明請參閱[通用函式-建表 SQL](/data-end/utils-generate_sql)章節。
