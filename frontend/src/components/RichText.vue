<script setup lang="ts">
const { text } = defineProps<{ text: string }>()
</script>

<template>
  <div v-html="text"></div>
</template>
