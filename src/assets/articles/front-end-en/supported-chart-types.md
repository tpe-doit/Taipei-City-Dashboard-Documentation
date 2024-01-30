## Chart Config

To correctly render chart data, several parameters need to be set and passed into the component configuration as mentioned in [this previous article](/front-end/introduction-to-components#component-configuration). The complete chart config object can be found below.

```json
"chart_config": {
    "color": ["#9c7a3e", …], // Array of Strings; Pass in at least one hex color code
    "types": ["BarPercentChart", …], // Array of Strings; Pass in 1-3 chart names
    "unit": "棟", // String || null; Unit of the data points
    "categories": [], // Array of Strings || null; Required for 3D and percentage data
},
```

## Chart Types

As mentioned in [this previous article](/front-end/prerequisites#apexcharts), most charts displayed in this project are rendered using Apexcharts with the exception of Metro Charts and District Charts.

The Vue components for each chart could be found in the folder `/src/components/charts`. For Apexcharts-based charts, their respective Vue components all contain a `chartOptions` object where various [Apexcharts parameters](https://apexcharts.com/docs/options/annotations/) could be passed in. Some chart Vue components also include parsing functions to clean chart data. This is to increase the interoperability between charts, allowing the same dataset to render multiple different chart types.

Below is a reference of English and Mandarin names for all chart types.

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
    MetroChart: "捷運行駛圖",
	HeatmapChart: "熱力圖",
	PolarAreaChart: "極座標圖",
	ColumnLineChart: "長條折線圖",
	BarChartWithGoal: "長條圖(目標)",
	IconPercentChart: "圖示比例圖"
};
```

> **i01**
> Charts are always referenced in English Pascal Case in the codebase, while all chart names displayed in the user interface are in Mandarin.
>
> The English-Mandarin reference file is located in `/src/assets/configs/apexcharts` as `chartTypes.js`.

### Bar Chart

Bar charts are usually utilized when there is a long list of data that needs to be displayed.

### Bar Percent Chart

Bar percent charts are used to visualize percentage values in a more concise and tight format compared to gauge charts.

### Column Chart

Column charts are used to display lists that contain 12 items or less.

### Donut Chart

Donut charts are used to display the percentage values of each list item. By default, the list items are sorted in descending order. If the list contains more than 6 items, the rest is summed and categorized as “other”.

### Guage Chart

Guage charts are used to visualize percentage values in a circular format. If there is more than one series, the average percentage value between series is calculated and displayed in the center.

### Radar Chart

Radar charts visualize the value differences within a series in a circular format.

### Timeline Separated Chart

Timeline separated charts are used to display time data. Each series is rendered separately in its own timeline.

### Timeline Stacked Chart

Timeline separated charts are used to display time data. Each series is stacked and summed to visualize aggregate values.

### Treemap Chart

Treemap charts visualize the value of each data point relative to the total by rendering different size rectangles.

> **t01**
> This project only uses treemap charts to visualize area data.

### Metro Chart

Metro charts display the density of metro train carriages on a given metro line. The darker the color, the denser the train carriage is. Metro charts are rendered 2D data but require the keys and values to be in a special format as displayed below.

```json
{
  "data": [
    // Serie 1: direction where station id is ascending
    {
      // Line ID: Same as Taipei Metro
      "name": "R",
      "data": [
        // key (x): String; Station ID
        // value (y): String; Density Levels 1-4 in carriage order
        { "x": "15", "y": "222222" },
        { "x": "05", "y": "111121" },
        ...
      ]
    },
    // Serie 2: direction where station id is descending
    {
      // Line ID: Same as Taipei Metro
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

### District Chart

District charts are used to display lists where the keys are Taipei City districts. By default, larger values are rendered with higher opacity.

### Heatmap Chart

Heatmap charts are used to display three-dimensional data in a grid form. Each grid cell is asigned a different color based on its value.

### Polar Area Chart **_new_**

Polar Area Charts are used to display three-dimensional data in circular pie slices.

### Column Line Chart **_new_**

Column line charts are used to display time series data where the first serie is displayed as columns and the second serie is displayed as a line.

### Bar Chart With Goal **_new_**

Bar chart with goal adds an additional dimension to ordinary bar charts, showing the target value of each category.

### Icon Percent Chart **_new_**

Icon percent charts displays percentage data via a grid of two separate icons.
