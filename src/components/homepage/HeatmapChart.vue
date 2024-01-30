<!-- Developed by Taipei Urban Intelligence Center 2023-2024-->

<script setup>
import { computed, ref } from "vue";

const props = defineProps([
	"chart_config",
	"activeChart",
	"series",
]);

const heatmapData = computed(() => {
	let output = {};
	let highest = 0;
	let sum = 0;
	if (props.series.length === 1) {
		props.series[0].data.forEach((item) => {
			output[item.x] = item.y;
			if (item.y > highest) {
				highest = item.y;
			}
			sum += item.y;
		});
	} else {
		props.series.forEach((serie) => {
			for (let i = 0; i < props.chart_config.categories.length; i++) {
				if (!output[props.chart_config.categories[i]]) {
					output[props.chart_config.categories[i]] = 0;
				}
				output[props.chart_config.categories[i]] += +serie.data[i];

				if (+serie.data[i] > highest) highest = +serie.data[i];
			}
		});
		sum = Object.values(output).reduce(
			(partialSum, a) => partialSum + a,
			0
		);
	}

	output.highest = highest;
	output.sum = sum;
	return output;
});

const colorScale = computed(() => {
	const ranges = props.chart_config.color.map((el, index) => ({
		to: Math.floor(
			(heatmapData.value.highest / props.chart_config.color.length) *
			(props.chart_config.color.length - index)
		),
		from:
			Math.floor(
				(heatmapData.value.highest / props.chart_config.color.length) *
				(props.chart_config.color.length - index - 1)
			) + 1,
		color: el,
	}));
	ranges.unshift({
		to: 0,
		from: 0,
		color: "#444444",
	});
	return ranges;
});

const chartOptions = ref({
	chart: {
		offsetY: -30,
		stacked: true,
		toolbar: {
			show: false,
		},
	},
	dataLabels: {
		distributed: true,
		style: {
			fontSize: "12px",
			fontWeight: "normal",
		},
	},
	grid: {
		show: false,
	},
	legend: {
		show: false,
	},
	markers: {
		size: 3,
		strokeWidth: 0,
	},
	plotOptions: {
		heatmap: {
			enableShades: false,
			radius: 4,
			colorScale: {
				ranges: colorScale.value,
			},
		},
	},
	stroke: {
		show: true,
		width: 2,
		colors: ["#282a2c"],
	},
	tooltip: {
		custom: function ({ series, seriesIndex, dataPointIndex, w }) {
			// The class "chart-tooltip" could be edited in /assets/styles/chartStyles.css
			return (
				'<div class="chart-tooltip">' +
				"<h6>" +
				`${w.globals.seriesNames[seriesIndex]}-${w.globals.labels[dataPointIndex]}` +
				"</h6>" +
				"<span>" +
				`${series[seriesIndex][dataPointIndex]}` +
				`${props.chart_config.unit}` +
				"</span>" +
				"</div>"
			);
		},
	},
	xaxis: {
		axisBorder: {
			show: false,
		},
		axisTicks: {
			show: false,
		},
		categories: props.chart_config.categories
			? props.chart_config.categories
			: [],
		labels: {
			offsetY: 5,
			formatter: function (value) {
				return value.length > 7 ? value.slice(0, 6) + "..." : value;
			},
		},
		tooltip: {
			enabled: false,
		},
		type: "category",
	},
	yaxis: {
		max: function (max) {
			if (!props.chart_config.categories) {
				return max;
			}
			return heatmapData.value.highest;
		},
	},
});
</script>

<template>
	<div v-if="activeChart === 'HeatmapChart'" class="heatmapchart">
		<apexchart width="100%" height="335px" type="heatmap" :options="chartOptions" :series="series"></apexchart>
	</div>
</template>

<style scoped lang="scss"></style>
