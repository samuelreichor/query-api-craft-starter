# Craft Query API x React

This is a minimal starter example for the Craft Query API and a React Vite frontend.

## Overview

This is a quick overview of all important files:

```bash
├── components
│   ├── content
│   │   ├── BlockHeadline.tsx
│   │   ├── BlockImage.tsx
│   │   └── BlockRichText.tsx
│   │   └── ViewHome.tsx
│   │   └── ViewNews.tsx
│   ├── Image.tsx
│   └── RichText.tsx
├── libs
│   └── query-api.ts // here is your query api config
├── types
│   └── base.ts // generated types from query api
├── App.tsx // here we provide the query api config and current router location globally
├── CraftRouter.tsx // catch all route to render the correct view
├── main.tsx
```

## Setup

> Be sure that you have craft up and running before you start. There is a README.md in the project root with instructions.

1. cd into the `frontend` folder with `cd ./frontend`.
2. Install dependencies with `npm install`.
3. Start development server with `npm run dev`.
4. Your frontend should be running on `http://localhost:3000`.

## Documentation

If you want to install it an existing project you can have a look at this [getting started guide](https://samuelreichor.at/libraries/query-api-react/get-started/quick-start).

## Further Resources

- [Craft Query API](https://samuelreichor.at/libraries/craft-query-api): The Craft CMS Plugin that powers this great stuff.
- [React SDK](https://samuelreichor.at/libraries/query-api-react): Find more information about the React SDK.
- [JS SDK](https://samuelreichor.at/libraries/js-craftcms-api): Find more information about the JS SDK.

## Support

If you encounter bugs or have feature requests, [please submit an issue](https://github.com/samuelreichor/query-api-craft-starter/issues/new). Your feedback helps improve the starter!
