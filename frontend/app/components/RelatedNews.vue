<script setup lang="ts">
import type { CraftPageNews } from '~/types/base'

const currentSite = useCraftCurrentSite()
const { data: relatedNews, error } = useCraftEntry<CraftPageNews[]>()
  .siteId(currentSite.value.id)
  .section('news')
  .limit(3)
  .all()
</script>

<template>
  <ul class="newsGrid">
    <li v-for="news in relatedNews">
      <NuxtLink :to="news.metadata.fullUri" class="newsCard">
        <h2>{{ news.translatablePlainText }}</h2>
        <Image v-if="news.image" :image="news.image" />
      </NuxtLink>
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
