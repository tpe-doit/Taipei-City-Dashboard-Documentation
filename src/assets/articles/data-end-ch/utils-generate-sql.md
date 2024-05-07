## 函式說明

可以在 `/dags/utils/generate_sql_to_create_DB_table.py` 找到原始碼。當中的函式用來產生 SQL，該 SQL 可用來建立本專案的標準表格。

> **i01**
> 有關本專案的標準表格，請參閱[建立資料表](/data-end/dag-table)。

### \_show_smaple_column_type()

此函式無作用，僅供參考常使用的欄位類型。

### def generate_sql_to_delete_db_table(table_name):

產出刪表的 SQL。在創建新表之前，為了避免有同樣名稱的表格存在，可透過此函式產生刪表的 SQL，SQL 中包含刪表、刪流水號的 sequnce 及刪`_mtime`的 trigger。表格不存在也不會產生錯誤。

```python
table_name = 'childcare_family_hub_history'
drop_table_sql = generate_sql_to_delete_db_table(table_name)
```

### def generate_sql_to_delete_db_table(table_name, col_map):

產出建表的 SQL。SQL 可讓你建立一張名為 `table_name` 且符合 `col_map` 欄位，並包含適當權限。預設會自動產出欄位 `ogc_fid`、`_ctime`、`_mitme`。

```python
IS_HISTRORY_TABLE = True

table_name = "heal_hospital"
col_map = {
    "data_time": "timestamp with time zone DEFAULT CURRENT_TIMESTAMP",
    "name": 'character varying(50) COLLATE pg_catalog."default"',
    "addr": 'text COLLATE pg_catalog."default"',
    "lng": "double precision",
    "lat": "double precision",
    "wkb_geometry": "geometry(Point,4326)"
}

if IS_HISTRORY_TABLE:
    table_name = [table_name, f"{table_name}_history"]

for table in table_name:
    create_table_sql = generate_sql_to_create_db_table(table, col_map)
    print(create_table_sql)
```

其中，若 `IS_HISTRORY_TABLE` 設定為 `True`，代表需同時建立 current+histroy 表格，會產出創建兩張表所需的 SQL。

> **i02**
> histroy 表格固定以原始表格名稱加上後"\_history"

> **i03**
> current+history 的設計，是為了同時滿足快速與留存歷史資料。比如 YouBike 站點狀態雖然只呈現當下的即時資料，但我們留存所有歷史資料以供未來分析應用。長期下來，history 表會變得冗餘而查詢時間過長；因此另存 current 表，只留最後一次的資料，快速回應前端需求。
