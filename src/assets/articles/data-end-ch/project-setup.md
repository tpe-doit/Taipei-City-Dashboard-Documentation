
本指南提供使用 Docker 構建和啟動 Airflow 環境的逐步過程。

## 先決條件

開始之前，請確保已安裝 Docker 與 Docker Compose。

### Step 1: 建立一個新的 Docker Image

首先，確保你位於包含 Dockerfile 的 `local-env` 目錄中。使用以下指令建立名為 `myairflow`, tag 為 `2.7.3` 的 Docker Image：

```bash
docker build -t myairflow:2.7.3 .
```

### 第二步：創建 .env 文件

在當前目錄（docker-compose.yaml 所在目錄）中創建一個 `.env` 文件，並添加以下內容：

```bash
AIRFLOW_IMAGE_NAME=myairflow:2.7.3
AIRFLOW_UID=50000
AIRFLOW_PROJ_DIR=../
_AIRFLOW_WWW_USER_USERNAME=airflow
_AIRFLOW_WWW_USER_PASSWORD=airflow
```

**_looks_one_** `AIRFLOW_IMAGE_NAME`: 剛構建的 Docker Image 的名稱和 tag。

**_looks_two_** `AIRFLOW_UID`: Airflow 使用的用戶 ID。

**_looks_3_** `AIRFLOW_PROJ_DIR`: 你的 Airflow 專案目錄。

**_looks_4_** `_AIRFLOW_WWW_USER_USERNAME` 與 `_AIRFLOW_WWW_USER_PASSWORD`: Airflow 預設的網頁界面帳號和密碼。

這些環境變量將在 Docker Compose 中用於設定 Airflow 的基本配置。

### 第三步：啟動 Docker Compose

確保你位於包含 `docker-compose.yml` 的目錄中。然後使用以下命令啟動 Airflow containers：

```bash
docker-compose up -d
```

此命令將 containers 在背景啟動。檢查 Docker containers 的狀態，請使用：

```bash
docker-compose ps
```

### 第四步：訪問 Airflow 網頁界面

Airflow 啟動後，打開瀏覽器並訪問 `http://localhost:8080`。

使用 `.env` 文件中指定的用戶名和密碼登錄，預設值如下：

```
- Username: airflow
- Password: airflow
```

在 Airflow 網頁介面中，你可以根據需要，在介面的 Admin 部分配置必要的 Connections 和 Variables。

> **w01**
> 如果你沒有臺北城市儀表板的範例 PostgreSQL 資料庫，可以按照以下步驟創建。

## 設置 PostgreSQL 數據庫

要設置範例 PostgreSQL 環境，請按照以下步驟操作：

### 第一步：啟動 PostgreSQL 和 pgAdmin 容器

`docker-compose-db.yaml` 文件定義了兩個服務：分別為 PostgreSQL container（名為 dashboard-data）和 pgAdmin container。

> **i01**
> pgAdmin 是用來操作 PostgreSQL 的 UI 介面，可通過 port `8889` 訪問。


要啟動這些容器，請使用以下指令：

```bash
docker-compose -f docker-compose-db.yaml up -d
```

上述指令將會創建一個名為 dashboard 的資料庫，並默認用戶是 airflow，密碼為 airflow。會將資料儲存於本地 volume `./db-data`。

> **i02**
> 預設 email 和 password 通過 `.env` 中的環境變量設置。


### 第二步：使用 pgAdmin 連接到 PostgreSQL

啟動成功後，可以透過瀏覽器輸入 `http://localhost:8889` 訪問 pgAdmin。

使用 `docker-compose-db.yaml` 中指定的電子郵件和密碼（PGADMIN_DEFAULT_EMAIL 和 PGADMIN_DEFAULT_PASSWORD）登錄。

接下來，預設使用以下資訊創建到 `db:dashboard-data/dashboard` 資料庫：

```
- Host: `dashboard-data`
- Port: `5432`
- Database: `dashboard`
- Username: `airflow`
- Password: `airflow`
```

### 第三步：從備份中恢復數據庫

於 pgAdmin 建立好資料庫連接後，從備份文件恢復數據庫。請按照以下步驟操作：

**_looks_one_** 在 pgAdmin 中，右鍵單擊已連接的資料庫，選擇 "Restore"。

**_looks_two_** 上傳並選擇文件 `local-env/dashboard-init` 進行備份資料復原。

**_looks_3_** 於 "Data Options" 分頁，將 "Owner" 旁邊的開關移到右側位置，以排除設置物件所有權的命令。

**_looks_4_** 同樣於 "Data Options" 分頁，將 "Privileges" 旁邊的開關移到右側位置，以排除創建訪問權限的命令。

### 第四步：完成

資料復原過程完成後，你應該已經準備好臺北大數據中心團隊提供的 Airflow 運行所需的資料庫 schema。你現在可以透過 Airflow 網頁介面運行你的 Airflow DAGs。
