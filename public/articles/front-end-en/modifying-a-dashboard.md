
## Adding Dashboards
In the user interface, expand the sidebar and click on the blue text. This will open up a dialog where the new dashboard name and icon are to be inputted. When the blue confirm button is clicked, the `createNewDashboard` method of the `contentStore` will be invoked. This method will create a new dashboard configuration using the inputted name and icon and then append it to the existing list of dashboard.

## Adding Components
In the user interface, locate the settings bar and click on the add components icon beside the dashboard name. This will open up a dialog where a list of available components will be presented. Select as many components as needed and click on the blue confirm button in the upper right corner. When clicked, the `addComponents` method of the `contentStore` will be invoked. This method will append an array of selected component IDs to the existing list of component IDs of the current dashboard.

## Dashboard Settings
In the user interface, locate the settings bar and click on the gear icon next to the add components icon. This will open up a dialog where dashboard settings could be made.

### Change Dashboard Name
Input the desired new dashboard name and click on the blue confirm button. When clicked, the `changeCurrentDashboardName` method of the `contentStore` will be invoked. This method will replace the original dashboard name with the newly inputted one.

### Delete Dashboard
Click on the check box to indicate your desire to delete the current dashboard. A red delete button will appear. When clicked the `deleteCurrentDashboard` method of the `contentStore` will be invoked. This method will remove the current dashboard’s configuration from the list of dashboards.

>**w01** 
>All of the above methods are unavailable in the mobile version.