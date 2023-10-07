## Mechanism

Map filtering is a useful feature that allows users to filter out a subset of geographical data attached to a component using charts. To activate map filtering for a component, the `map_filter` parameter of the `chart_config` must be filled in. A breakdown of the array that should be passed into `map_filter` is shown below.

```json
"chart_config": {
    /* property: String; The property key that is to be used to filter geographical data */
    /* value: String; Values to be filtered */
    // The order should be the same as the chart categories (x-axis)
    // The values specified should be the same as in the geographical data, not chart data
    "map_filter": ["property", ["value1", "value2", ...]],
    ...
}
```

In charts that support map filtering, a variable called `selectedIndex` is declared to store the currently selected data point (`null` if none is selected). When the user clicks on a data point on the chart, a handler function is invoked that turns on a filter if the data point wasn’t previously selected and turns off the filter if previously selected.

Turning on a filter is achieved by calling the `addLayerFilter` method of the `mapStore`. This method takes three arguments, the index of the map layer to be filtered, the property to be filtered, and the value that should be left after filtering. Turning off the filter is achieved by calling the `clearLayerFilter` method of the `mapStore`. This method only takes the filtered map layer index as an argument.

> **i01**
> The index of a map layer is `'${the index specified in the map_config}-${map type}'`.

## Scope of Support

There are several requirements that need to be met for a component to be able to support map filtering.

Firstly, the statistical and geographical data of the component must be closely related. In other words, the categories (x-axis) of the statistical data should have a corresponding property in the geographical data.

> **i02**
> For example, the charts of a component may demonstrate the number of street lamps per district. In this case, the geographical data of this component must contain a property that specifies the district in order to support map filtering.

Next, the ordering of the categories (x-axis) of the statistical data should be constant and unchanged in order to properly pair with the geographical data.

Finally, only one map layer per component could be filtered.

### Supported Chart Types

Bar Chart, Bar Percent Chart, Column Chart, District Chart, Donut Chart, Guage Chart, Map Legend Chart, Treemap Chart, and Heatmap Chart.
