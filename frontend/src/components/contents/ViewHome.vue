<script setup lang="ts">
import { CraftArea } from '@query-api/vue'
import type { CraftPageHome } from '@/types/base'
import RichText from '@/components/RichText.vue'

const props = defineProps<CraftPageHome>()
</script>

<template>
  <div>
    <h1>{{ props.translatablePlainText }}</h1>
    <RichText v-if="props.richText" :text="props.richText" />
    <CraftArea v-if="props.contentBuilder" :content="props.contentBuilder" />
  </div>
</template>
