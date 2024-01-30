import { createApp } from "vue";
import "./assets/styles/globalStyles.css";
import "./assets/styles/toggleswitch.css";
import "./assets/styles/chartStyles.css";
import "highlight.js/styles/foundation.css";
import App from "./App.vue";

import router from "./router";
import { createPinia } from "pinia";
import { createI18n } from "vue-i18n";
import VueApexCharts from "vue3-apexcharts";
import { en } from "./assets/lang/en";
import { ch } from "./assets/lang/ch";

import DistrictChart from "./components/homepage/DistrictChart.vue";
import DonutChart from "./components/homepage/DonutChart.vue";
import BarChart from "./components/homepage/BarChart.vue";
import TreemapChart from "./components/homepage/TreemapChart.vue";
import ColumnChart from "./components/homepage/ColumnChart.vue";
import HeatmapChart from "./components/homepage/HeatmapChart.vue";
import PolarAreaChart from "./components/homepage/PolarAreaChart.vue";

const app = createApp(App);

app.use(router);
const pinia = createPinia();
app.use(pinia);
const i18n = createI18n({
	locale: "en",
	allowComposition: true,
	messages: {
		en: en,
		ch: ch,
	},
});
app.use(i18n);
app.use(VueApexCharts);

app.component("DistrictChart", DistrictChart);
app.component("DonutChart", DonutChart);
app.component("BarChart", BarChart);
app.component("TreemapChart", TreemapChart);
app.component("ColumnChart", ColumnChart);
app.component("HeatmapChart", HeatmapChart);
app.component("PolarAreaChart", PolarAreaChart);

app.mount("#app");
