---
title: 通用函式-轉換地理空間

---


## 前言
`通用函式-轉換地理空間` 包含3維Polygon轉成2維、LineString轉成MultiLineString、Polygon轉成MultiPolygon、根據x, y加入Point欄位、geometry轉成WKBGeometry格式。其中有部分為子函式，以下將不會說明子函式。可在 `/dag/utils/transform_geometry.py` 找到此module。

> **w01**
> 務必確認你已經查看[確認設定檔](/data-end/dag-config)章節並設置完成。

> **w02**
> 範例程式都會添加以下幾行程式，以確保將本專案的路徑加入環境變數，從而能找到 `utils` 與 `settings` 等資料夾。
> ``` python
> import os
> import sys
>
> dags_path = os.path.join(os.getcwd(), 'dags')  # Should be looks like '.../dags'
> sys.path.append(dags_path)
> ```

## 函式說明
### def convert_geometry_to_wkbgeometry(gdf, from_crs)
對包含geometry欄位的gpd.geoDataFrame增加一個WKBGeometry格式的`wkb_geometry`欄位。輸出結果固定為 `EPSG:4326`，也就是 `WGS84` 坐標系。
``` python
import os
import sys

dags_path = os.path.join(os.getcwd(), 'dags')  # Should be looks like '.../dags'
sys.path.append(dags_path)
import pandas as pd
import geopandas as gpd
from shapely.geometry import Polygon
from utils.transform_geometry import convert_geometry_to_wkbgeometry

data = pd.DataFrame({
    'id': [1, 2],
    'attribute': ['A', 'B']
})
poly = pd.Series([
    Polygon([[262403, 2779407], [262404, 2779407], [262404, 2779408]]),
    Polygon([[262403, 2779407], [262405, 2779407], [262404, 2779408]])
])
gdf = gpd.GeoDataFrame(data, geometry=poly, crs='EPSG:3826')
gdf = convert_geometry_to_wkbgeometry(gdf, from_crs=3826)
print(gdf.iloc[0])
```
```
>>> print(gdf.iloc[0])
id                                                              1
attribute                                                       A
geometry        POLYGON ((121.12299765144614 25.12299971980088...
wkb_geometry    POLYGON ((121.12299765144614 25.12299971980088...
Name: 0, dtype: object
```

### def add_point_wkbgeometry_column_to_df(data, x, y, from_crs)
將x, y資料製成一個名為 `geometry` 的包含Point資料的欄位。同時加入另一個名為 `wkb_geometry` 的表示同樣資料但格式轉換為WKBGeometry的欄位。
``` python
import os
import sys

dags_path = os.path.join(os.getcwd(), 'dags')  # Should be looks like '.../dags'
sys.path.append(dags_path)
import pandas as pd
import geopandas as gpd
from utils.transform_geometry import add_point_wkbgeometry_column_to_df

data = pd.DataFrame({
    'id': [1, 2],
    'attribute': ['A', 'B']
})
x = pd.Series([262403.2367, None])
y = pd.Series([2779407.0527, ''])
gdf = add_point_wkbgeometry_column_to_df(data, x, y, from_crs=3826)
print(gdf.iloc[0])
```
```
>>> print(gdf.iloc[0])
id                                                          1
attribute                                                   A
geometry        POINT (121.12299999921674 25.123000193639967)
lng                                                   121.123
lat                                                    25.123
wkb_geometry    POINT (121.12299999921674 25.123000193639967)
Name: 0, dtype: object
```

### def convert_3d_polygon_to_2d_polygon(geometry)
將包含z軸的3D Polygon轉成沒有z軸的2D Polygon。
``` python
import os
import sys

dags_path = os.path.join(os.getcwd(), 'dags')  # Should be looks like '.../dags'
sys.path.append(dags_path)
import geopandas as gpd
from shapely.geometry import Polygon
from utils.transform_geometry import convert_3d_polygon_to_2d_polygon

polygon_with_z = Polygon([(0, 0, 0), (1, 0, 1), (1, 1, 2), (0, 1, 3), (0, 0, 0)])
geos_polyz = gpd.GeoSeries([polygon_with_z, polygon_with_z])
print(geos_polyz)
# >>> print(geos_polyz)
# 0    POLYGON Z ((0.00000 0.00000 0.00000, 1.00000 0...
# 1    POLYGON Z ((0.00000 0.00000 0.00000, 1.00000 0...
# dtype: geometry

geos_poly = geos_polyz.apply(convert_3d_polygon_to_2d_polygon)
print(geos_poly)
# >>> print(geos_poly)
# 0    POLYGON ((0.00000 0.00000, 1.00000 0.00000, 1....
# 1    POLYGON ((0.00000 0.00000, 1.00000 0.00000, 1....
# dtype: geometry
```

### def convert_linestring_to_multilinestring(geo)
將LineString修改為MultiLineString，通常是因為欄位值混雜此兩種格式，修改為同一種格式以符合DB欄位型態。範例如下:
``` python
import os
import sys

dags_path = os.path.join(os.getcwd(), 'dags')  # Should be looks like '.../dags'
sys.path.append(dags_path)
import geopandas as gpd
from shapely.geometry import LineString
from utils.transform_geometry import convert_linestring_to_multilinestring

geos = gpd.GeoSeries([LineString([[0,0], [1,1]]), LineString([[0,0], [1,1]])])

geos_mline = geos.apply(convert_linestring_to_multilinestring)
print(geos_mline)
```
```
>>> print(geos_mline)
0    MULTILINESTRING ((0.00000 0.00000, 1.00000 1.0...
1    MULTILINESTRING ((0.00000 0.00000, 1.00000 1.0...
dtype: geometry
```


### def convert_polygon_to_multipolygon(geo)
將Polygon修改為MultiPolygon，通常是因為欄位值混雜此兩種格式，修改為同一種格式以符合DB欄位型態。
``` python
import os
import sys

dags_path = os.path.join(os.getcwd(), 'dags')  # Should be looks like '.../dags'
sys.path.append(dags_path)

import geopandas as gpd
from shapely.geometry import LineString
from utils.transform_geometry import convert_polygon_to_multipolygon

poly = Polygon([[0,0], [1,1], [1,0]])
geos = gpd.GeoSeries([poly, poly])
geos_mpoly = geos.apply(convert_polygon_to_multipolygon)
print(geos_mpoly)
```
```
>>> print(geos_mpoly)
0    MULTIPOLYGON (((0.00000 0.00000, 1.00000 1.000...
1    MULTIPOLYGON (((0.00000 0.00000, 1.00000 1.000...
dtype: geometry
```