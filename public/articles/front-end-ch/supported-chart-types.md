## 圖表配置

為了正確地呈現圖表，需要將圖表配置填入組件配置中的`chart_config`參數，詳細內容請參閱[這篇先前的文章](/front-end/introduction-to-components#component-configuration)。完整的圖表配置(Object)如下所示。

```json
"chart_config": {
    "color": ["#9c7a3e", …], // Array of Strings; 至少填入一個hex色碼
    "types": ["BarPercentChart", …], // Array of Strings; 填入 1-3 個圖表名稱（英文名）
    "unit": "棟", // String || null; 資料的單位
    "categories": [], // Array of Strings || null; 3D 和百分比資料才需要填寫
    "map_filter": ["鍵", ["篩選器1", "篩選器2"]] // Array || null; 詳細內容請參閱下方的第一個資訊匡
},
```

>**i01**
>地圖篩選(map_filter)參數應填入一個配置Array，使圖表能夠篩選所屬組件的地圖。這篇[後續文章](/front-end/map-filtering)將深入介紹機制的運作方式。
>
>建議在閱讀該文章之前，先閱畢所有有關圖表類型和地圖類型的文章。

## 圖表類型
如[此前一篇文章](/front-end/prerequisites#apexcharts)所述，本專案中大多數圖表是使用 Apexcharts 來呈現的，唯獨捷運行駛圖和行政區圖不在其列。

每個圖表的 Vue 元件位於 `/src/components/charts` 資料夾中。對於使用 Apexcharts 呈現的圖表，它們各自的 Vue 元件都包含一個 `chartOptions` 物件，可以填入各種[Apexcharts參數](https://apexcharts.com/docs/options/annotations/)。有些圖表 Vue 元件還包含清理函式(parsing functions)，用於清理圖表資料。這樣可以增加圖表之間的互通性，使相同的資料集可以呈現多種不同的圖表類型。

以下是所有圖表類型的英文和中文名稱的參照。
```js
{
    BarChart: "橫向長條圖",
    BarPercentChart: "長條圖(%)", 
    ColumnChart: "縱向長條圖", 
    DonutChart: "圓餅圖",
    GuageChart: "量表圖", 
    RadarChart: "雷達圖", 
    TimelineSeparateChart: "折線圖(比較)",
    TimelineStackedChart: "折線圖(堆疊)",
    TreemapChart: "矩形圖", 
    DistrictChart: "行政區圖", 
    MetroChart: "捷運行駛圖"
};
```

>**i02**
>圖表在程式庫中都是使用英文 Pascal Case，而在使用者介面中顯示的圖表名稱則為其中文名。
>
>英文-中文對照檔案位於 `/src/assets/configs/apexcharts` 資料夾中，名為 `chartTypes.js`。

### 橫向長條圖
橫向長條圖通常用於需要呈現多筆條列資料的情況。

### 長條圖(%)
長條圖(%)用於呈現百分比值，相較於量表圖更為簡潔。

### 縱向長條圖
縱向長條圖用於顯示 12 個以下項目的列表。

### 圓餅圖
圓餅圖用於顯示列表項目的百分比值。預設情況下，列表項目按降序排列。如果列表包含超過 6 個項目，其餘項目將被合併為「其他」。

### 量表圖
量表圖以圓形格式呈現百分比值。如果有多個系列(series)，將計算系列之間的平均百分比值並顯示在中央。

### 雷達圖
雷達圖以圓形格式顯示系列內的各值差異。

### 折線圖(比較)
折線圖(比較)用於顯示時間資料。每個系列獨立呈現。

### 折線圖(堆疊)
折線圖(堆疊)用於顯示時間資料。每個系列將被堆疊呈現合計值。

### 矩形圖
矩形圖用於以不同大小的矩形來呈現每個數據點相對於總數的值。

>**t01**
>本專案僅使用矩形圖來視覺化土地面積資料。

### 捷運行駛圖
捷運行駛圖顯示給定捷運路線捷運車廂的壅擠程度。顏色越深，車廂越擁擠。捷運行駛圖使用 2D 數據呈現，但需要以特殊key-value格式，如下所示。

```json
{
  "data": [
    // 系列1：車站 ID 遞升的行駛方向
    {
      // 線路 ID：同台北捷運
      "name": "R",
      "data": [
        // 鍵 (x)：String；車站 ID
        // 值 (y)：String；車廂密度級別 1-4 按車廂順序
        { "x": "15", "y": "222222" },
        { "x": "05", "y": "111121" },
        ...
      ]
    },
    // 系列2：車站 ID 遞降的行駛方向
    {
      // 線路 ID：同台北捷運
      "name": "R",
      "data": [
        { "x": "14", "y": "111111" },
        { "x": "11", "y": "111111" },
        ...
      ]
    }
  ]
}
```

### 行政區圖
行政區圖用於顯示key為台北市各行政區的列表。預設情況下，越大的數值會越不透明。 
