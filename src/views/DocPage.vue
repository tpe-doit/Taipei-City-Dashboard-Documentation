<script setup>
import { computed } from 'vue';
import { useRoute } from 'vue-router';
import { useI18n } from 'vue-i18n'

import SideBar from '../components/SideBar.vue'
import DocPageContent from '../components/DocPageContent.vue'
import { docsList } from '../assets/docsList'

const route = useRoute()
const { t } = useI18n()
const props = defineProps(['id'])

const currentPageIndex = computed(() => {
    if (props.id[0] === '#') return null
    return docsList[route.name].findIndex((item) => item === props.id)
})
const previousPageIndex = computed(() => {
    if (currentPageIndex.value === -1 || currentPageIndex.value === 1) return null
    if (docsList[route.name][currentPageIndex.value - 1][0] === "#") return currentPageIndex.value - 2
    return currentPageIndex.value - 1
})
const nextPageIndex = computed(() => {
    if (currentPageIndex.value === -1 || currentPageIndex.value === docsList[route.name].length - 1) return null
    if (docsList[route.name][currentPageIndex.value + 1][0] === "#") return currentPageIndex.value + 2
    return currentPageIndex.value + 1
})
</script>

<template>
    <div class="docpage">
        <div class="docpage-positioner">
            <SideBar :docs="route.name" :docslist="docsList[route.name]" />
            <div v-if="currentPageIndex === -1" class="docpage-notfound">
                <h1>404</h1>
                <h2>{{ t('404-desc') }}</h2>
                <p>{{ t('404-message') }}</p>
            </div>
            <div v-else class="docpage-content">
                <h1>{{ t(`${route.name}.${id}`) }}</h1>
                <DocPageContent :docs="route.name" :id="id" :key="id" />
            </div>
        </div>
    </div>
</template>

<style scoped lang="scss">
.docpage {
    display: flex;
    justify-content: center;
    width: 100%;
    height: calc(100vh - 60px);

    &-positioner {
        width: 100%;
        height: 100%;
        display: grid;
        grid-template-columns: 224px 1fr;

        @media screen and (min-width: 1200px) {
            width: 1200px
        }
    }

    &-notfound {
        margin-top: 4rem;
        text-align: center;

        h1 {
            font-size: 5rem;
            font-weight: 400;
        }

        h2 {
            font-size: 1.2rem;
        }
    }

    &-content {
        padding: 2rem 1.5rem 2rem 3rem;
        overflow-y: scroll;

        h1 {
            margin-bottom: 1rem;
            font-size: 2rem;
        }
    }
}
</style>