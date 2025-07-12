import { craftInit, CraftNotImplemented } from '@query-api/next'
import ViewHome from '@/components/content/ViewHome'
import ViewNews from '@/components/content/ViewNews'
import BlockHeadline from '@/components/content/BlockHeadline'
import BlockRichText from '@/components/content/BlockRichText'
import BlockImage from '@/components/content/BlockImage'

export const craftConfig = craftInit({
  baseUrl: process.env.NEXT_PUBLIC_CRAFT_BASE_URL ?? '',
  authToken: process.env.NEXT_PUBLIC_CRAFT_AUTH_TOKEN ?? '',
  debug: true,
  siteMap: [
    {
      handle: 'en',
      path: '/',
      origin: 'http://localhost:3000',
      id: 1,
    },
    {
      handle: 'de',
      path: '/de',
      origin: 'http://localhost:3000/de',
      id: 2,
    },
    {
      handle: 'es',
      path: '/es',
      origin: 'http://localhost:3000/es',
      id: 3,
    },
  ],
  contentMapping: {
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
  },
})
