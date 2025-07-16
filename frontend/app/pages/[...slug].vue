<script setup lang="ts">
import type { ContentMapping } from '@query-api/nuxt'
import { CraftNotImplemented } from '#components'
import ViewHome from '~/components/content/ViewHome.vue'
import ViewNews from '~/components/content/ViewNews.vue'
import BlockHeadline from '~/components/content/BlockHeadline.vue'
import BlockRichText from '~/components/content/BlockRichText.vue'
import BlockImage from '~/components/content/BlockImage.vue'
import type { CraftPageBase } from '~/types/base'

const uri = useCraftUri()
const currentSite = useCraftCurrentSite()

const { data: entry, error } = useCraftEntry<CraftPageBase>()
  .uri(uri.value)
  .siteId(currentSite.value.id)
  .one()

if (error.value) {
  throw new Error(error.value.message)
}

const contentMapping: ContentMapping = {
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
</script>

<template>
  <CraftPage v-if="entry" :content="entry" :config="contentMapping" />
</template>
