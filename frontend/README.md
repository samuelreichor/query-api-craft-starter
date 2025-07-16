# Craft Query API x Vue

This is a minimal starter example for the Craft Query API and a Vue frontend.

## Overview

This is a quick overview of all important files:

```bash
├── src
│   ├── components
│   │   ├── contents
│   │   │   ├── BlockHeadline.vue
│   │   │   ├── BlockImage.vue
│   │   │   ├── BlockRichText.vue
│   │   │   ├── ViewHome.vue
│   │   │   └── ViewNews.vue
│   │   ├── Image.vue
│   │   ├── RelatedNews.vue
│   │   └── RichText.vue
│   ├── composables
│   │   └── useCraftFetch.ts // fetch data form query api
│   ├── router
│   │   ├── CraftRouter.vue // // catch all route component to render craft page
│   │   └── index.ts // here is the actual catch all route defined
│   ├── App.vue
│   └── main.ts // here is the query-api config defined
```

## Setup

> Be sure that you have craft up and running before you start. There is a README.md in the project root with instructions.

1. cd into the `frontend` folder with `cd ./frontend`.
2. Install dependencies with `npm install`.
3. Start development server with `npm run dev`.
4. Your frontend should be running on http://localhost:3000.

## Documentation

If you want to install it an existing project you can have a look at this [basic usage guide](https://samuelreichor.at/libraries/vue-craftcms/usage/basic-usage).

## Further Resources

- [Craft Query API](https://samuelreichor.at/libraries/craft-query-api): The Craft CMS Plugin that powers this great stuff.
- [Vue SDK](https://samuelreichor.at/libraries/vue-craftcms): Find more information about the Vue SDK.
- [Nuxt SDK](https://samuelreichor.at/libraries/nuxt-craftcms): Find more information about the Nuxt SDK.
- [JS SDK](https://samuelreichor.at/libraries/js-craftcms-api): Find more information about the JS SDK.

## Support

If you encounter bugs or have feature requests, [please submit an issue](https://github.com/samuelreichor/query-api-craft-starter/issues/new). Your feedback helps improve the starter!
