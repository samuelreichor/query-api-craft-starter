import { craftInit, CraftNotImplemented } from '@query-api/react'

// Import your React components that will be used in your Craft CMS Entries.
import ViewHome from '../components/content/ViewHome'
import ViewNews from '../components/content/ViewNews'
import BlockHeadline from '../components/content/BlockHeadline'
import BlockRichText from '../components/content/BlockRichText'
import BlockImage from '../components/content/BlockImage'

export const craftConfig = craftInit({
  baseUrl: import.meta.env.VITE_CRAFT_BASE_URL,
  authToken: import.meta.env.VITE_CRAFT_AUTH_TOKEN,
  contentMapping: {
    pages: {
      home: ViewHome, // Maps section home with ViewHome component.
      'news:news': ViewNews, // Maps section news entry with entry type news to the ViewNews component.
    },
    components: {
      headline: BlockHeadline, // Entry type blockHeadline will be rendered with the Headline component.
      text: BlockRichText,
      imageAndText: CraftNotImplemented, // Not implemented yet.
      image: BlockImage,
    },
  },
  siteMap: [
    {
      handle: 'en',
      path: '/',
      origin: 'http://localhost:5173',
      id: 1,
    },
    {
      handle: 'de',
      path: '/de',
      origin: 'http://localhost:5173/de',
      id: 2,
    },
    {
      handle: 'es',
      path: '/es',
      origin: 'http://localhost:5173/es',
      id: 3,
    },
  ],
})
