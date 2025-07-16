<script setup lang="ts">
import type { CraftEntryTypeText } from '@/types/base'
import RichText from '@/components/RichText.vue'

const props = defineProps<CraftEntryTypeText>()
</script>

<template>
  <RichText v-if="props.richText" :text="props.richText" />
</template>
