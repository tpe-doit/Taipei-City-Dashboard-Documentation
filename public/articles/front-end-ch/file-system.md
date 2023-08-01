## /src
### /assets
`/assets` 資料夾儲存靜態項目，例如全域樣式(Global Styles)、計算函式(Utility Functions)、圖片、圖表配置、地圖配置以及專案中使用的圖示字體檔。

### /views
`/views` 資料夾儲存 Vue 元件 `Dashboard.vue` 和 `Map.vue`，分別是儀表板頁面和地圖頁面的版型。

### /components
`/components` 資料夾儲存較小的 Vue 元件，用於組成使用者介面。根目錄包含導航列(NavBar)、側邊欄(SideBar)和設定列(SettingsBar)的版型。

子資料夾 `/components` 儲存組件的版型；子資料夾 `/charts` 儲存各種圖表的版型；子資料夾 `/map` 儲存與地圖相關的 Vue 元件；子資料夾 `/dialogs` 儲存所有彈跳視窗的版型；子資料夾 `/utilities` 儲存不屬於上述類別的 Vue 元件。

### /store
`/store` 資料夾是所有 Pinia Store 的所在地。本專案透過調閱這些 Pinia Stores 中的函式與資料，實現全域狀態管理。

`authStore` 儲存與使用者驗證相關的資訊和函式；`contentStore` 負責呼叫和儲存儀表板和組件；`mapStore` 儲存 Mapbox 地圖和相關函式；`dialogStore` 控制何時顯示哪些彈跳視窗。

> **w01**
> 本專案的內部版本中包含使用者驗證功能。然而，由於安全和隱私的考慮，與此功能相關的程式碼已從開源版本中移除。目前，`authStore` 中僅提供指南和幾個空函式，如果將來需連接後端，即可以利用這些函式。詳細資訊請閱讀[此文章](/front-end/create-a-dynamic-application)。

### /router
`/router` 資料夾包含 Vue-router 的配置。在此專案中，只有兩個主要路徑 `/dashboard` 和 `/mapview`。這兩個路徑都需要一個查詢參數 `index`，用於指定要顯示的儀表板。

## /public
`/public` 資料夾儲存較大檔案與靜態資料。

子資料夾 `/dashboards` 儲存儀表板列表和組件列表；子資料夾 `/chartData` 儲存適用的組件的示範統計資料；子資料夾 `/historyData` 儲存適用的組件的示範歷史資料；子資料夾 `/mapData` 儲存適用的組件的示範空間資料；子資料夾 `/js` 和 `/images` 儲存其他本專案使用的資源和配置檔。
