// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-05-15',
  devtools: { enabled: true },
  modules: ['@query-api/nuxt'],

  craftcms: {
    baseUrl: process.env.NUXT_CRAFT_BASE_URL ?? '',
    authToken: process.env.NUXT_CRAFT_AUTH_TOKEN ?? '',
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
  },
})
