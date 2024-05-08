## 在本地運行專案

**_looks_one_** Fork [專案程式庫](https://github.com/tpe-doit/Taipei-City-Dashboard-DE-Hackathon-2024)，然後將專案 clone 到您的電腦。

**_looks_two_** 用 VSCode 或您偏好的程式編輯器開啟 `Taipei-City-Dashboard-DE` 程式庫。

**_looks_3_** 本專案旨在開源程式碼讓開發者參考，未使用 Docker 部屬環境，這雖然簡化了安裝的程序，卻也造成路徑使用的問題。
您會在本專案的每個範例看到以下程式碼：

```python
import os
import sys

dags_path = os.path.join(os.getcwd(), 'dags')  # Should be looks like '.../dags'
sys.path.append(dags_path)
```

這是為了將專案路徑加入環境變數，從而能讓程式能找到需要的設定與涵式。考慮到您可能會逐行手動測試程式，`os.getcwd()` 取得的路徑可能並不固定，導致取得非預期的 `dags_path`。

請務必確保您的 `dags_path` 取得路徑如 `./dags`，而不是 `./dags/utils` 或 `./dags/proj_city_dashboard\simple_template\template_dag.py`。

若 `dags_path` 取得 `./dags/utils` ，則程式應修改成 `dags_path = os.path.join(os.getcwd(), "..")`。

若 `dags_path` 取得 `./dags/proj_city_dashboard/simple_template\template_dag.py`，則程式應修改成 `dags_path = os.path.join(os.getcwd(), "..", "..")`。

請根據您實際的工作資料夾，進行相應調整。

## 全域設定

本專案將使用到的全域設定集中在 `/dags/settings/global_config.py`。開發者需要手動調整讓其適用於您的本地端，以下是 `global_config.py` 的內容：

```python
import os

# DAG_PATH is the path of your DAG file, and located by the path of this file.
# You should make sure this file is in some relative path like "dags/settings/global_config.py"
DAG_PATH = os.path.join(os.path.dirname(__file__), "..")

# DATA_PATH is the path of your temporary data file storage.
DATA_PATH = os.path.join(DAG_PATH, "..", "data")

# HTTPS_PROXY_ENABLED controls whether to use the proxy.
# If you are in a company network or in high security environment, you may need to set this to True.
HTTPS_PROXY_ENABLED = False

# If you need to use the proxy, you should set the proxy address here.
# The format should be like "{ip}:{port}"
if HTTPS_PROXY_ENABLED:
    PROXIES = {"http": "{ip}:{port}", "https": "{ip}:{port}"}
else:
    PROXIES = None

# READY_DATA_DB_URI is the URI of the database where you want to store the data.
# The format should be like "postgresql://{username}:{password}@{ip}:{port}/{database_name}"
#   if you use PostgreSQL.
READY_DATA_DB_URI = "postgresql://{username}:{password}@{ip}:{port}/{database_name}"
```

一般來說，需要確認的參數只有：

`HTTPS_PROXY_ENABLED`： 此參數控制對外取得資料時是否需要經過 proxy，通常是特殊的網路環境或嚴格的資安規定才需要，一般開放網路環境維持 `False`。

`READY_DATA_DB_URI`： 資料最後的目的地，務必換上您的資料庫資訊以讓 Python 連線。
