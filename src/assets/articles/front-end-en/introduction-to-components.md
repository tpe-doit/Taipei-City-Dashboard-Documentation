## Overview

Components are collections of data that make up dashboards. All components, contain statistical data that can be displayed in a chart or graphical form. Components can also optionally contain geographical and historical data.

## Component Configuration

Each component has two unique identification codes: ID and Index. The ID is a unique serial number for the component, while the Index is an English string that makes it easier to identify the content of the component. Component configurations (Object) are returned in an array. The complete list of parameters can be found below.

[`GET` `/api/v1/component`](/back-end/component-config-apis) [`DB` `dashboardmanager.components`](/back-end/components-db)

_[Try out the API in our API Tester](/api)_

```json
[{
    "id": 7, // Number; Unique serial number
    "index": "patrol_criminalcase", // String; index
	"chart_config": {},  // Object; see 1st info box below for details
	"query_data": "time", // two_d || three_d || time || percent || map_legend; chart data type
    "map_config": null, // Object || null; see 2nd info box below for details
	"map_filter": null, // Object || null; see 3rd info box below for details
	"history_config": null, // Object || null; see 4th info box below for details
    "name": "刑事統計", // String; component name
    "source": "警察局", // String; source name
    "time_from": "halfyear_ago", // String; see 5th info box below for details
    "time_to": "now", // "now" || null;
    "update_freq": 1, // Number || null; update frequency
    "update_freq_unit": "month", // String; update frequency unit
    "short_desc": "...", // String; short description
    "long_desc": "...", // String; long description
    "use_case": "...", // String; use case description
    "links": ["https://…", ...], // Array of Strings || null; raw data sources
    "tags": ["..."], // Array; of tags that describe the component
	"contributors": ["tuic", ...] // Array of Strings; contributor id
}]
```

> **i01**
> All components have statistical data and a chart configuration object should be included in the component configuration. The chart configuration object will be explained in greater detail in [this later article](/front-end/supported-chart-types#chart-config).

> **i02**
> If the component has geographical data, pass in a map configuration object. If not, pass in `null`. The map configuration object will be explained in greater detail in [this later article](/front-end/supported-map-types#map-config).

> **i03**
> Pass in a map filter configuration object to support map filtering via charts. If not, pass in `null`. The map filter configuration object will be explained in greater detail in [this later article](/front-end/map-filtering).

> **i04**
> If the component has historical data, pass in a historical data configuration object. If not, pass in `null`. The historical data configuration object will be explained in greater detail in [this later article](/front-end/history-data).

> **i05**
> For components that display static or demo data, pass in `static` or `demo`. For components that display the newest data available, pass in `current`. For components that display data since a certain time ago, pass in `day_ago`, `week_ago`, `month_ago`, `quarter_ago`, `halfyear_ago`, `year_ago`, `twoyear_ago`, `fiveyear_ago`, `tenyear_ago`, or `max`. For components that display data since the beginning of a certain time, pass in `day_start`, `week_start`, `month_start`, `quarter_start` or `year_start`.
>
> The application will calculate the specific dates and times to query the back-end for data.
