<script setup lang="ts">
import type { CraftEntryTypeImage } from '@/types/base'
import Image from '@/components/Image.vue'

const props = defineProps<CraftEntryTypeImage>()
</script>

<template>
  <Image v-if="props.image" ratio="3:2" :image="props.image" />
</template>
