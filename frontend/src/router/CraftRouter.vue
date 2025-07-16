<script setup lang="ts">
import { computed } from 'vue'
import { useRoute } from 'vue-router'
import {
  useCraftUrlBuilder,
  CraftNotImplemented,
  useCraft,
  type ContentMapping,
} from '@query-api/vue'
import { useCraftFetch } from '@/composables/useCraftFetch'

import ViewHome from '@/components/contents/ViewHome.vue'
import ViewNews from '@/components/contents/ViewNews.vue'
import BlockHeadline from '@/components/contents/BlockHeadline.vue'
import BlockRichText from '@/components/contents/BlockRichText.vue'
import BlockImage from '@/components/contents/BlockImage.vue'

const mapping: ContentMapping = {
  pages: {
    home: ViewHome,
    'news:news': ViewNews,
  },
  components: {
    headline: BlockHeadline,
    text: BlockRichText,
    imageAndText: CraftNotImplemented,
    image: BlockImage,
  },
}

const route = useRoute()
const { authToken } = useCraft()
const urlBuilder = useCraftUrlBuilder('entries')
const uri = computed(() => route.params.pathMatch || '__home__')
const queryUrl = computed(() => urlBuilder.uri(uri.value).buildUrl('one'))
const { data, loading, error } = useCraftFetch(queryUrl, authToken)
</script>

<template>
  <div v-if="loading">Loading…</div>
  <div v-else-if="error">Error: {{ error.message }}</div>
  <div v-else>
    <CraftPage :config="mapping" :content="data" />
  </div>
</template>
