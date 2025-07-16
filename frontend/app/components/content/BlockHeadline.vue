<script setup lang="ts">
import type { CraftEntryTypeHeadline } from '~/types/base'

const props = defineProps<CraftEntryTypeHeadline>()
</script>

<template>
  <component :is="props.selectHeadlineTag.value">
    {{ props.title }}
  </component>
</template>
