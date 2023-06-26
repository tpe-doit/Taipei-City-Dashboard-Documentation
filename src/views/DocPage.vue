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
                <a class="docpage-edit" href="/"><span>auto_fix_high</span>{{ t('edit-github') }}</a>
                <div class="docpage-nav">
                    <div>
                        <router-link v-if="previousPageIndex"
                            :to="`/${route.name}/${docsList[route.name][previousPageIndex]}`" class="prev">
                            <h5><span>keyboard_arrow_left</span>{{ t('previous') }}</h5>
                            <h6>{{ t(`${route.name}.${docsList[route.name][previousPageIndex]}`) }}</h6>
                        </router-link>
                    </div>
                    <router-link v-if="nextPageIndex" :to="`/${route.name}/${docsList[route.name][nextPageIndex]}`"
                        class="next">
                        <h5>{{ t('next') }}<span>keyboard_arrow_right</span></h5>
                        <h6>{{ t(`${route.name}.${docsList[route.name][nextPageIndex]}`) }}</h6>
                    </router-link>
                </div>
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
        padding: 2rem 1.5rem 3rem 3rem;
        overflow-y: scroll;

        h1 {
            margin-bottom: 1rem;
            font-size: 2rem;
        }
    }

    &-edit {
        display: flex;
        padding: 0.5rem 0 1.5rem;
        color: var(--color-highlight);
        font-size: var(--font-ms);
        border-bottom: solid 1px var(--color-border);

        span {
            align-self: flex-start;
            color: var(--color-highlight);
            font-family: var(--font-icon);
            margin-right: 0.5rem;
        }
    }

    &-nav {
        display: flex;
        justify-content: space-between;
        margin-top: 1.5rem;

        h5 {
            display: flex;
            align-items: center;
            color: var(--color-complement-text);
            font-size: var(--font-s);
            user-select: none;
        }

        span {
            font-family: var(--font-icon);
            color: var(--color-complement-text);
            font-size: var(--font-m);
        }

        h6 {
            margin-top: 4px;
            font-size: var(--font-m);
            font-weight: 400;
        }

        .next {
            text-align: right;

            h5 {
                justify-content: right;
            }
        }

    }
}
</style>
