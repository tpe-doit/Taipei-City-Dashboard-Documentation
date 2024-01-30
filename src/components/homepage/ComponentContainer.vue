<!-- Developed by Taipei Urban Intelligence Center 2023-2024-->

<script setup>
defineProps({
	content: { type: Object },
});
</script>

<template>
	<div class="componentcontainer">
		<div class="componentcontainer-header">
			<div>
				<h3>
					{{ content.name }}
				</h3>
				<h4>{{ content.source }}</h4>
			</div>
		</div>
		<div class="componentcontainer-chart">
			<component :is="content.chart_config.types" :activeChart="content.chart_config.types"
				:chart_config="content.chart_config" :series="content.chart_data">
			</component>
		</div>
	</div>
</template>

<style scoped lang="scss">
.componentcontainer {
	height: 370px;
	max-height: 370px;
	width: calc(100% - var(--font-m) * 2);
	max-width: calc(100% - var(--font-m) * 2);
	display: grid;
	grid-template-rows: 50px 1fr;
	position: relative;
	padding: var(--font-m);
	border-radius: 5px;
	background-color: #282a2c;

	@media (max-width: 1050px) {
		width: 370px;
		height: 350px;
		max-height: 350px;
	}

	&-header {
		display: flex;
		justify-content: space-between;

		h3 {
			display: flex;
			align-items: center;
			font-size: 1.25rem;
			color: white
		}

		h4 {
			color: var(--color-complement-text);
			font-size: 1rem;
			font-weight: 400;
		}
	}

	&-chart {
		height: 100%;
		position: relative;
		padding-top: 5%;

		p {
			color: var(--color-border);
		}
	}
}
</style>
