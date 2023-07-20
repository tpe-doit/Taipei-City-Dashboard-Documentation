## 概觀
組件是構成儀表板的數據集合。除了地圖圖層組件外，所有組件都包含可以以圖表或圖形形式呈現的統計資料。組件還可以選擇性包含空間和歷史資料。

### 地圖圖層
地圖圖層組件是僅包含空間資料的組件。如儀表板指南中所述，地圖圖層組件全數儲存並顯示於地圖圖層儀表板中。

## 組件配置
無論類型為何，所有組件配置（Object）都存儲在一個單一Object中，key是每個組件的ID。一般組件和地圖圖層組件的完整配置如下所示。

> **i01**
> 每個組件的統計、空間和歷史資料另外存儲於其他文件夾，如[此前的文章](/front-end/file-system)中所述。

### 一般組件
```json
"7": {
    "id": 7, // Number; ID
    "index": "patrol_criminalcase", // String; 索引
    "history_data": false, // Boolean; 是否有歷史數據
    "history_data_color": null, // Array || null; hex色碼，預設為圖表顏色
    "map_config": null, // Object || null; 詳見下方第2個資訊匡
    "chart_config": {
    },  // Object; 詳見下方第3個資訊匡
    "name": "刑事統計", // String; 組件名稱
    "source": "警察局", // String; 來源名稱
    "time_from": "2023-01-01T23:59:59+08:00", // String || null; 數據時間範圍（起始）
    "time_to": "2023-05-01T23:59:59+08:00", // String || null; 數據時間範圍（結束）
    "update_freq": 1, // Number || null; 更新頻率 
    "update_freq_unit": "month", // String; 更新頻率單位
    "short_desc": "...", // String; 簡短描述
    "long_desc": "...", // String; 詳細描述
    "use_case": "...", // String; 使用案例描述
    "links": ["https://…", ...], // Array of Strings || null; 原始資料來源
    "tags": ["..."], // Array; 組件的標籤
	"contributors": ["tuic", ...] // Array of Strings; 貢獻者 id
},
```

### 地圖圖層組件
```json
"115": {
    "id": 115, // Number; ID
    "index": "6f3842dd",  // String; 索引
    "map_config": {}, // Object; 詳見下方第2個資訊匡
    "chart_config": {
        "types": ["MapLegend"]
    }, // Object; 地圖層組件始終為此值
    "chart_data": [
        { 
            "color": "#c87a74", // String; hex色碼
            "type": "fill", // String; 地圖類型
            "name": "高潛勢", // String; 名稱
            "value": null, // Number || null; 數據點值（如果適用）
            "unit": null, // String || null; 數據點單位
        },
    ], // Array;
    "name": "土壤液化潛勢", // String; 組件名稱
    "source": "工務局", // String; 來源名稱
    "time_from": null, // String || null; 數據時間範圍（起始）
    "time_to": null, // String || null; 數據時間範圍（結束）
    "update_freq": null, // Number || null; 更新頻率
    "update_freq_unit": null,  // String; 更新頻率單位
	"contributors": ["tuic", ...] // Array of Strings; 貢獻者 id
}
```

> **i02**
> 如果組件具有空間資料，請輸入地圖配置物件。如果沒有，請輸入 `null`。地圖配置物件將在[稍後的文章](/front-end/supported-map-types#map-config)中詳細介紹。

> **i03**
> 所有一般組件都有統計資料，組件配置中應包含圖表配置物件。圖表配置物件將在[稍後的文章](/front-end/supported-chart-types#chart-config)中詳細介紹。

> **i04**
> 所有日期應使用以下格式：`YYYY-MM-DDThh:mm:ssTZD`（例如 2023-06-16T18:20:00+08:00）
