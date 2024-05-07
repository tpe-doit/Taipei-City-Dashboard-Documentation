---
title: 通用函式-取得TDX token

---

## 前言
`通用函式-處理地址`取得TDX平台token(需自行申請帳號)。可在`/dag/utils/transform_address.py`找到此module。

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
### class TDXAuth
可以在 `/dags/utils/auth_tdx.py` 找到原始碼。是用來取得TDX的token。每次取得後會儲存 `token.pickle` 檔案，程式重複使用直到過期再取得並儲存。
TDX的API需要登入，請先修改 `TDX_CLIENT_ID` 與 `TDX_CLIENT_ID` 於行21~24如下:
``` python
def __init__(self):
    self.client_id = "your_TDX_CLIENT_ID"
    self.client_secret = "your_TDX_CLIENT_ID"
    self.full_file_path = f"{DATA_PATH}/{FILE_NAME}"
```

使用範例如下:
``` python
# Get Taipei YouBike stations from TDX
import os
import sys

dags_path = os.path.join(os.getcwd(), 'dags')  # Should be looks like '.../dags'
sys.path.append(dags_path)
import requests
import pandas as pd
from utils.auth_tdx import TDXAuth

TPE_URL = r"https://tdx.transportdata.tw/api/basic/v2/Bike/Station/City/Taipei?%24format=JSON"

tdx = TDXAuth()
token = tdx.get_token()
# get data
headers = {"authorization": f"Bearer {token}"}
tpe_response = requests.get(
    TPE_URL, headers=headers, timeout=60
)
tpe_res_json = tpe_response.json()
tpe_data = pd.DataFrame(tpe_res_json)
print(tpe_data)
```
```
>>> print(tpe_data.iloc[0]) 
StationUID                                              TPE500101001
StationID                                                  500101001
AuthorityID                                                      TPE
StationName        {'Zh_tw': 'YouBike2.0_捷運科技大樓站', 'En': 'YouBike...
StationPosition    {'PositionLon': 121.5436, 'PositionLat': 25.02...
StationAddress     {'Zh_tw': '復興南路二段235號前', 'En': 'No.235, Sec. 2...
BikesCapacity                                                     28
ServiceType                                                        2
SrcUpdateTime                              2024-05-06T20:43:18+08:00
UpdateTime                                 2024-05-06T20:43:26+08:00
Name: 0, dtype: object
```