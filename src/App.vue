<script setup>
import { onBeforeMount, onMounted } from 'vue';
import { useAppStore } from './store/appStore';
import { useI18n } from 'vue-i18n';

import NavBar from './components/NavBar.vue';

const appStore = useAppStore();
const { locale } = useI18n();

onBeforeMount(() => {
	appStore.checkIfMobile();
});

onMounted(() => {
	document.title = appStore.lang === 'en' ? 'Docs | Taipei City Dashboard' : '文件｜城市聯合儀表板';
	locale.value = appStore.lang;
});
</script>

<template>
	<div :class="`app ${appStore.mode}`">
		<NavBar />
		<RouterView></RouterView>
	</div>
</template>

<style scoped>
.app {
	background-color: var(--color-background);
	height: 100%;
	max-height: 100vh;
	min-width: 100vw;
	overflow-x: hidden;
}
</style>
