import { createApp } from 'vue'
import App from '@/App.vue'
import { router } from '@/router/index'
import { CraftCms } from '@query-api/vue'

const app = createApp(App)

app.use(router).use(CraftCms, {
  baseUrl: import.meta.env.VITE_CRAFT_BASE_URL,
  authToken: import.meta.env.VITE_CRAFT_AUTH_TOKEN,
  debug: false,
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
})

app.mount('#app')
