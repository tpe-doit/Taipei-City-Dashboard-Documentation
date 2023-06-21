## Install Locally

Fork the official repository, then clone or download the codebase to your computer. Then, open up the terminal for the repository and run `npm install`.

## Add .env Files

In the root folder of the repository, add a `.env` file. Copy the text below and paste it into the file. 

```js
BASE_URL=../..
VITE_APP_TITLE=城市聯合儀表板 // The title of this application
VITE_MAPBOXTOKEN= // Enter your Mapbox token here
```

Finally, fill in the variable `VITE_MAPBOXTOKEN` with a Mapbox access token which will allow the maps in this project to be rendered. Create your own Mapbox token by creating an account and following [this guide](https://docs.mapbox.com/help/getting-started/access-tokens/).

## Run Locally

In the repository terminal, run `npm run dev`.