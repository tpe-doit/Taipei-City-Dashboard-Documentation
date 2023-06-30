
## Adding Dashboards
In the user interface, expand the sidebar and click on the blue text. This will open up a dialog where the new dashboard name and icon are to be inputted. When the blue confirm button is clicked, the `createNewDashboard` method of the `contentStore` will be invoked. This method will create a new dashboard configuration using the inputted name and icon and then append it to the existing list of dashboards.

## Adding Components
In the user interface, locate the settings bar and click on the add components icon  ***add_chart*** beside the dashboard name. This will open up a dialog where a list of available components will be presented. Select as many components as needed and click on the blue confirm button in the upper right corner. When clicked, the `addComponents` method of the `contentStore` will be invoked. This method will append an array of selected component IDs to the existing list of component IDs of the current dashboard.

## Favorite or Unfavorite a Component
In the dashboard view, there is a heart icon ***favorite*** in the upper right corner of each component. If the icon is gray, clicking it will trigger the `favoriteComponent` method of the `contentStore`. This method will append the component to the favorites dashboard. Conversely, if the icon is red, clicking it will trigger the `unfavoriteComponent` method of the `contentStore`. This method will remove the component from the favorites dashboard.

## Delete Components
In the dashboard, there is a delete icon ***delete*** in the upper right corner of each component. Clicking the icon will invoke the `deleteComponent` method of the `contentStore`. This method will remove the component from the current dashboard.

## Dashboard Settings
In the user interface, locate the settings bar and click on the gear icon ***settings*** next to the add components icon. This will open up a dialog where dashboard settings could be made.

### Change Dashboard Name
Input the desired new dashboard name and click on the blue confirm button. When clicked, the `changeCurrentDashboardName` method of the `contentStore` will be invoked. This method will replace the original dashboard name with the newly inputted one.

### Delete Dashboard
Click on the check box to indicate your desire to delete the current dashboard. A red delete button will appear. When clicked the `deleteCurrentDashboard` method of the `contentStore` will be invoked. This method will remove the current dashboard’s configuration from the list of dashboards.

>**w01** 
>Adding dashboards, adding components, and dashboard settings are unavailable in the mobile version.