## 快速架設專案

### Docker

**_looks_one_** 在電腦上安裝 [Docker](https://www.docker.com/products/docker-desktop/) 並執行之。

**_looks_two_** Fork [專案 Repository](https://github.com/tpe-doit/Taipei-City-Dashboard-FE) 並將其 clone 至電腦。在 Repository 終端執行 `pwd` (mac) 或 `cd` 以獲得完整的檔案路徑。

**_looks_3_** 在系統終端執行以下指令，並以步驟二得到的檔案路徑取代 "&lt;repository path&gt;" 。

```bash
docker run -v &lt;repository path&gt;:/opt/Taipei-City-Dashboard-FE -p 80:80 -it node:18.18.1-alpine3.18  sh
```

**_looks_4_** 執行以下指令以進入專案資料夾並安裝相關套件。

```bash
cd /opt/Taipei-City-Dashboard-FE
npm install
```

**_looks_5_** 現在執行 `npm run dev` 即可以啟動本地伺服器。

### 本地安裝

**_looks_one_** 在您的電腦下載 [Node.js](https://nodejs.org/en)。

**_looks_two_** Fork [專案 Repository](https://github.com/tpe-doit/Taipei-City-Dashboard-FE) 並將其 clone 至電腦。

**_looks_3_** 在 Repository 終端執行 `npm install` 。

**_looks_4_** 現在執行 `npm run dev` 即可以啟動本地伺服器。

## 添加 .env 文件

在根目錄中添加一個 `.env` 文件，並將下面的程式複製並貼上至該文件中。

```js
BASE_URL=../..
VITE_APP_TITLE=臺北城市儀表板開源版 // 本應用程式的標題
VITE_MAPBOXTOKEN=pk... // 在這裡輸入您的 Mapbox 金鑰
VITE_MAPBOXTILE=mapbox:// // 在這裡輸入 Mapbox Tileset 連結（台北市大樓 3D 模型）
```

### Mapbox 金鑰

填寫變量 `VITE_MAPBOXTOKEN`，如此才能使用 Mapbox 渲染本專案中的地圖。請創建一個 Mapbox 帳戶，並按照[這個指南](https://docs.mapbox.com/help/getting-started/access-tokens/)來創建您自己的 Mapbox 金鑰。

> **t01**
> 如果您不是使用您 Mapbox 帳號的預設公開金鑰，記得將 https://localhost:80 加入您使用的金鑰的核准網域清單。

### 新增台北市大樓 3D 模型 (非必要)

首先，從[這裡](https://drive.google.com/file/d/1cMBrq1gmSNAioogFZNqA5IyAmhXoeLVs/view?usp=drive_link)下載模型檔案(`geojson`)；再來，打開 Mapbox Studio 並前往 [「Tilesets」](https://studio.mapbox.com/tilesets/)；點擊「New Tileset」並上傳先前下載的模型檔案；上傳完成後，將 tileset 打開並點擊 「share & use」；複製「Tileset ID」並加到 `.env` 檔案中的`VITE_MAPBOXTILE`變量後(直接貼在「mapbox://」後面)。

## 解壓縮展示用空間資料

本專案的空間資料由於檔案大小較大，因此在上傳 GitHub 前有先壓縮。請在根目錄中打開終端 (terminal) 並執行下列指令。

```bash
cd /public
tar xmzf mapData.tar.gz
```
