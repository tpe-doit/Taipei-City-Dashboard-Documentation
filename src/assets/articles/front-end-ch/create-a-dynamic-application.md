## 簡介

由於安全和隱私問題，本專案將儀表板的內部版本改寫為靜態網頁。但是我們亦有特別確保如果需要轉變回動態網頁，能輕易完成。

本指南將介紹三種將此專案轉變為半動態或完全動態應網頁的方法。

## 動態資料來源

第一種情況是部分或完全介接動態資料源，但不串接後端。目前，本專案中包含的所有統計或空間資料都直接儲存在專案本地端中。然而，目前抓取本地資料的方法亦可以很容易地修改成為接受動態資料源。

> **t01**
> 如果您只需要接受動態資料，並且不需要實現任何其他後端功能，我們建議仍要讀完[前一篇文章](/front-end/create-a-static-application)(轉為純靜態網頁)。

下面的指南將以獲取統計資料為例。這些步驟也可以應用於歷史資料和空間資料。

### 步驟 1 修改圖表配置

對於接受動態數據的組件，在圖表配置中添加一個“source”參數，在此參數中填入抓取資料的 API。

```json
"chart_config": {
    "color": ["#2e999b", "#80e3d4", "#1f9b85", "#a5ece0"],
    "types": ["ColumnChart", "RadarChart", "BarPercentChart"],
    "unit": "人",
    "categories": [],
	"map_filter": null,
    // 添加一個source參數
    "source": "https://.../api/.../..." // String；數據源的 API
},
```

### Step 2 修改 ContentStore 函式

將下列程式片段加到`contentStore`的`setCurrentDashboardChartData`函式。這個程式片段會檢查圖表配置中是否有 source 參數以決定要從哪個資料源獲取資料。

```js
setCurrentDashboardChartData() {
    this.currentDashboard.content.forEach((component, index) => {

        // 程式片段開始
        const chartDataSource = this.currentDashboard.content[index].chart_config.source
          ? this.currentDashboard.content[index].chart_config.source
          : `/chartData/${component.id}.json`;
        // 程式片段結束

        axios
            .get(chartDataSource) // 將原本這裡填的連結改為「chartDataSource」
            .then((rs) => {
                ...
            })
    })
}
```

### 步驟 3 編譯獲取的資料（選擇性加入）

如果動態資料源的資料格式不是本專案支援的格式，您需要編寫額外的編譯函式(parsing function)以使圖表能渲染資料。建議同樣在 `contentStore` 中完成此步驟，並將編譯函數儲存在 `src/assets/utilityFunctions` 中。

現在，本專案即能夠接受動態圖表資料。如要接受動態歷史和空間資料僅需遵照與上述相似的步驟即可達成。

## 客製後端

第二種情況是將此專案連接到後端。本指南不會詳細介紹後端應該如何建置，而只是建議應該包含在後端中的功能，以最大程度發揮此專案的潛力。

本指南也不會逐步介紹如何呼叫 API。本專案可以轉為動態的功能背後的函式，都可以直接替換呼叫的連結，實現方法與上方[接受動態資料源](/front-end/create-a-dynamic-application#dynamic-data-source) 指南中列出的步驟類似。

### 建議包含的功能

**用戶身份驗證**

為了為每個用戶創建個人化體驗，用戶身份驗證是必要的。我們建議將處理驗證的函式與用戶資料儲存在 `authStore` 中。

> **i01**
> 由於用戶身份驗證系統間差異相當大，因此本專案中沒有預先建置的登錄界面或路徑控管機制。

**集中儲存儀表板和組件規格**

儀表板和組件是本專案的基本元素。因此，將其相關資料儲存在易於讀取和清晰的格式中非常重要。

**預處理資料**

我們強烈建議在將資料發送到前端之前在後端完成任何資料處理或編譯。這將減輕用戶設備的負擔並使維護前端更加容易。應努力確保簡單的 `GET` API 即可獲取所有所需資料並以正確的格式提供。

**修改儀表板的能力**

我們建議實現在此 [先前文章中](/front-end/modifying-a-dashboard)（編輯儀表板）中列出的所有功能。這將允許用戶充分利用此專案。

**儲存地圖位置（選擇性加入）**

本專案一個小功能是在地圖頁面中保存地圖位置。如用戶需要經常查看某些特定地理區域的數據時，這很有用。如果您不需要此功能，請按照 [此先前文章中的第 7 步](/front-end/create-a-static-application#step-7-mapcontainer.vue) 進行刪除。

### 建議的 API 規格

**`GET` APIs**

對於 `GET` API，請按照本專案各個配置格式建置。也建議參考當前用於提供靜態資料的各種 `json` 文件。如按照現有規格建立 `GET` API，即可與本專案直接相容。

**`POST`，`PUT`，`DELETE` API**

對於其他類型的 API，盡量以最簡潔的方式建構，並努力仿造本專案的現有行為。

## 與臺北城市儀表板後端連接

即將推出...

這是第三種情況。釋放臺北城市儀表板後端的開源版本的工作仍在進行中。
