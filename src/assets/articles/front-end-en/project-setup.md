## Quick Start

### Docker

**_looks_one_** Install [Docker](https://www.docker.com/products/docker-desktop/) on your computer and start running it.

**_looks_two_** Fork [the project repository](https://github.com/tpe-doit/Taipei-City-Dashboard-FE) then clone the project to your computer. Execute `pwd` (mac) or `cd` in the repository terminal to get the complete path.

**_looks_3_** Execute the following command in the system terminal and replace "&lt;repository path&gt;" with the path you got in step 2.

```bash
docker run -v &lt;repository path&gt;:/opt/Taipei-City-Dashboard-FE -p 80:80 -it node:18.18.1-alpine3.18  sh
```

**_looks_4_** Execute the following commands to enter the project folder and install packages.

```bash
cd /opt/Taipei-City-Dashboard-FE
npm install
```

**_looks_5_** You should now be able to locally host this project by executing `npm run dev` in the respository terminal.

### Local Environment

**_looks_one_** Download [Node.js](https://nodejs.org/en) on your computer.

**_looks_two_** Fork [the project repository](https://github.com/tpe-doit/Taipei-City-Dashboard-FE) then clone the project to your computer.

**_looks_3_** Execute `npm install` in the respository terminal

**_looks_4_** You should now be able to locally host this project by executing `npm run dev` in the respository terminal.

## Add .env Files

In the root folder of the repository, add a `.env` file. Copy the text below and paste it into the file.

```bash
BASE_URL=../..
VITE_APP_TITLE=臺北城市儀表板開源版 # The title of this application
VITE_MAPBOXTOKEN=pk... # Enter your Mapbox token here
VITE_MAPBOXTILE=mapbox:// # Enter Mapbox Tileset link to 3d building layers
```

### Mapbox Token

Fill in the variable `VITE_MAPBOXTOKEN` with a Mapbox access token which will allow the maps in this project to be rendered. Create your own Mapbox token by creating a Mapbox account and following [this guide](https://docs.mapbox.com/help/getting-started/access-tokens/).

> **t01**
> If you aren't using the default public token of your Mapbox account, remember to add https://localhost:80 to the list of urls supported by your token.

### Add 3D Taipei Buildings Model (Optional)

First, download the model file (`geojson`) [here](https://drive.google.com/file/d/1cMBrq1gmSNAioogFZNqA5IyAmhXoeLVs/view?usp=drive_link). Then, open Mapbox Studio and navigate to ["Tilesets"](https://studio.mapbox.com/tilesets/). Click on "New Tileset" and upload the downloaded file. After the upload has been completed, open the tileset and click on "share & use". Copy the "Tileset ID" and append it to the variable `VITE_MAPBOXTILE` in the `.env` file (paste it after "mapbox://").

Navigate back to the tileset on MapBox. On the left of the screen, you will see a sidebar titled "Vector Layers". Copy the name of the polygon layer (it should start with "tp_building_height") below the title. Then, return to project repository and navigate to `/src/assets/configs/mapbox/mapConfig.js`. Find a object called "TaipeiBuilding" and replace the parameter "source-layer" with the polygon layer name you copied.

## Extract Demo Map Data

Due to size restrictions, the directory containing the demo map data of this project is compressed. Extract the directory by running the following commands in the repository terminal.

```bash
cd ./public
tar xmzf mapData.tar.gz
```
