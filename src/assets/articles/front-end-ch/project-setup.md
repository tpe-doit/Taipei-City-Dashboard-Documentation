## 本地安裝

首先，fork 官方的 GitHub repository，然後將其 clone 或下載到您的電腦上。接下來，在根目錄中打開終端 (terminal) 並執行 `npm install`。

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
> 如果您不是使用您 Mapbox 帳號的預設公開金鑰，記得將 https://localhost:5173 加入您使用的金鑰的核准網域清單。

### 新增台北市大樓 3D 模型 (非必要)

首先，從[這裡](https://drive.google.com/file/d/1cMBrq1gmSNAioogFZNqA5IyAmhXoeLVs/view?usp=drive_link)下載模型檔案(`geojson`)；再來，打開 Mapbox Studio 並前往 [「Tilesets」](https://studio.mapbox.com/tilesets/)；點擊「New Tileset」並上傳先前下載的模型檔案；上傳完成後，將 tileset 打開並點擊 「share & use」；複製「Tileset ID」並加到 `.env` 檔案中的`VITE_MAPBOXTILE`變量後(直接貼在「mapbox://」後面)。

## 解壓縮展示用空間資料

本專案的空間資料由於檔案大小較大，因此在上傳 GitHub 前有先壓縮。請在根目錄中打開終端 (terminal) 並執行下列指令。

```bash
cd /public
tar xmzf mapData.tar.gz
```

## 本地運行

在 repository 的終端中運行 `npm run dev`。
