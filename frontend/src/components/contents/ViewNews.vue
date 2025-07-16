<script setup lang="ts">
import { CraftArea } from '@query-api/vue'
import type { CraftPageNews } from '@/types/base'
import RichText from '@/components/RichText.vue'
import RelatedNews from '@/components/RelatedNews.vue'

const props = defineProps<CraftPageNews>()
</script>

<template>
  <div>
    <h1>{{ props.translatablePlainText }}</h1>
    <RichText v-if="props.richText" :text="props.richText" />
    <CraftArea v-if="props.contentBuilder" :content="props.contentBuilder" />

    <h2>Related News</h2>
    <RelatedNews />
  </div>
</template>
