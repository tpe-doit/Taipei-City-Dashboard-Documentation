## Running the Project Locally

**_looks_one_** Fork [the project repository](https://github.com/tpe-doit/Taipei-City-Dashboard) then clone the project to your computer. Open the repository with VSCode or your preferred code editor.

**_looks_two_** Start the Docker engine via opening Docker Desktop or the command line. Then, open the repository terminal and change the directory to `/docker` (`cd docker`).

**_looks_3_** In the docker directory, there is an `.env.template` file. Copy that file and rename it to `.env`. Most of the variables have already been pre-filled and some are labeled `[External Dev Don't Need to Fill]`. Please do not change the values of those variables. However, you will need to fill in the following 8 variables yourself:

```bash
## Docker image tag
...

## Frontend ENV Configs
...
VITE_MAPBOXTOKEN= # See Info 1
VITE_MAPBOXTILE= # See Info 2
...

## Server ENV Configs
...
DASHBOARD_DEFAULT_Email= # Creates a default admin account. Fill in any email.
DASHBOARD_DEFAULT_PASSWORD= # Fill in any password for the admin account.

## DB Configs
# Dashboard data DB
...
DB_DASHBOARD_PASSWORD= # Fill in a password of your choice for the dashboard database.
...

# Dashboard Manager DB
...
DB_MANAGER_PASSWORD= # Fill in a password of your choice for the manager database.
...

# Redis Configs
...

# pgadmin
PGADMIN_DEFAULT_EMAIL= # Creates a default pgadmin account. Fill in any email.
PGADMIN_DEFAULT_PASSWORD= # Fill in any password for the pgadmin account.
...
```

> **i01**
> Fill in the variable `VITE_MAPBOXTOKEN` with a Mapbox access token which will allow the maps in this project to be rendered. Create your own Mapbox token by creating a Mapbox account and following [this guide](https://docs.mapbox.com/help/getting-started/access-tokens/). If you aren't using the default public token of your Mapbox account, remember to add https://localhost:8080 to the list of urls supported by your token.

> **i02**
> This variable adds a 3D building layer to the base map. This step is optional and you may leave the variable blank if you choose.
>
> First, download the model file (`geojson`) [here](https://drive.google.com/file/d/1cMBrq1gmSNAioogFZNqA5IyAmhXoeLVs/view?usp=drive_link). Then, open Mapbox Studio and navigate to ["Tilesets"](https://studio.mapbox.com/tilesets/). Click on "New Tileset" and upload the downloaded file. After the upload has been completed, open the tileset and click on "share & use". Copy the "Tileset ID" and append it to the variable `VITE_MAPBOXTILE` in the `.env` file (paste it after "mapbox://").
>
>Navigate back to the tileset on MapBox. On the left of the screen, you will see a sidebar titled "Vector Layers". Copy the name of the polygon layer (it should start with "tp_building_height") below the title. Then, return to project repository and navigate to `/src/assets/configs/mapbox/mapConfig.js`. Find a object called "TaipeiBuilding" and replace the parameter "source-layer" with the polygon layer name you copied.

**_looks_4_** In the terminal, execute the following commands one by one to first create a docker network, then build the images and finally start the containers.

Create a docker network:

```bash
docker network create --driver=bridge --subnet=192.168.128.0/24 --gateway=192.168.128.1  br_dashboard
```

Build DB related images:

```bash
docker-compose -f docker-compose-db.yaml up -d
```

Set up the frontend and backend environments: (The containers created via this command are temporary and will stop running after the setup is complete.)

```bash
docker-compose -f docker-compose-init.yaml up -d
```

Run the frontend and backend services:

```bash
docker-compose up -d
```

>**t01**
> We recommend checking the status of the containers by running `docker ps` or the Docker Desktop dashboard and ensuring that there are no issues. 
>
> If you encounter any issues, please check the docker logs. Common mistakes include not filling in the `.env` file correctly, not having the Docker engine running, not having the correct network settings, or not removing the `/docker/db-data` folder (if present) before running the setup.

## Adding Demo Data

**_looks_one_** Open pgAdmin (https://localhost:8889/login) and log in with the credentials you filled in the `.env` file. Then, right-click on "Servers" in the top left corner and select "Register" > "Server...". In the "General" tab, fill in "Name" with `dashboard`. Then, in the "Connection" tab, fill in "Host name/address" with `postgres-data`, "Username" with `postgres`, and "Password" with the password you filled in the `.env` file (`DB_DASHBOARD_PASSWORD`). Click "Save" and then "Connect".

**_looks_two_** Repeat the first step but in the "General" tab, fill in "Name" instead with `dashboardmanager`. And in the "Connection" tab, fill in "Host name/address" instead with `postgres-manager`, and "Password" with the password you filled in the `.env` file (`DB_MANAGER_PASSWORD`). Click "Save" and then "Connect".

**_looks_3_** In the "dashboard" server check if a database called `dashboard` has been created. If not, right-click on "Databases" and select "Create" > "Database...". Fill in "Database" with `dashboard` and click "Save". Repeat the same process for the "dashboardmanager" server but fill in "Database" with `dashboardmanager`.

**_looks_4_** In the "dashboard" server, right-click on the `dashboard` database and select "...Restore". In the "Filename" field, click on the ***folder*** button. In the dialog, click on "..." > "Upload" then drop [this file (dashboard-demo.sql)](/public/data/dashboard-demo.sql) into the box. After selecting the uploaded file, click "Select" and "Restore". Repeat the same process for the "dashboardmanager" server but upload [this file (dashboardmanager-demo.sql)](/public/data/dashboardmanager-demo.sql) instead. After the restoration is complete, you can check "Schemas" > "public" > "Tables" to see if the data has been successfully added.

> **i03**
> The two files are sql files that contain demo data for the dashboard and dashboard manager databases. Due to role permissions, errors may be thrown when restoring the databases. As long as the data has been successfully added, these errors can be ignored.

**_looks_5_** Open docker desktop and click on the `dashboard-be` container. Then, click on "Terminal" and run the following command to migrate the remaining schemas for the dashboard manager database:

```bash
go run main.go migrateDB
```

**_looks_6_** The project should now be running locally. Open your browser and navigate to [https://localhost:8080](https://localhost:8080). You should see the dashboard homepage. If you encounter any issues, please check the docker logs or the console in the browser.

## Postman

To better test the APIs of this product, we recommend using Postman. The collection file for the APIs can be found <a href="/public/data/dashboard_postman.json" download>here</a>. After downloading the file, open Postman and click on "Import" > "Choose Files" and select the downloaded file. The collection will then be added to your Postman workspace. Also import the environment file <a href="/public/data/dashboard_postman_env.json" download>here</a> and select the environment in the top right corner of Postman.