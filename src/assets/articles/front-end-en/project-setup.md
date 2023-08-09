## Install Locally

Fork the official repository, then clone or download the codebase to your computer. Next, open the terminal for the repository and run `npm install`.

## Add .env Files

In the root folder of the repository, add a `.env` file. Copy the text below and paste it into the file.

```js
BASE_URL=../..
VITE_APP_TITLE=臺北城市儀表板開源版 // The title of this application
VITE_MAPBOXTOKEN=pk... // Enter your Mapbox token here
VITE_MAPBOXTILE=mapbox:// // Enter Mapbox Tileset link to 3d building layers
```

### Mapbox Token

Fill in the variable `VITE_MAPBOXTOKEN` with a Mapbox access token which will allow the maps in this project to be rendered. Create your own Mapbox token by creating a Mapbox account and following [this guide](https://docs.mapbox.com/help/getting-started/access-tokens/).

> **t01**
> If you aren't using the default public token of your Mapbox account, remember to add https://localhost:5173 to the list of urls supported by your token.

### Add 3D Taipei Buildings Model (Optional)

First, download the model file (`geojson`) [here](https://drive.google.com/file/d/1cMBrq1gmSNAioogFZNqA5IyAmhXoeLVs/view?usp=drive_link). Then, open Mapbox Studio and navigate to ["Tilesets"](https://studio.mapbox.com/tilesets/). Click on "New Tileset" and upload the downloaded file. After the upload has been completed, open the tileset and click on "share & use". Copy the "Tileset ID" and append it to the variable `VITE_MAPBOXTILE` in the `.env` file (paste it after "mapbox://").

## Add Demo Map Data

Due to size restrictions, the demo map data of this project is stored elsewhere. Download the directory [here](https://drive.google.com/drive/folders/17E-4BRcuHpXg9o5evOWlwY4fI_06VWRd?usp=sharing) and extract it. Then, add the directory to the `/public` folder of this project.

## Run Locally

In the repository terminal, run `npm run dev`.
