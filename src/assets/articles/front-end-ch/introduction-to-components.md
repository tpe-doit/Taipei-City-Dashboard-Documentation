## 概觀

組件是構成儀表板的資料集合。所有組件都包含可以以圖表呈現的統計資料。組件還可以選擇性的包含空間和歷史資料。

## 組件配置

每個組件均有 ID 與 Index 兩個獨特識別代碼，其中 ID 為組件的獨特編號，而 Index 為比較容易識別組件內容的獨特英文字串。所有組件配置（Object）都是以 Array 形式回傳。組件的完整配置如下所示。

[`GET` `/api/v1/component`](/back-end/component-config-apis) [`DB` `dashboardmanager.components`](/back-end/components-db)

```json
[{
    "id": 7, // Number; 必須是獨特的編號並與統計資料和歷史資料的檔名相同
    "index": "patrol_criminalcase", // String; 索引
	"chart_config": {},  // Object; 詳見下方第1個資訊匡
	"query_data": "time", // two_d || three_d || time || percent || map_legend; 圖表資料類型
    "map_config": null, // Object || null; 詳見下方第2個資訊匡
	"map_filter": null, // Object || null; 詳見下方第3個資訊匡
    "history_config": null, // Object || null; 詳見下方第4個資訊匡
    "name": "刑事統計", // String; 組件名稱
    "source": "警察局", // String; 來源名稱
    "time_from": "halfyear_ago", // String; 詳見下方第5個資訊匡
    "time_to": "now", // "now" || null;
    "update_freq": 1, // Number || null; 更新頻率
    "update_freq_unit": "month", // String; 更新頻率單位
    "short_desc": "...", // String; 簡短描述
    "long_desc": "...", // String; 詳細描述
    "use_case": "...", // String; 使用案例描述
    "links": ["https://…", ...], // Array of Strings || null; 原始資料來源
    "tags": ["..."], // Array; 組件的標籤
	"contributors": ["tuic", ...] // Array of Strings; 貢獻者 id
}]
```

> **i01**
> 所有一般組件都有統計資料，因此組件配置中應包含圖表配置。圖表配置將在[後面的文章](/front-end/supported-chart-types#chart-config)中詳細介紹。

> **i02**
> 如果組件具有空間資料，請輸入地圖配置。如果沒有，請輸入 `null`。地圖配置將在[後面的文章](/front-end/supported-map-types#map-config)中詳細介紹。

> **i03**
> 如果組件希望支援以圖表篩選地圖的功能，請輸入地圖篩選配置。如果沒有，請輸入 `null`。地圖篩選配置將在[後面的文章](/front-end/map-filtering)中詳細介紹。

> **i04**
> 如果組件具有歷史資料，請輸入歷史資料配置。如果沒有，請輸入 `null`。歷史資料配置將在[後面的文章](/front-end/history-data)中詳細介紹。

> **i05**
> 如果組件顯示靜態或示範資料，請輸入 `static` 或 `demo`。如果組件顯示最新可用資料，請輸入 `current`。如果組件顯示自某個時間點以來的資料，請輸入 `day_ago`、`week_ago`、`month_ago`、`quarter_ago`、`halfyear_ago`、`year_ago`、`twoyear_ago`、`fiveyear_ago`、`tenyear_ago` 或 `max`。如果組件顯示自某個時間點開始的資料，請輸入 `day_start`、`week_start`、`month_start`、`quarter_start` 或 `year_start`。
>
> 程式將自動計算查詢資料的實際日期和時間。
