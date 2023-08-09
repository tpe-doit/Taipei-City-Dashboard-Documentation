## /src
/assets
The `/assets` folder stores static items such as global styles, utility functions, images, chart configurations, map configurations, and the icon font used throughout the project.

### /views
The `/views` folder stores the Vue components `Dashboard.vue` and `Map.vue`, which are the templates for the dashboard view and map view, respectively.

### /components
The `/components` folder stores smaller Vue components that make up the user interface. The root folder contains templates for the navigation bar, sidebar, and settings bar.

The `/components` sub-folder stores templates for components; the `/charts` sub-folder stores various chart templates; the `/map` sub-folder stores any map-related Vue components; the `/dialogs` sub-folder stores templates for all the dialogs; and the `/utilities` sub-folder stores any other Vue component that doesn't belong to any other category.

### /store
The `/store` folder is where all the Pinia stores are located. Global state management is achieved in this application by referencing data and invoking methods located in these stores.

The `authStore` stores user authentication-related information and methods; the `contentStore` is in charge of getting and storing dashboards and components; the `mapStore` stores the Mapbox map instance and related methods; the `dialogStore` controls which dialogs are shown and when.

>**w01**
>User authentication was implemented in the internal government version of this project. However, the code related to this feature was removed from the open-source version due to security and privacy concerns. Currently, the authStore provides a guide and several empty functions that could be utilized if a custom backend is connected in the future. Read more on how to do that [here](/front-end/create-a-dynamic-application).

### /router
The `/router` folder contains the configuration file for Vue-router. There are only two primary routes in this project, `/dashboard` and `/mapview`. Both routes take a query parameter, `index`, that indicates which dashboard is requested.

## /public
The `/public` folder stores static data that have larger file sizes and are accessed in a way that mimics requests to a backend.

The `/dashboards` sub-folder stores a list of all dashboard configurations and a list of all component configurations; the `/chartData` sub-folder stores demo chart data for each component; the `/historyData` sub-folder stores demo historical data for applicable components; the `/mapData` sub-folder stores demo geographical data for applicable components; and the `/js` and `/images` sub-folders store other assets and configs used.
