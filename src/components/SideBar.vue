<script setup>
import { useI18n } from 'vue-i18n'

const props = defineProps(['docs', 'docslist'])
const { t } = useI18n()

</script>

<template>
    <aside class="sidebar">
        <h5>{{ t(`${docs}.name`) }} {{ t('docs') }}</h5>
        <div v-for="item in docslist" :key="item">
            <h6 v-if="item[0] === '#'">{{ t(`${docs}.${item}`) }}</h6>
            <router-link v-else :to="`/${docs}/${item}`">{{ t(`${docs}.${item}`) }}</router-link>
        </div>
    </aside>
</template>

<style scoped lang="scss">
.sidebar {
    width: 200px;
    height: 100%;
    overflow-y: scroll;
    padding: 2rem 0 2rem 1.5rem;

    h5 {
        font-size: var(--font-m);
        user-select: none;
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
</style>