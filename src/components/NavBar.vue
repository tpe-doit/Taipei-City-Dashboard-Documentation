<script setup>
import { onMounted, ref } from 'vue';
import { useAppStore } from '../store/appStore';
import { useI18n } from "vue-i18n";

const { BASE_URL } = import.meta.env;
const appStore = useAppStore();
const { locale } = useI18n();

const mode = ref(true);

function toggleLang() {
	const changeTo = appStore.lang === 'en' ? 'ch' : 'en';
	localStorage.setItem("lang", changeTo);
	locale.value = changeTo;
	appStore.toggleLang(changeTo);
	location.reload();
}

onMounted(() => {
	mode.value = appStore.mode === 'dark' ? true : false;
});
</script>

<template>
	<div class="navbar">
		<a class="navbar-logo" :href="`${BASE_URL}/`">
			<img src="../assets/images/TUIC.svg" alt="tuic logo"
				:style="{ filter: appStore.mode === 'dark' ? 'invert(1)' : 'none' }" />
			<div>
				<h1>臺北城市儀表板文件</h1>
				<h2>Taipei City Dashboard Documentation</h2>
			</div>
		</a>
		<div class="navbar-control">
			<button @click="toggleLang"><span>translate</span></button>
			<label class="toggleswitch">
				<label for="light-dark-mode-toggle" :style="{ display: 'none' }">light-dark-mode-toggle</label>
				<input type="checkbox" id="light-dark-mode-toggle" @change="appStore.toggleMode" v-model="mode">
				<span class="toggleswitch-slider"></span>
			</label>
		</div>
	</div>
</template>

<style scoped lang="scss">
.navbar {
	height: 60px;
	width: 100vw;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid var(--color-border);
	background-color: var(--color-component-background);
	user-select: none;

	&-logo {
		display: flex;
		// position: relative;
		// overflow: visible;

		h1 {
			font-weight: 500;
		}

		h2 {
			font-size: var(--font-s);
			font-weight: 400;
		}

		img {
			height: 45px;
			width: 22.94px;
			margin: 0 var(--font-m);

			// &.nationalday {
			// 	position: absolute;
			// 	top: -2px;
			// 	left: 218px;
			// 	width: auto;
			// 	height: 2rem;
			// }
		}
	}

	&-control {
		display: flex;
		align-items: flex-end;
		margin-right: var(--font-m);

		button {
			margin-right: var(--font-s);

			span {
				color: var(--color-complement-text);
				font-family: var(--font-icon);
				font-size: var(--font-m);
				transition: color 0.2s;
			}

			&:hover span {
				color: var(--color-normal-text)
			}
		}
	}
}
</style>