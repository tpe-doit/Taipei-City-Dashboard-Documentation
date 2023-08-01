## 本地安裝

首先，fork 官方的GitHub repository，然後將其 clone 或下載到您的電腦上。接下來，在根目錄中打開終端 (terminal) 並執行 `npm install`。

## 添加 .env 文件

在根目錄中添加一個 `.env` 文件，並將下面的程式複製並貼上至該文件中。

```js
BASE_URL=../..
VITE_APP_TITLE=城市聯合儀表板 // 本應用程式的標題
VITE_MAPBOXTOKEN= // 在這裡輸入您的 Mapbox 金鑰
```

最後，填寫變量 `VITE_MAPBOXTOKEN`，如此才能使用 Mapbox 渲染本專案中的地圖。請創建一個 Mapbox 帳戶，並按照[這個指南](https://docs.mapbox.com/help/getting-started/access-tokens/)來創建您自己的 Mapbox 金鑰。

>**t01**
>如果您不是使用您 Mapbox 帳號的預設公開金鑰，記得將 https://localhost:5173 加入您使用的金鑰的核准網域清單。

## 新增展示用空間資料
本專案的空間資料由於檔案大小較大，因此儲存在他處。請從[這裡](https://drive.google.com/drive/folders/17E-4BRcuHpXg9o5evOWlwY4fI_06VWRd?usp=sharing)下載資料夾並且解壓縮，然後，將資料夾移入本專案的`/public`資料夾。

## 本地運行

在repository的終端中運行 `npm run dev`。
