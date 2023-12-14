## Introduction
This project was transformed into a static application from the dynamic internal version due to security and privacy concerns. However, it was designed to be easy to transition back into a dynamic application in just a few steps. 

This guide will cover three methods of transitioning this project back into a semi-dynamic or completely dynamic application.

## Dynamic Data Source
The first scenario is to partially or completely hook up the project to dynamic data sources but not implement a backend. Currently, all of the statistical or geographical data contained in the project are stored locally in the application. However, the methods used to retrieve the data could be easily modified to accept dynamic sources.

>**t01** 
>If dynamic data is all you need and it’s not necessary to implement any other backend functions, we recommend also completing the modifications specified in the [previous article](/front-end/create-a-static-application) (create a static application).

The following guide will use retrieving chart data as an example. The steps could also be applied to historical data and geographical data.

### Step 1 Modify Chart Config
For components that accept dynamic data from a remote source, add a “source” parameter to the chart config that will specify the API from which data will be fetched.

```json
"chart_config": {
    "color": ["#2e999b", "#80e3d4", "#1f9b85", "#a5ece0"],
    "types": ["ColumnChart", "RadarChart", "BarPercentChart"],
    "unit": "人",
    "categories": [],
    // Add a source parameter
    "source": "https://.../api/.../..." // String; API of the data source
},
```

### Step 2 Modify the ContentStore
Add the following code snippet to the `setCurrentDashboardChartData` method of the `contentStore`. This will first check if there is a source parameter in the chart_config to determine from where to fetch the data.

```js
setCurrentDashboardChartData() {
    this.currentDashboard.content.forEach((component, index) => {

        // Code Snippet Start
        const chartDataSource = this.currentDashboard.content[index].chart_config.source
          ? this.currentDashboard.content[index].chart_config.source
          : `/chartData/${component.id}.json`;
        // Code Snippet End

        axios
            .get(chartDataSource) // Replace link with "chartDataSource"
            .then((rs) => {
                ...
            })
    })
}
```

### Step 3 Parse the Data (Optional)
If the data format of the remote source is not in the supported formats, you will need to write additional parsing functions to render the data correctly. It’s recommended to complete this action in `contentStore` as well and store the parsing functions in `src/assets/utilityFunctions`.

Now, the application is capable of accepting dynamic data for charts. Apply the above principles to do the same for historical and geographical data.

## Custom Backend Setup
The second scenario is connecting this project to a custom backend. This guide will not go into detail regarding how the backend should be set up but simply recommend some functionalities that should be included in the backend to maximize the potential of this project. 

This guide will also not go through how to implement APIs step by step. For most potential dynamic functions, fetching functions were already put in place in anticipation of an API URL. The implementation method is similar to the steps laid out in the guide to [accept dynamic data](/front-end/create-a-dynamic-application#dynamic-data-source).

### Recommended Functionalities
**User Authentication**

To create a personalized experience for every user, user authentication is a must. We recommend handling authentication and storing user info in the `authStore`. 

>**i01** 
>Since user authentication systems vary quite a bit, there isn’t a prebuilt login interface or path control in this project. 

**Centralized Storage of Dashboards and Component Specs**

Dashboards and components are the essential building blocks of this project. As such, it is important to store their related data in an easily accessible and clear format.

**Pre-formatted Data**

We highly recommend completing any data parsing in the backend before sending it to the frontend application. This will reduce the loading on user devices and make it easier to maintain the frontend application. Efforts should be taken to ensure that a simple `GET` API without additional headers would be sufficient to get all the data needed in the correct format.

**Ability to Modify Dashboards**

We recommend implementing all the functionalities laid out in this [previous article](/front-end/modifying-a-dashboard) (modifying a dashboard). This will allow users to make the most out of this project.

**Store Saved Locations (optional)**

A minor functionality is the ability to save viewing angles in the map view. This is useful when the user routinely checks certain geographical areas. If you don’t require this functionality, follow [step 7 in the previous article](/front-end/create-a-static-application#step-7-mapcontainer.vue) to remove it.

### Recommended API Specs
**`GET` APIs**

For `GET` APIs, follow the configuration formats laid out in previous articles. It is also recommended to reference the various json files currently used to provide static data to the application. By building your `GET` APIs in existing formats, instant compatibility could be achieved.

**`POST`, `PUT`, `DELETE` APIs**

For other types of APIs, just keep it simple and try to mimic the existing behavior of the static application.

## Connect with Taipei City Dashboard Backend
Coming soon...

This is the third scenario. Work on releasing the open-source version of the backend of Taipei City Dashboard is still ongoing.