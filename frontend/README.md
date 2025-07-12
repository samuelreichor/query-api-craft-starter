# Craft Query API x Next

This is a minimal starter example for the Craft Query API and a Next frontend.

## Overview

This is a quick overview of all important files:

```bash
├── app
│   ├── [[...slug]]
│   │   └── page.tsx // catch all route to render correct craft page
│   └── layout.tsx // provides config and request context globally
├── components
│   ├── content
│   │   ├── BlockHeadline.tsx
│   │   ├── BlockImage.tsx
│   │   ├── BlockRichText.tsx
│   │   ├── ViewHome.tsx
│   │   └── ViewNews.tsx
│   ├── Image.tsx
│   ├── RelatedNews.tsx // usage in a client component
│   └── RichText.tsx
├── libs
│   └── query-api.ts // here is the craft query config
├── types
│   └── base.ts // generated types from query api
└── middleware.ts // enables craft preview and shares request context
```

## Setup

> Be sure that you have craft up and running before you start. There is a README.md in the project root with instructions.

1. cd into the `frontend` folder with `cd ./frontend`.
2. Install dependencies with `npm install`.
3. Double check if the `WEBSITE_URL` environment variable in the project root is set to the development server url (http://localhost:3000).
4. Start development server with `npm run dev`.

## Documentation

If you want to install it an existing project you can have a look at this [getting started guide](https://samuelreichor.at/libraries/query-api-next/get-started/quick-start).

## Further Resources

- [Craft Query API](https://samuelreichor.at/libraries/craft-query-api): The Craft CMS Plugin that powers this great stuff.
- [Next SDK](https://samuelreichor.at/libraries/query-api-next): Find more information about the Next SDK.
- [React SDK](https://samuelreichor.at/libraries/query-api-react): Find more information about the React SDK.
- [JS SDK](https://samuelreichor.at/libraries/js-craftcms-api): Find more information about the JS SDK.

## Support

If you encounter bugs or have feature requests, [please submit an issue](https://github.com/samuelreichor/query-api-craft-starter/issues/new). Your feedback helps improve the starter!
