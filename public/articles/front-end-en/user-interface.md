## Overview
Before diving into the codebase of this project, a thorough understanding of the user interface is recommended. 

There are two primary user interfaces in this project, the dashboard view (/dashboard) and the map view (/mapview). Both user interfaces are optimized for different screen sizes, including mobile. In both user interfaces, a navigation bar (1), sidebar (2), and settings bar (3) are present. Components in various configurations are also present in each view to display information.

![User Interface Dashboard Page](/images/front-end/user-interface-1.png)

> **i01**
> In frontend frameworks, components can also refer to reusable templates that could be used to build user interfaces. For this project, we feel that the word “component” is the most appropriate name to give to the elements that make up a dashboard. 
>
> To disambiguate between the two terms, frontend framework components will be henceforth always referred to as “Vue components”, while dashboard components will simply be referred to as “components”.

## /dashboard
The dashboard view shows components in their basic chart configuration. Here, users can get a comprehensive glance at all the statistics a component has to offer. 

In the dashboard view, a “more information” (4: 更多資訊 ***arrow_circle_right***) option is also available in the bottom right corner of most components. Clicking on the button will show a dialog that displays a more detailed description of the component, including historical data (5) if available.

![User Interface Component](/images/front-end/user-interface-2.png)

## /mapview
The map view by default lists all components in a collapsed form on the right (6) and displays a larger map (7) to the left. By clicking on the toggle (8), the component expands and renders geographical data (if available) to the map. To learn more about a data point on the map, simply click and a helpful popup (9) will appear.

![User Interface Map Page](/images/front-end/user-interface-3.png)

## Mobile Version
In the mobile version, several features have been modified or removed to cope with space or memory constraints. 

To navigate between the dashboard view and the map view, click on the toggle (10) on the right of the settings bar. To navigate between different dashboards, click on the icon (11: ***arrow_drop_down_circle***) to the left of the dashboard name and a navigational popup will appear. The more information option is disabled in mobile versions.

In the map view, click on the layers icon (12: ***layers***) to open up a popup from which layers to be rendered could be selected. The ability to view both charts and map layers at the same time in map view is disabled in mobile versions.

![User Interface Mobile Version](/images/front-end/user-interface-4.png)