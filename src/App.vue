<script setup>
import { computed, onMounted, ref } from 'vue';
import axios from 'axios';
import { marked } from 'marked'
import hljs from 'highlight.js'
import { useAppStore } from './store/appStore';
import { useI18n } from 'vue-i18n'

import NavBar from './components/NavBar.vue'

const appStore = useAppStore()
const { t, locale } = useI18n()
const text = ref('')
const parsed = computed(() => {
  return marked.parse(text.value)
})

onMounted(() => {
  document.title = '城市聯合儀表板文件';
  locale.value = appStore.lang;
  axios.get('/articles/demo.md').then(rs => {
    text.value = rs.data
    setTimeout(() => {
      hljs.highlightAll();
    }, 50)
  })
})
</script>

<template>
  <div :class="`app ${appStore.mode}`">
    <NavBar />
    <p>{{ t('hi') }}</p>
    <div v-html="parsed"></div>
    <RouterView></RouterView>
  </div>
</template>

<style scoped>
.app {
  background-color: var(--color-background);
  min-height: 100vh;
  min-width: 100vw;
  overflow-x: hidden;
}
</style>
