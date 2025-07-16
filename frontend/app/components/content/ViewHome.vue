<script setup lang="ts">
import type { CraftPageHome } from '~/types/base'

const props = defineProps<CraftPageHome>()
</script>

<template>
  <div>
    <h1>{{ props.translatablePlainText }}</h1>
    <RichText v-if="props.richText" :text="props.richText" />
    <CraftArea v-if="props.contentBuilder" :content="props.contentBuilder" />
  </div>
</template>
