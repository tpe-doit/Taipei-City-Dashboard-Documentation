## 前言

臺北城市儀表板的資料端使用 Airflow 排程與監控資料流，但本專案開源的目的是為了黑客松參賽者能快速使用來處理資料，而非增加系統增加賽制難度。因此沒有系統化的設定檔，我們將使用到的全域設定集中在 `/dags/settings/global_config.py`。需要開發者手動調整讓其適用於你的本地端。

## 設定檔

以下是 `global_config.py` 的全部內容:

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

一般來說，需要確認的參數只有:

HTTPS_PROXY_ENABLED：此參數控制對外取得資料時是否需要經過 proxy，通常是特殊的網路環境或嚴格的資安規定才需要，一般開放網路環境維持 `False`。

READY_DATA_DB_URI：資料最後的目的地，務必換上你的資料庫資訊以讓 Python 連線。
