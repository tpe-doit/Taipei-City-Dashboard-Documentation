---
title: 確認全域變數

---

為了能夠快速在不同環境中部屬並且保護敏感資訊，本專案透過三種方式來記錄會使用到的全域設定：

**_looks_one_** 系統設定

**_looks_two_**  Airflow Connections

**_looks_3_**  Airflow Varialbes


## 系統設定

系統設定檔位於 `/config/dockerfile`。在一般開發過程中，不需要調整或深入瞭解此檔案，只需使用其中的環境變數來生成系統路徑。


## Airflow Connections

Airflow Connections 可以快速添加可連接的資料庫，你可以通過 Airflow 網頁介面進行相關設定。

![image](https://hackmd.io/_uploads/SymqzbWzC.png)

除了在專案初次設定時之外，通常只有在更改資料庫位置時才需要進行調整。以下兩個資料庫連接在本專案中是必需的。

| Conn Id | Conn Type | Host | Port | Schema |
| -------- | -------- | -------- | -------- | -------- |
| postgres_airflow | postgres | {your_ip} | 5432 | airflow |
| postgres_default | postgres | {your_ip} | 5432 | dashboard |

其中 `postgres_airflow` 用以儲存 Airflow metadata， `postgres_default` 用以儲存應用資料。你可以透過 Airflow 網頁介面設置並測試連線是否成功。


## Airflow Variables

Airflow Variables 用於記錄不應該 hardcode 在程式中的資訊，例如 API key、帳號、密碼、email等。你可以透過 Airflow 網頁介面查看相關設定。

![image](https://hackmd.io/_uploads/SymqzbWzC.png)

以下是一些你可能需要用到的變數，若無需要則不用添加。

| Key | Val | 說明 |
| -------- | -------- | -------- |
| DEFAULT_EMAIL_LIST | ["test@mail"]     | 失敗時寄送的 e-mail 收件人 |
| HTTPS_PROXY_ENABLED | true | 是否需要透過 proxy 對外連線 |
| PROXY_URL | {'https': 'ip:port'} | 當你的環境需要透過 proxy 對外連線 |
| TDX_CLIENT_ID | your_tdx_clien_id | 使用 TDX 平台所需要的帳號* |
| TDX_CLIENT_SECRET | your_tdx_clien_secret | 使用 TDX 平台所需要的密碼 |
| CWA_API_KEY | your_cwa_api_key | 使用氣象資料開放平臺 API 需要的金鑰* |

> **i01**
> 運輸資料流通服務平臺(Transport Data eXchange, TDX)，是台灣首屈一指的資訊代理站，整合了交通、觀光等資料。

> **i02**
> 氣象資料開放平臺是由中央氣象署(Central Weather Administration, CWA)建立，收錄了有關氣象、地震、天文等資料。


## 實際應用

為了方便開發者管理全域變數，本專案將所有使用到的全域變數集中在 `/dag/settings/global_config.py` 中。開發者可根據需求進行調整。
