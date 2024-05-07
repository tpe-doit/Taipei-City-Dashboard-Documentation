## 在本地運行專案

**_looks_one_** Fork [專案程式庫](https://github.com/tpe-doit/Taipei-City-Dashboard)，然後將專案 clone 到您的電腦。

**_looks_two_** 用 VSCode 或您偏好的程式編輯器開啟 `Taipei-City-Dashboard-DE` 程式庫。

**_looks_3_** 本專案旨在開源程式碼讓開發者參考，未使用 Docker 部屬環境，這雖然簡化了安裝的程序，卻也造成路徑使用的問題。
您會在本專案的每個範例看到以下程式碼:

```python
import os
import sys

dags_path = os.path.join(os.getcwd(), 'dags')  # Should be looks like '.../dags'
sys.path.append(dags_path)
```

這是為了將本專案的路徑加入環境變數，從而能讓程式能找到需要的設定與涵式。考慮到您可能會逐行手動測試程式，`os.getcwd()` 取得的路徑可能並不固定，導致取得非預期的 `dags_path`。

請務必確保您的 `dags_path` 取得路徑如 `./dags`，而不是 `./dags/utils` 或如 `./dags/proj_city_dashboard\simple_template\template_dag.py`。

若 `dags_path` 取得 `./dags/utils` ，則程式應修改成 `dags_path = os.path.join(os.getcwd(), "..")`。

若 `dags_path` 取得 `./dags/proj_city_dashboard/simple_template\template_dag.py` ，則程式應修改成 `dags_path = os.path.join(os.getcwd(), "..", "..")`。

根據您實際的當前工作路徑，進行相應調整。
