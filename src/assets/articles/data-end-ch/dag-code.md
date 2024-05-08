## 注意事項

在程式碼說明之前，一些特殊的規則或強烈建議說明如下。

> **w01**
> 本專案的時間欄位都會加上時區資訊，採[IOS 8601](https://en.wikipedia.org/wiki/ISO_8601)儲存，以避免不同系統介接時發生轉換錯誤。

> **w02**
> 本專案的地理空間欄位，都會以 `WGS84` 也就是 `EPSG:4326` 坐標系，並轉換成 WKBGeometry 格式儲存。[WGS84](https://en.wikipedia.org/wiki/World_Geodetic_System)是國際通用的經緯度座標系，[WKBGeometry](https://en.wikipedia.org/wiki/Well-known_text_representation_of_geometry)則是一種較節省儲存空間的格式。

## Code 說明

程式碼可在`/dags/proj_city_dashboard/simple_template/template_dag.py`找到，內容如下：

```python
import os
import sys

dags_path = os.path.join(os.getcwd(), 'dags')  # Should be looks like '.../dags'
sys.path.append(dags_path)
import pandas as pd
from settings.global_config import READY_DATA_DB_URI
from sqlalchemy import create_engine
from utils.extract_stage import (
    get_data_taipei_api,
    get_data_taipei_file_last_modified_time
)
from utils.load_stage import save_geodataframe_to_postgresql
from utils.transform_geometry import add_point_wkbgeometry_column_to_df
from utils.transform_time import convert_str_to_time_format

# Config
RID = "04a3d195-ee97-467a-b066-e471ff99d15d"
PAGE_ID = "ffdd5753-30db-4c38-b65f-b77892773d60"
FROM_CRS = 4326
LOAD_BEHAVIOR = "current+history"
DEFAULT_TABLE = "heal_hospital"
HISTORY_TABLE = "heal_hospital_history"
GEOMETRY_TYPE = "Point"

# Extract
res = get_data_taipei_api(RID)
raw_data = pd.DataFrame(res)
raw_data["data_time"] = get_data_taipei_file_last_modified_time(PAGE_ID)

# Transform
# Rename
data = raw_data
data.columns = data.columns.str.lower()
data = data.rename(columns={"機構名稱": "name", "地址": "addr", "x": "lng", "y": "lat"})
# Time
# Ready data with time information should always add time zone.
data["data_time"] = convert_str_to_time_format(data["data_time"])
# Geometry
# TUIC use wkb_geometry format to store geometry data, and use `wkb_geometry` as the column name.
# Ready data always in crs 4326 (WGS84) coordinate system.
gdata = add_point_wkbgeometry_column_to_df(
    data, x=data["lng"], y=data["lat"], from_crs=FROM_CRS
)
# Reshape
gdata = gdata.drop(columns=["geometry", "_id"])
ready_data = gdata[["data_time", "name", "addr", "lng", "lat", "wkb_geometry"]]

# Load
# Load data to DB
engine = create_engine(READY_DATA_DB_URI)
save_geodataframe_to_postgresql(
    engine,
    gdata=ready_data,
    load_behavior=LOAD_BEHAVIOR,
    default_table=DEFAULT_TABLE,
    history_table=HISTORY_TABLE,
    geometry_type=GEOMETRY_TYPE,
)
```

以上程式碼將拆分成多個部分說明：

**_looks_one_** 全域設定 **_looks_two_** 引入套件 **_looks_3_** 靜態變數宣告 **_looks_4_** Extract **_looks_5_** Transform **_looks_6_** Load

### 1. 全域設定

全域設定部分包含：

```python
import os
import sys

dags_path = os.path.join(os.getcwd(), 'dags')  # Should be looks like '.../dags'
sys.path.append(dags_path)
from settings.global_config import READY_DATA_DB_URI
```

先添加專案路徑至環境變數，再從 `/dags/settings/global_config.py` 取得全域變數。

### 2. 引入套件

引入需要的套件如：

```python
import pandas as pd
from sqlalchemy import create_engine
from utils.extract_stage import (
    get_data_taipei_api,
    get_data_taipei_file_last_modified_time
)
from utils.load_stage import save_geodataframe_to_postgresql
from utils.transform_geometry import add_point_wkbgeometry_column_to_df
from utils.transform_time import convert_str_to_time_format
```

其中 `from utils.* import *` 是引用本專案客製的通用函式，將在本文下方解釋函式作用。

> **i01**
> 欲總覽通用函式請參閱[通用函式總覽](/data-end/utils-overview)章節.

### 3. 靜態變數宣告

接著宣告使用到的靜態變數，一般將靜態變數以全大寫表示：

```python
# Config
RID = "04a3d195-ee97-467a-b066-e471ff99d15d"
PAGE_ID = "ffdd5753-30db-4c38-b65f-b77892773d60"
FROM_CRS = 4326
LOAD_BEHAVIOR = "current+history"
DEFAULT_TABLE = "heal_hospital"
HISTORY_TABLE = "heal_hospital_history"
GEOMETRY_TYPE = "Point"
```

變數的用途將在本文下方介紹函式時提及。

### 4. Extract

Extract 部分包含：

```python
# Extract
res = get_data_taipei_api(RID)
raw_data = pd.DataFrame(res)
raw_data["data_time"] = get_data_taipei_file_last_modified_time(PAGE_ID)
```

Extract 部分只應該負責取得資料，或包含極少的處理。盡可能令 `raw_data` 保留原始，以利後續比較原始資料與處理後資料的差別。

> **i02**
> `get_data_taipei_api` 將根據 `RID`，自 data.taipei 的 API 取得資料。其中重要的是，data.taipei 的 API 每次最多回傳 1,000 筆資料，此函式會自動迴圈取得所有資料。

> **i03**
> `get_data_taipei_file_last_modified_time` 將根據 `PAGE_ID`，自 data.taipei 的網頁取得檔案最後更新時間。

### 5. Transform

Transform 部分包含：

```python
# Transform
# Rename
data = raw_data
data.columns = data.columns.str.lower()
data = data.rename(columns={"機構名稱": "name", "地址": "addr", "x": "lng", "y": "lat"})
# Time
# Ready data with time information should always add time zone.
data["data_time"] = convert_str_to_time_format(data["data_time"])
# Geometry
# TUIC use wkb_geometry format to store geometry data, and use `wkb_geometry` as the column name.
# Ready data always in crs 4326 (WGS84) coordinate system.
gdata = add_point_wkbgeometry_column_to_df(
    data, x=data["lng"], y=data["lat"], from_crs=FROM_CRS
)
# Reshape
gdata = gdata.drop(columns=["geometry", "_id"])
ready_data = gdata[["data_time", "name", "addr", "lng", "lat", "wkb_geometry"]]
```

Transfrom 是最複雜且無法制式化的部分，我們習慣的步驟是：

**_looks_one_** 複製一份原始資料，以避免處理錯誤後，一直重新讀資料。

**_looks_two_** 重命名成易懂的欄位名稱，也讓後續開發者能大概知道資料的內容。

**_looks_3_** 欄位型態轉換與處理

**_looks_4_** 時間標準化

**_looks_5_** 地理空間標準化。將此步驟放在最後，因為資料會被轉成 gpd.geoDataFrame。

**_looks_6_** 選取所需要的欄位。請盡可能保留資料，資料最小化的步驟由後端執行。

> **w03**
> 務必確保 `geometry` 或 `wkb_geometry` 只保留其中一個。若同時將兩個放入資料庫，可能會導致錯誤。

> **i04** 
> `convert_str_to_time_format` 將文字轉成帶有時區的時間格式。特別的是，函式能處理民國年格式，比如"111/02/31"可透過 `from_format="%TY/%m/%d"` 轉換成西元年。

> **i05**
> `add_point_wkbgeometry_column_to_df` 將 x, y 合併成名為 `geometry` 的 `Point` 欄位加入原始資料。同時對原始資料加入名為 `wkb_geometry` 的 WKBGeometry 的欄位。

### 6. Load

最後，Load 部分如：

```python
# Load data to DB
engine = create_engine(READY_DATA_DB_URI)
save_geodataframe_to_postgresql(
    engine,
    gdata=ready_data,
    load_behavior=LOAD_BEHAVIOR,
    default_table=DEFAULT_TABLE,
    history_table=HISTORY_TABLE,
    geometry_type=GEOMETRY_TYPE,
)
```

本專案使用 ETL 流程，只有在資料完全處理好時儲存，也就是只儲存 `ready_data`。

> **i06** 
> `save_geodataframe_to_postgresql`: 將包含地理空間資訊的資料存入資料庫。
>
> `load_behavior`: 控制儲存方式，必須為 `append`, `replace`, `current+history` 三者的其中一個。`append` 是將資料無條件新增至指定表格；`replace` 是將指定表格 truncate 後，再新增資料；`current+history` 共有兩個目的地，其一為 current 表，另一張為 history 表。分別對 current 表執行上面的 replace 操作，再對 history 表執行 append 操作。
>
> `default_table`: 一般而言，是唯一的目的地表名，僅在 `load_behavior="current+history"` 視為 current 表儲存。
>
> `ready_data_history_table`: 是 `ready_data` 的 history 表名，只有在 `load_behavior="current+history"` 時生效。
>
> `geometry_type`: 是地理空間欄位的類型，必須為`Point`, `LineString`, `Polygon`, `MultiPoint`, `MultiLineString`, `MultiPolygon` 其中之一，且與資料庫內欄位一致。

> **i07**
> `current+history` 的設計，是為了同時滿足快速與留存歷史資料。比如 YouBike 站點狀態雖然只呈現當下的即時資料，但我們留存所有歷史資料以供未來分析應用。長期下來，歷史資料會變得冗餘而查詢時間過長；因此另存 current 表，只留最後一次的資料，快速回應前端需求。
