<script setup lang="ts">
import { useCraftUrlBuilder, useCraft } from '@query-api/vue'
import type { CraftPageNews } from '@/types/base'
import { useCraftFetch } from '@/composables/useCraftFetch'
import Image from '@/components/Image.vue'

const url = useCraftUrlBuilder('entries')
  .section('news')
  .limit(3)
  .buildUrl('all')

const { authToken } = useCraft()
const {
  data: relatedNews,
  loading,
  error,
} = useCraftFetch<CraftPageNews[]>(url, authToken)
</script>

<template>
  <p v-if="loading">Loading...</p>
  <p v-else-if="error">Error: {{ error.message }}</p>
  <ul v-else class="newsGrid">
    <li v-for="news in relatedNews">
      <RouterLink :to="news.metadata.fullUri" class="newsCard">
        <h2>{{ news.translatablePlainText }}</h2>
        <Image v-if="news.image" :image="news.image" />
      </RouterLink>
    </li>
  </ul>
</template>

<style lang="css" scoped>
.newsGrid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 2rem;
  list-style-type: none;
  margin: 0;
  padding: 0;
}

.newsCard {
  display: flex;
  flex-direction: column-reverse;
}
</style>
