<script setup>
import { useI18n } from 'vue-i18n'
import { useAppStore } from '../store/appStore';

const props = defineProps(['docs', 'docslist'])
const { t } = useI18n()
const appStore = useAppStore()

const appVersion = import.meta.env.VITE_APP_VERSION
</script>

<template>
    <aside :class="{ sidebar: true, 'sidebar-open': appStore.sidebar }">
        <h5>{{ t(`${docs}.name`) }} {{ t("docs") }} <code>{{ appVersion }}</code></h5>
        <div v-for="item in docslist" :key="item">
            <h6 v-if="item[0] === '#'">{{ t(`${docs}.${item}`) }}</h6>
            <router-link v-else :to="`/${docs}/${item}`" @click="appStore.toggleSidebar(false)">{{ t(`${docs}.${item}`)
            }}</router-link>
        </div>
    </aside>
</template>

<style scoped lang="scss">
.sidebar {
    width: 200px;
    padding: 2rem 0 2rem 1.5rem;
    overflow-y: scroll;

    @media screen and (max-width: 850px) {
        position: absolute;
        z-index: 10;
        left: -250px;
        background-color: var(--color-component-background);
        height: calc(100% - 127px);
        padding-right: 1.5rem;
        border-radius: 0 8px 8px 0;
        border: solid 1px var(--color-border);
        transition: left 0.2s ease-in-out
    }

    h5 {
        font-size: var(--font-m);
        user-select: none;

        code {
            font-family: var(--font-code);
            font-weight: 400;
            background-color: var(--color-component-background);
            padding: 2px 4px;
            border-radius: 5px;
            color: var(--color-normal-text)
        }
    }

    h6 {
        color: var(--color-complement-text);
        font-size: var(--font-s);
        border-top: solid 1px var(--color-border);
        padding-top: var(--font-m);
        margin-top: var(--font-m);
        margin-bottom: 8px;
        user-select: none;
    }

    a {
        font-size: var(--font-ms);
        font-weight: 400;
        color: var(--font-normal-text)
    }

    .router-link-exact-active {
        color: var(--color-highlight);
        font-weight: 600;
    }
}

@media screen and (max-width: 850px) {
    .sidebar-open {
        left: 0;
    }
}
</style>