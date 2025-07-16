<script setup lang="ts">
import type { CraftEntryTypeImage } from '~/types/base'

const props = defineProps<CraftEntryTypeImage>()
</script>

<template>
  <Image v-if="props.image" ratio="3:2" :image="props.image" />
</template>
