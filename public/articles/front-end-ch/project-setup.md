## 本地安裝

首先，fork 官方的repository，然後將repository clone或下載到您的電腦上。接下來，在repository的根目錄中打開終端並執行 `npm install`。

## 添加 .env 文件

在repository的根目錄中添加一個 `.env` 文件。將下面的程式複製並貼上至該文件中。

```js
BASE_URL=../..
VITE_APP_TITLE=城市聯合儀表板 // 本應用程式的標題
VITE_MAPBOXTOKEN= // 在這裡輸入您的 Mapbox 金鑰
```

最後，填寫變量 `VITE_MAPBOXTOKEN`，如此才能使用 Mapbox 渲染此專案中的地圖。請創建一個 Mapbox 帳戶，並按照[這個指南](https://docs.mapbox.com/help/getting-started/access-tokens/)來創建您自己的 Mapbox 金鑰。

## 本地運行

在repository的終端中運行 `npm run dev`。
