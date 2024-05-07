## 前言

`通用函式-儲存階段` 包含將帶有地理資訊或不帶地理資訊的表格存入 DB。你可以在 `/dags/utils/load_stage.py` 找到此 module。

> **w01**
> 務必確認你已經查看[確認設定檔](/data-end/dag-config)章節並設置完成。

> **w02**
> 範例程式都會添加以下幾行程式，以確保將本專案的路徑加入環境變數，從而能找到 `utils` 與 `settings` 等資料夾。
>
> ```python
> import os
> import sys
>
> dags_path = os.path.join(os.getcwd(), 'dags')  # Should be looks like '.../dags'
> sys.path.append(dags_path)
> ```

## 函式說明

### def save_dataframe_to_postgresql(engine, data)

將不包含地理空間資訊的 `data` 存入`engine`連接的 DB。

本函式的其他參數說明如下:

`load_behavior`: 必須為"append", "replace", "current+history"三者的其中一個。append: 將資料無條件新增至指定 table；replace: 將指定表格 truncate 後，再新增資料；current+history: 共有兩個目的地，其一為 current 表，另一張為 history 表。分別對 current 表執行上面的 replace 操作，再對 history 表執行 append 操作。

`default_table`: 一般而言，是唯一的目的地表名，僅在 `load_behavior="current+history"` 時視為 current 表儲存。

`history_table`: 是 ready_data 的 history 表名，只有在 `load_behavior="current+history"` 時生效。

> **i01**
> current+history 的設計，是為了同時滿足快速與留存歷史資料。比如 YouBike 站點狀態雖然只呈現當下的即時資料，但我們留存所有歷史資料以供未來分析應用。長期下來，歷史資料會變得冗餘而查詢時間過長；因此另存 current 表，只留最後一次的資料，快速回應前端需求。

因本函式是將資料存入 DB，必須先建立表格，無法透過很短的程式示範，請參考資料流 `/dags/proj_city_dashboard/building_permit/R0057.py`。

### def save_geodataframe_to_postgresql (engine, gdata)

將包含地理空間資訊的 `gdata` 存入 `engine` 連接的 DB。

本函式的其他參數說明如下:

`load_behavior`: 同上方函式。

`geometry_type`: 是地理空間欄位的類型必須為'POINT', 'LINESTRING', 'POLYGON', 'MULTIPOINT', 'MULTILINESTRING', 'MULTIPOLYGON'其中之一，且與資料庫內欄位一致。

`default_table`: 同上方函式。

`history_table`: 同上方函式。

`geometry_col`: 包含地理空間資訊的欄位名，預設為"wkb_geometry"

因本函式是將資料存入 DB，必須先建立表格，無法透過很短的程式示範，請參考資料流 `/dags/proj_city_dashboard/simple_template/template_dag.py`。