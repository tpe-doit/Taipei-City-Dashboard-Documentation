## Overview
Any new development on this project starts with an issue. To open an issue, navigate to the issues tab on [GitHub](https://github.com/igorho2000/Taipei-City-Dashboard-Public/issues/new/choose) and choose one of the three issue types. For an issue to be considered, the issue template for that type of request must be filled out in full. Issues that do not provide clear guidance or descriptions may be immediately closed as not actionable.

We recommend waiting for your issue to be approved before starting development. This is because all pull requests need to resolve at least one approved issue to be considered. The approval criteria for each issue type are explained below.

>**w01**
>If your issue is approved and you would like to work on it yourself, remember to fork the repository and work on any changes in your own repository. Do not clone the repository as non-collaborators don’t have direct push access to the official repository.

## Bug Fix Request
If any functionalities in this project don’t work as you expect, you should open a bug fix request. 

As long as the template is filled out in full and the bug is confirmed to exist, the issue will be approved to be worked on.

## New Feature Request
If you would like to add new functionality, chart types, map types, etc, you should open a new feature request.

New features should only be added if there are no existing solutions in the project and it will add significant value to the application. 

>**w02**
>Any new effects that can be achieved via tweaking the `chart_config` or `map_config` will not be approved as new features.

## New Component Request
If you would like to add a new component to the dashboard, you should open a new component request. If you simply have a suggestion (not a bug) regarding an existing component, please email us.

In the template for a new component request, you will be asked to fill in one or more data sources from [data.taipei](https://data.taipei). However, the cleanliness, format, or delivery method (file or API) of the dataset doesn’t matter. If the new component request is approved, you simply have to create a static component based on the data source and we will take care of the data cleaning and connection process once you’re done.

For a new component to be considered, it must meet the following criteria: ***looks_one*** doesn’t provide the same data as another component, ***looks_two*** is not overly complicated or simple,  ***looks_3*** is relevant for better Taipei City policy decisions, and ***looks_4*** relevant to the everyday live of Taipei City residents or visitors.

>**w03**
>If your new component requires a new chart or map effect that couldn’t be achieved via tweaking the settings in the `chart_config` or `map_config`, please also open a new feature request.
